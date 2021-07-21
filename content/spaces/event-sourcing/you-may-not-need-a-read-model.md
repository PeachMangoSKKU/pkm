# You may NOT need a read model
[Read Model](spaces/event-sourcing/read-model.md) 會有一些 Trade off:
- 最終一致性
- 該如何 Replays and Rebuilds
- 該如何 Re-Deliveries
- Read Db 的維運成本

換個角度想, 如果不要有 Read Model 呢?

我們如果在讀取 Event Store 時, 就依照 Aggregate ID 過濾 Stream, 把 Stream 最小化

![stream-per-aggregate](/spaces/event-sourcing/attachments/stream-per-aggregate.png)

回到使用端, 在 runtime 要取得 current state 時, 程式在即時的去運算出 current state 的 Aggregate

![aggregate-read-from-stream](/spaces/event-sourcing/attachments/aggregate-read-from-stream.png)

由於我們把 Stream 最小化了, 效能仍不錯, 而且也沒有了那些 Trade off!

如果需要透過條件去查詢, 可能要使用到一些 Event Store 所提供 Category Projection 了!

![aggregate-read-from-projection](/spaces/event-sourcing/attachments/aggregate-read-from-projection.png)

在 Event Store 中就可以先將 Event 分類後再讀出 Stream 了!

> What if... 我們用的 event store 沒有 category projection ;\