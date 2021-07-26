# Double Write

Producer 將兩個版本的 event 都發佈, 而我們預期 Consumer 應該要可以自己判斷該處理哪個版本的 event

![](/spaces/event-sourcing/attachments/versino-double-write.png)