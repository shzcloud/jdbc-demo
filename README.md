# jdbc-demo

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
}
```

1. 用#{}包裹条件句，默认情况下如果条件为空则不拼接条件
2. 使用:拼接参数名引用参数
3. 在不使用sql的情况下参数名即为实体类域名
4. 支持泛型结果（返回单个结果:普通类型、Map、数组，数组用Object[]顺序即为查询的列顺序，返回多个结果:统一用List接收）



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
}
```

