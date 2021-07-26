# Optimistic Concurrency Control

樂觀鎖 (簡稱 OCC), 是一種並行控制的方法。

簡單的實作方式就是, 找資料其中一個欄位作為判斷條件, 如 `@Version` 或是 `最後修改時間`, 在資料異動時將該欄位一併作為 Where 條件去執行, 若 `update row = 0` 即代表資料已過期。

如此我們就可以確保同時多個 Transaction 針對同一筆資料異動的順序性, 不會發生後蓋前等狀況。