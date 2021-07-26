# Dealing with Errors

假設過去有一個 Event 的內容發生問題, 該如何處理呢? 千萬不可以直接 update event store, 畢竟 event store 為 [Single Source of Truth](spaces/umani/single-source-of-truth.md), 既然是事實怎麼可以修改?

## Use Compensation Events

我們透過補償事件來處理錯誤

### Partial Compensation

透過 **Corrected Event** 來修正過去的**部分**錯誤, 例如我們想把 `Euro` 文字改成 `EUR`:

![](/spaces/event-sourcing/attachments/partial-compensation.png)

這個模式時間久了, 在回顧部分 Stream 時不容易的去了解前因後果, 而是必須還要查看完整的 Stream 才知道原因

### Full Compensation

透過 **Cancelled Event** 來完整的取消過去的錯誤, 情境一樣我們只想把 `Euro` 文字改成 `EUR`, 但這次是取消之前的錯誤 event:

![](/spaces/event-sourcing/attachments/full-compensation.png)

這個模式下, 以 Stream 的角度來看是比較明確的且比較清楚的
