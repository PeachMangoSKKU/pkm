[+home](+home)

# Aggregate
- [Event](spaces/ddd/event.md), Command, User 等所有便利貼的集合
- 使用名詞, 不要出現動詞
- 避免使用不精確的名詞

 一個 Aggregate 對應一個 [Repository](spaces/ddd/repository.md)
 
 如果是要協調調度兩個不同的聚合的情況下，一般我們會考慮是以 Application Service 來處理，或者是通過派發領域事件去跟另一個聚合做交互， domain service 還是比較隸屬於該聚合相關的業務話題的事物居多。
 
 ## Aggregate Root
 
 一個 Aggregate Root擁有 domain event list 就好像是一個汽車修理員隨身攜帶螺絲起子一樣是很自然的事情
 
 聚合根持有整體的領域事件，並且決定何時發出去。