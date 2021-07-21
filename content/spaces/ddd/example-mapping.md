[+home](+home)

# Example Mapping

## Use Case

在 Bounded Context 中, 試著找出很多 Use Case, 使用黃色便條紙寫上

## Rule

在黃色的 Use Case 中, 找出很多 Rule, 使用藍色的便條紙

## Example

- 從 Rule 中找出範例, 使用綠色便條紙
- 範例應該包含 Use Case 的正反向流程 (成功/失敗)

## Question

過程中想到什麼問題, 列成紅色的便條紙

## 希望得到

- 發現並擴展問題域, 甚至找到新的 User Mapping
- Acceptance Tests
- Sharing Understanding

## Gherkin

https://cucumber.io/

- **Given**: 前置條件設定 
- **When**: 發生了一個事件, 通常可以就是 Command
- **Then**: 預期結果
- **And**: 多個 Given (前置條件) 的串接
- **But**: 多個 Then (預期結果) 的串接
- **Examples**: 定義變數

