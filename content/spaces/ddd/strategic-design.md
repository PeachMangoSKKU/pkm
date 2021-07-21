[+home](+home)

# Strategic Design
> 戰略

- [Event](spaces/ddd/event.md)
- [Command](spaces/ddd/command.md)
- User
- Read Model
- Third Party
- [Aggregate](spaces/ddd/aggregate.md)
- [Bounded Context](spaces/ddd/bounded-context.md)
- [Subdomain](spaces/ddd/subdomain.md)

## 執行順序

1. 匡圈 DDD 範圍, 在發想時如果已知超過範圍, 可使用粉紅色表示, 其代表另一個複雜流程
2. 定義 Command (藍色) 跟 User(黃色)
3. 在 Command 跟 Event 之中找 Logic (黃色), 勢必會打破原本的橘, 紫色
4. Aggregate 聚合所有便利貼
5. 找 Bounded Context

## Sticky Note

- **橘色**: 已經發生的事實，不可改變，使用過去式
- **紫色**: 大流程, 即橘色的群組
- **粉紅**: Third/External Party
- **黃色**: User/Role
- **藍色**: Command