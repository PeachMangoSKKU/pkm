# Create a Snapshot of the Stream

時間一久當 Stream 越來越大以後, 程式該如何應對 Large Stream 呢? 基本上我們的程式不處理 Large Stream!

而是我們透過 [Copy Transform](spaces/event-sourcing/copy-transform.md) 方式來建立 Strea 的 Snapshot, 來讓程式維持讀取 Small Stream!