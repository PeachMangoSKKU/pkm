---
title: "cdc"
---

Change Data Capture 縮寫 CDC, 意指如何發現並捕獲資料源 (Source Database) 的資料變化, 常見的解決方案有:

- Log-based
- ETL
- Trigger-based

## Log-based

![](/spaces/umani/attachments/cdc-log-based.png)

透過工具監控 Source Database 的 Transaction Log, 常見的工具如: [Debezium](https://debezium.io/)

### Challenges
1. 需配合所挑選的 Tool 的相關設定, 如 Debezium 官方[所要求的權限](https://debezium.io/documentation/reference/connectors/oracle.html#setting-up-oracle) 可能客戶的 DBA 會認爲過大
2. 部分 Database 需要配合設定, 如 Oracle 需要啓用 Archive Log, 若客戶本身沒使用這些功能, 則開啓後對客戶環境的穩定度是一個挑戰

## ETL

![](/spaces/umani/attachments/cdc-etl.png)

透過約定好的 Audit Columns (如 `createdDate`, `lastModifiedDate`) 來進行 ETL

實作一個 CDC App, 定期以 Audit Columns 作爲判斷依據來查詢 Source Database, 將捕捉到的異動資料同步到 Target Database 中

### Challenges
1. 要被監控的 Table 都必須要有 Audit Columns 
2. 人爲操作 DB 也必須都要更新 Audit Columns 
3. 視業務需求, 需要有額外的 Source Database 刪除資料的處理流程
4. Source Database 會有額外的效能消耗給 CDC App 定期的查詢
5. CDC App 定期查詢的週期決定了 Target Database 的資料時間差

## Trigger-based

![](/spaces/umani/attachments/cdc-trigger-based.png)

透過在 Source Database 中設定 Database Trigger 來監控目標 Table

當目標 Table 資料發生異動時會觸發 Trigger, Trigger 的內容是將資料異動內容寫入 Shadow Table

實作一個 CDC App, 定期查詢 Shadow Table 將發現的異動內容同步到 Target Database 中


### Challenges
1. 需要 Database 有支援 Trigger
2. 監控 Table 跟 Shadow Table 建議在同一個 Database Instance
3. Source Database 會有額外的效能消耗給 Trigger
4. CDC App 定期查詢的週期決定了 Target Database 的資料時間差