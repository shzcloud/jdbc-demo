# jdbc-demo

##### 数据源配置

1. 新建test-ds库
2. 修改表sys_ds中主库的url为自己的主库地址
3. 项目配置文件始终配置的是包含表sys_ds的库，项目启动将会自动查找配置的主库



##### 多数据源的配置

1. 在表sys_ds中新增数据源配置
2. BaseService及SimpleService具有传入库名的构造方法，可以传入配置的库名
3. @Repository注解的value值代表库名
4. 默认会查找主库即名称为main的配置



##### Repository

```
@Repository
public interface SysMenuRepository {
    @Query("SELECT id,parent_id,level,tag,app_name,location,name " +
            "FROM sys_menu " +
            "#{WHERE app_name = :appName} " +
            "#{AND location IN :location} " +
            "#{AND level BETWEEN :level.min AND :level.max} " +
            "#{AND tag LIKE CONCAT(:tag, '%')}"
    )
    List<SysMenu> list(String appName, Set<String> location, Range<Integer> level, String tag);

    /**
     * 在没有指定condition的情况下
     * 集合或数组将被看作IN
     * RangeL类将被看作BETWEEN
     * 其余视为=(具体什么条件可参看编译后的class文件)
     * 注解Fields指定查询的列
     */
    @Fields({"id", "parentId", "level", "tag", "appName", "location", "name"})
    List<SysMenu> orList(String appName, Set<String> location, Range<Integer> level, @Where(condition = Condition.LIKE_RIGHT) String tag);

    @Fields({"id", "parentId", "level", "tag", "appName", "location", "name"})
    List<SysMenu> orList2(QuerySysMenuVo vo);

    @Query("SELECT count(id) tag, level data " +
            "FROM sys_menu " +
            "GROUP BY data " +
            "ORDER BY data"
    )
    List<ILTag<String>> countByLevel();

    /**
     * 流式查询
     */
    @Query(value = "SELECT id,parent_id,level,tag,app_name,location,name " +
            "FROM sys_menu " +
            "#{WHERE app_name = :appName} " +
            "#{AND location IN :location} " +
            "#{AND level BETWEEN :level.min AND :level.max} " +
            "#{AND tag LIKE CONCAT(:tag, '%')}",
            fetchSize = 3000
    )
    ActionRunner<SysMenu> cursorQuery(String appName, Set<String> location, Range<Integer> level, String tag);
}
```

1. 用#{}包裹条件句，默认情况下如果条件为空则不拼接条件
2. 使用:拼接参数名引用参数
3. 在不使用sql的情况下参数名即为实体类域名
4. 支持泛型结果（返回单个结果:普通类型、Map、数组，数组用Object[]顺序即为查询的列顺序，返回多个结果:统一用List接收）
5. 流式查询接口返回类型为hz.core.function.ActionRunner或者shz.orm.param.OrmMapActionRunner,后面类型直接消费Map数据（还未映射到实体类）



##### Test

```
@SpringBootTest
public class SysMenuRepositoryTest {
    @Autowired
    SysMenuRepository repository;

    @Test
    public void list() {
        List<SysMenu> list = repository.list(null, null, new Range<>(1, 2), "2.");
        list.forEach(System.out::println);
    }

    @Test
    public void orList() {
        List<SysMenu> list = repository.orList(null, null, new Range<>(1, 2), "2.");
        list.forEach(System.out::println);
    }

    @Test
    public void orList2() {
        QuerySysMenuVo vo = new QuerySysMenuVo();
        vo.setLevel(new Range<>(1, 2));
        vo.setTag("2.");
        List<SysMenu> list = repository.orList2(vo);
        list.forEach(System.out::println);
    }

    @Test
    public void countByLevel() {
        List<ILTag<String>> list = repository.countByLevel();
        list.forEach(System.out::println);
    }

    @Test
    void cursorQuery() {
        //查询数据很大时可以采用流式查询
        ActionRunner<SysMenu> runner = repository.cursorQuery(null, null, new Range<>(1, 2), "2.");

        //真正开始执行查询
        runner.accept(sysMenu -> {
            //to do something
        });
    }
}
```

