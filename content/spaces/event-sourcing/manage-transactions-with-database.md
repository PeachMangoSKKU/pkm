# Manage Transactions with a database

這種狀況我們可以選擇在 Event Store 之前放一個 Database 去管理 Transaction

我們使用一個 Database 擋在 Event Store 之前, 再使用 [CDC](spaces/+incubation/cdc.md) 抓取 Event Stream 到 Event Store 中, 在個 Database 即稱為 **Transaction Database**

以下圖為例

- Transaction Database 使用 Couchbase
- Event Store 使用 Kafka

![](https://cdn.confluent.io/wp-content/uploads/Screenshot-2017-08-02-08.39.55-1024x865.png)

當 Order Service 接到 Bug Command 時, 寫的是 Couchbase, 在這邊管理多個 Order Service Instance 或多個 Thread 的 Transaction

當 Couchbase 資料有變化時, 會被 CDC (Kafka connect) 發佈到 Kafka 中

## Trafe Off

這個方式要付出的大概就是, 你需要多維護一個 **Production Grage** 的 Database!