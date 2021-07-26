 # Aggregate Business Invariants

首先 Aggregate 應負責其邊界內的 [Invariants](spaces/ddd/invariants.md), 再來 Aggregate 本身也應該是 Transaction Boundary, 因此 Aggregate 必須也可以保證在多個 transactions 下的正確性。

透過 [Optimistic Concurrency Control](spaces/umani/optimistic-concurrency-control.md) 我們可以確保在多個 Transactions 下都可以**依照順序的**執行完成, 且不會互相影響, 簡單來就是說每個 Transaction 都需要確認資料沒有被其他的 Trnasaction 異動過。

## Last Event Number

從 Stream 建立出 Aggregate 時, 必須記住 last event number, 在將新的 event 放入 Stream 前, 必須檢查當前的 Stream 的 event number

![](spaces/event-sourcing/attachments/occ-last-event-number.png)

當 event number 一樣時代表沒有其他 Transaction 有增加 event, 這時我們才可以寫入新的 event

![](spaces/event-sourcing/attachments/occ-add-new-event.png)

反之當不一樣時, 就不能寫入新的 event 進 Stream

### Source Code Example

![](spaces/event-sourcing/attachments/ooc-source-code.png)

## Kafka

也許 Kafka offset 也可以用, 但可能要確認一下 Kafka 是否已經支援了