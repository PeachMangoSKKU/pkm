# Invariants

不變量, 並不是只不會改變, 而是指改變的結果是符合程式設計的假設與前提! 在 DDD 架構中, [Aggregate](spaces/ddd/aggregate.md) 需要負責其不變量

## Enforcing Invariants with Aggregates

當模型中的物件關係有複雜關聯時, 是很難的去確保其中部分物件變更時整體的一致性

### Solution

我們將 Entities 跟 ValueObject 聚合在一起形成 Aggregate 並定義 Aggregate 的邊界。選擇一個 Entity 作為 [Aggregate Root](spaces/ddd/aggregate.md#aggregate-root), 並且我們只在 Aggregate Root 中去存取 Aggregate 邊界內的物件。

對外我們也只開放 Aggregate Root 的引用, 任何外部都不能繞過 Aggregate Root 直接的對其內部物件修改, 這種安排可以確保任何針對 Aggregate 裡面的物件以及 Aggregate 本身的狀態修改都不會違反不變量 (Invariants)

