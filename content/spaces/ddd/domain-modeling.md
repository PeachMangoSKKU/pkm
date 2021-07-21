[+home](+home)

# Domain Modeling

## Aggregate

Event Storming 的 Aggregate 實作後比較像 Domain Modeling 的界線, 通常會再分:
- Aggregate Root
- Entity
- Value Object

## Aggregate Root

可以從生命週期來看, 當某一件事在某個時間點結束時, 相關的資料也會跟的消失, 就樣就適合當成 Root

在 Root 中可以從 `public getter`, `private setter` 開始設計

## 怎麼找出 VO 或 Entity

先在 Event Storming 的 Aggregate 中, 試著找到所有相關的名詞, 使用紫色便條紙, 這可以是很細節

在這些紫色便條紙中, 依序往下區分

### Value Object

Descriptive aspect of domain, 是一種描述, 肚量 domain 的性質

- Immutable value
- Non-identical life cycle concept

### Entity

- 在 Value Object 中, 有狀態, 生命週期的, 改成定義為 Entity
- 定義 Entity Id, Id 基本上也是 Value Object, 就算只有一個欄位也是這樣建議

#### Entity ID
 可以是以下方式:
 - User Input
 - Programing