# Copy Transform

首先先定義多久要 Transform 一次, 例如我們每年做一次, 這樣我們會在前一年的最後增加 Deactivated event, 並再次年增加一個 Initialized event, 並將兩個 event 連接起來

![](/spaces/event-sourcing/attachments/copy-transform.png)

- 這兩個基本上是不同的 Stream 
- 對應 Queue, 會是不同的 Kafak topic

因此 App 在讀取到 Deactivated event 該怎麼自動切換到所連接的 Initialized event 的 Stream 呢?

> 這邊大概是最精華所在, 講解也沒透露他們怎麼做, 但如果可以重啟 App 來做切換那會簡單很多