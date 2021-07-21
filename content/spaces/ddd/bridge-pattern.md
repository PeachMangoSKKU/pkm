# Bridge Pattern

橋接模式最主要就是將你的物件切分成概念與行為(殼與肉)，達到極致的解偶獨立，例如，遙控器他只是一個塑膠殼(概念)搭配一個電子電路版(行為)，如果我將電子電路版做成通用，以後遙控器的殼可以跟隨市場上流行的板式直接使用我的電子電路版。

# Class Diagram

Abstraction: 將原本的主體抽換到只剩下虛擬的概念，例如(人類:只是吃喝拉撒睡的主體、遙控器:只是開機關機調整的主體)

## Class Diagram

**RefineAbstraction:** 根據不同的需求實作主體

**Implementator:** 將原本主體的實際功能抽離，成為這個的Hierarchy(繼承結構)，例如(人類:人類的吃和拉撒睡拉出在此結構實作)

**ConcreteImplementator:** 根據不同的需求開發真實的行為

![[spaces/ddd/attachments/bridge-pattern.png]]

## Example

在 Application 中我們定義 repository interface, 也就是 Bridge Pattern 的 **Abstraction**, 其中只會列出該 aggregate 中會用到的動作

例如在 Balance Aggregate 中, 我們會使用到:
- **getCurrentBalance:** 取得當前的餘額
- **save:** 更新餘額

```java
pacakge example.application.balance.repository;

@FunctionInterface
interface BalanceRepository {
    Balance getCurrentBalance();
    void save(Balance balance);
}
```

接的在 Infrastructure package 中去實作 Domain repository, 也就是 Bridge Pattern 的 **RefineAbstraction**, 這邊通常也是管理 Transaction 的地方, 而且這邊也不直接操作 Persistence framework (如 JPA), 取代代之的是傳入 Dao

```java
pacakge example.infrastructure.repository.balance;

@Repository
@RequiredArgsConstructor
public class BalanceRepositoryImpl implements BalanceRepository {

    final BalanceDao dao;
    final BalanceMapper mapper; // Mapper mapping between PO (persistant object) and DO (domain object)

    @Transactional(readOnly = true)
    @Override  
    public Balance getCurrentBalance() {  
        return mapper.mapping(dao.findTopByOrderByIdDesc());
    }  
    
    @Transactional(rollbackFor = Exception.class)
    @Override  
    public void save(Balance balance) {  
        dao.save(mapper.mapping(balance));  
    }  
}
```

最後實作 Bridge Pattern 的 **Implementator**, 在下面範例中也就是 JPA 的實作:

```java
pacakge example.infrastructure.balance.jpa;

public interface BalanceDao extends JpaRepository<BalancePO, Long> {
    BalancePO findTopByOrderByIdDesc();
}
```

如果未來要把 JPA 換成 Hibernate, 甚至 MongoDB, 我們都只需要換 **BalanceDao** 實作即可