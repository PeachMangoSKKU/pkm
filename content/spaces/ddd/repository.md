# Repository

一個 [[spaces/ddd/aggregate]] 對應一個 Repository

## 兩種類型

依據 DDD 紅皮書的分析，Repository有兩種：
- Collection-like
- CRUD-like
    
Martin Follower PoEAA書中的repository是collection-like，但一般我們常用的是CRUD-like，需要額外呼叫save儲存aggregate。所以當你決定使用Repository pattern，你要決定使用哪一種風格的repository。

## 的目

Repository 的目的是要隔離領域物件(aggregate)與資料庫操作。

從領域物件的角度來看 ，根本不需要知道 Repository 的實作, Ex: 有哪些
Entity? 對應多少個 Data Object?

## Pattern

通常是分析到最後，才需要關心Repository的實作, 在 DDD 加上 Clean Architecture 的情況下, 實作套 [[spaces/ddd/bridge-pattern]] 通常就搞定了!

Repository 原本就是一個介面，就算你針對某個實作版本不滿意，不管是效能還是其他原因，換 Repository 的實作即可。

> 當然沒事不會常常換，因為換掉之後後端的資料庫可能需要隨著改變。如果已經有production的資料在上面，會比較麻煩。