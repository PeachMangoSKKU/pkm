# Assigning Pods

在部署 Deployment 時, 有些情況我們會希望 Kubernetes 依照我們的需求來安排部署的 Node, 例如:

- 當我們開多份 Replicas 時, 希望這些 Replicas 時儘量不要安排到同一個 Node 上
- 不同的部署但性質相雷同的程式, 例如資源需求 (如 CPU 運算) 較高等, 希望儘量不要安排到同一個 Node 上

## Affinity

在 `spec.affinity` 下一共有 `podAffinity` (正向) 或 `podAntiAffinity` (反向), 這是用來約束 Kubernetes 該怎麼安排 Pod 到 Node 上, 這兩種 affinity 中都有兩種 type 可以使用:

- `requiredDuringSchedulingIgnoredDuringExecution` - **Hard requirement**, 要求 Kubernetes 依照設定安排, 沒滿足就不部署 Pod
- `preferredDuringSchedulingIgnoredDuringExecution` - **Soft requirement**, 建議 Kubernetes 儘量滿足設定安排, 無法滿足仍要部署 Pod

## Use Case

> 以下我們範例是一個常見的需求: **建議** Kubernetes 將多個 replicas 儘量分散到不同的 Node 中

首先我們在 SLKE 中部署一個 deployment 作為範例, 先設定一個 replica 就好:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nginx
spec:
  selector:
    matchLabels:
      run: my-nginx
  replicas: 1
  template:
    metadata:
      labels:
        run: my-nginx
    spec:
      affinity:
        podAntiAffinity:
          preferredDuringSchedulingIgnoredDuringExecution:
            # 可設多條件, 其中 weight 範圍為 1-100
            # 部署於 k8s 會將滿足條件的 weight 累加, 總分最高的 node 視為 most preferred 
            - weight: 1
              podAffinityTerm:
                labelSelector:
                  matchExpressions:
                  - key: run
                    operator: In
                    values:
                      - my-nginx
                # 設定 Node 分群的依據
                # 可透過 kubectl get nodes --show-labels 查看有哪些 label 可用
                topologyKey: "kubernetes.io/hostname"
      containers:
      - name: my-nginx
        image: nginx
        ports:
        - containerPort: 80
```

以上設定會建議 Kubernetes 在部署時, 以 Node 的 `kubernetes.io/hostname` 做群組, 在每個群組中都儘量不重複部署 label 為 `run: my-nginx` 的 pod, 由於 Node `kubernetes.io/hostname` 不可能重複, 也就是上述設定以白話文來說, 一但開多個 replicas, 就是儘量將不同的 pod 分散在不同的 node 中

接著我們查看一下現在 SLKE 有多少 Node:

```sh
$ kubectl get node
NAME            STATUS   ROLES                  AGE    VERSION
k8s-master-91   Ready    control-plane,master   161d   v1.20.1
k8s-master-92   Ready    control-plane,master   161d   v1.20.1
k8s-master-95   Ready    control-plane,master   161d   v1.20.1
k8s-worker-40   Ready    <none>                 161d   v1.20.1
k8s-worker-41   Ready    <none>                 161d   v1.20.1
k8s-worker-44   Ready    <none>                 161d   v1.20.1
k8s-worker-46   Ready    <none>                 161d   v1.20.1
k8s-worker-53   Ready    <none>                 161d   v1.20.1
```

以上會發現 worker node (未標記 control-plane 的 node 即 worker node) 一共有 5 台, 因此我們在對剛剛部署的 deployment 做些調整:

```sh
$ kubectl scale --replicas=5 deployment my-nginx
```

最後觀察 pod 所開的 node, 會發現所有的 pod 都開在不同的 Node `kubernetes.io/hostname` 上

```sh
$ kubectl get pod -l run=my-nginx -o wide
NAME                       READY   STATUS    RESTARTS   AGE   IP              NODE            NOMINATED NODE   READINESS GATES
my-nginx-fc5f9bc4b-229mt   2/2     Running   0          41s   10.244.21.92    k8s-worker-40   <none>           <none>
my-nginx-fc5f9bc4b-66q7j   2/2     Running   0          41s   10.244.166.81   k8s-worker-53   <none>           <none>
my-nginx-fc5f9bc4b-k7jps   2/2     Running   0          20m   10.244.9.213    k8s-worker-44   <none>           <none>
my-nginx-fc5f9bc4b-m6vrz   2/2     Running   0          41s   10.244.253.98   k8s-worker-46   <none>           <none>
my-nginx-fc5f9bc4b-s5bk2   2/2     Running   0          42s   10.244.52.163   k8s-worker-41   <none>           <none>
```

## Reference

- [Assigning Pods to Nodes](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/)
