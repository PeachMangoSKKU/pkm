# General Understanding 

![event-sourcing-flow](/spaces/event-sourcing/attachments/event-sourcing-flow.png)

在經過 [DDD](moc/ddd-moc.md) 的洗禮之後, 我們會有很多 [Event](spaces/ddd/event.md), 包含了 Event type 跟 Data。我們會將這些 Event **有順序性**的儲存在 Stream 中 (通常就採用 Event 的建立順序)，然後再將這些 Stream 儲存到 EventStore 中, 並為每個 Event 產生獨一無二的 ID。

接著我們會透過 [Projection](spaces/event-sourcing/projection.md) 將 Stream 中的所有 Events 去計算出 Aggregate 的 current state, 為了方便使用, 我們也可以將 current state 儲存成一個 [Read Model](spaces/event-sourcing/read-model.md)