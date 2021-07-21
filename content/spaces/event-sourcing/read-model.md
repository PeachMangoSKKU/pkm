[+home](+home)

# Read Model

Read Model 可以說是在 Event Store 中, 特定的 Event of Stream 的產出。

以程式來看, 大概像是:

```java
var readModel = Stream.of(events)
					  .leftFold(handlers)
```

這個產出, 通常也就是會被儲存在每個服務自己的 db 中 

![readmodel](/spaces/event-sourcing/attachments/readmodel.png)