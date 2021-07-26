# Handle Versioning

在 Java 世界中, 我們通常透過 Jar 來 share source code, 假設現在是 1.0.0 jar 同時給 Producer 跟 Consumer 使用: 

![](/spaces/event-sourcing/attachments/version-v1.png)

當 Producer 調整 event 開始發佈 2.0.0 時, 而所有的 Consumer 又還沒完全跟上時, 我們該怎麼辦?

![](/spaces/event-sourcing/attachments/version-v2.png)

## Solutions

- [Double Write](spaces/event-sourcing/double-write.md)
- [Upcaster](spaces/event-sourcing/upcaster.md)
- Or... we don't upgrade event

## Don't Upgrade event 
任何 Event schema 的異動都必須確保新的 schema 可以被舊的 handler 讀取使用，這樣你才可以異動之, 若不行, 它就是一個新的 Event, 你應該要有對應的新 handler!

反之, 新的 handler 也應該要可以讀取處理舊的 schema, 若不行, 他也就是一個新的 Event, 你應該也要有對應的新 handler!

> 大部分情狀只有在增加欄位時才比較有機會相容於新舊 handler

### Event Schema

在 Event 中我們通常使用 Weak Schema (一般使用 [JSON Schema](spaces/umani/json-schema.md)), 就以新增欄位來說:

任何舊版 handler 在 deserialized 時新的 schema 時, 因 week schema 特性會自動的忽略新欄位, 並正常的執行舊邏輯, 這不會有什麼問題。

那如果是新的 handler 要處理舊的 schema 時, 就必須給予新欄位預設值跟邏輯, 這就好像在關聯式資料庫, 當我們要擴充欄位時, 也必須給予預設值讓程式正常的執行一樣, 當然, 如果你給不了預設值跟邏輯, 那它就是一個新的 event 了!

 