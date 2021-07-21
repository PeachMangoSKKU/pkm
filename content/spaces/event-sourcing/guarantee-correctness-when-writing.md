# Guarantee Correctness when writing

由於 Read Model 所提供的資訊, 同時有機會被多個服務或是 Thread 使用, u有個經典的提款問題: 兩個 Thread 在檢查同一帳戶餘額時都是通過的, 但一起下提款 Command 時, 你的帳戶就超支囉!

![read-withdrawn](/spaces/event-sourcing/attachments/read-withdrawn.png)

## Manage Transactions with a database

這種狀況我們需要的是在 Event Store 之前放一個 Transaction Database 去管理 Transaction

我們使用一個 Database 擋在 Event Store 之前, 在使用 [[CDC]] 抓取 Event Stream 到 Event Store 中, 在個 Database 即稱為 **Transaction Database**

以下圖為例

- Transaction Database 使用 Couchbase
- Event Store 使用 Kafka

![](https://cdn.confluent.io/wp-content/uploads/Screenshot-2017-08-02-08.39.55-1024x865.png)

當 Order Service 接到 Bug Command 時, 寫的是 Couchbase, 在這邊管理多個 Order Service Instance 或多個 Thread 的 Transaction

當 Couchbase 資料有變化時, 會被 CDC (Kafka connect) 發佈到 Kafka 中

## Reference

- [Messaging as the Single Source of Truth](https://www.confluent.io/blog/messaging-single-source-truth/)