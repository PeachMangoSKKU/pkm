# Bounded Context
- 盡可能的具象化
- 等於是 Aggregate 的群組

## Dealing with Relationships

找出各個 Bounded Context 的上下文
- **U**: Upstream 上文
- **D**: Downstream 下文

如果找到上下文之間有 cycle 關係, 代表這些參與 cycle 的 bounded context 的關係有問題, 有可能其實是同一個