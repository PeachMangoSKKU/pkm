# Aggregate

- 包含了 Entities 跟 ValueObject
- 負責所有 Entites 跟 ValueObject 的 [Invariants](spaces/ddd/invariants.md)
- Aggregate 即 Transaction Boundary, 
- 建議一個 Aggregate 應該只對應一個 [Repository](spaces/ddd/repository.md), 並在該 Repository 綁上 Transaction
- 使用名詞, 不要出現動詞
- 避免使用不精確的名詞

 ## Interaction with other aggregate 
 如果是要協調調度兩個不同的聚合的情況下，一般我們會考慮是以 Application Service 來處理，或者是通過派發領域事件去跟另一個聚合做交互， domain service 還是比較隸屬於該聚合相關的業務話題的事物居多。

 
 ## Aggregate Root
 
挑選 Aggregate 中的其中一個 Entity 最為 Root (根), 只有 Aggregate Root 持有整體的領域事件 (Domain Event)，並且決定何時發出去。

> 一個 Aggregate Root擁有 domain event list 就好像是一個汽車修理員隨身攜帶螺絲起子一樣是很自然的事情