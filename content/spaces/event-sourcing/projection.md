[+home](+home)

# Projection

Projection 就是用來處理 [event](spaces/ddd/event.md) 的程式邏輯, 基本上就是一推 Event Handlers!

例, 我們有以下 event:
- `UserCreated`
- `UserOnboarded`
- `UserRelocated` 

則 **Current User Projection** 的內容大概是:

![projection](/spaces/event-sourcing/attachments/projection.png)

而產出會是 [Aggregate](spaces/ddd/aggregate.md)

![projection-aggregate](/spaces/event-sourcing/attachments/projection-aggregate.png)
