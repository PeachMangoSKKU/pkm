# Guarantee Correctness when writing

> Validation against a read model is prone to **INCONSISTENCIES**

Read Model 所提供的資訊, 同時有機會被多個服務或是 Thread 使用, 這時候就會造成一些不一致的問題!

有個經典的提款情境: 兩個 Thread 在檢查同一帳戶餘額時都是通過的, 但一起下提款 Command 時, 你的帳戶就超支囉!

![read-withdrawn](/spaces/event-sourcing/attachments/read-withdrawn.png)

我們有使用兩個方式來解決這個問題

- [Manage Transactions With a Database](spaces/event-sourcing/manage-transactions-with-database.md) 
- [aggregate-business-invariants](spaces/event-sourcing/aggregate-business-invariants.md)

## Reference

- [Messaging as the Single Source of Truth](https://www.confluent.io/blog/messaging-single-source-truth/)