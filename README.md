# book_MVC
# book MVC 项目

## 项目设置

1. 配置 web 框架并设置 Tomcat。
2. 如果启动 Tomcat 时遇到 404 错误，请添加 `.iml` 文件。

   **.iml 文件代码:**
   ```xml
   <!-- 粘贴你的 .iml 文件代码在这里 -->
    <?xml version="1.0" encoding="UTF-8"?>
    <module version="4">
    <component name="FacetManager">
    <facet type="web" name="Web">
      <configuration>
        <descriptors>
          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/web/WEB-INF/web.xml" />
          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/web/WEB-INF/web.xml" />
          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/WEB-INF/web.xml" />
        </descriptors>
        <webroots>
          <root url="file://$MODULE_DIR$/web" relative="/" />
        </webroots>
        <sourceRoots>
          <root url="file://$MODULE_DIR$/src/main/java" />
          <root url="file://$MODULE_DIR$/src/main/resources" />
          <root url="file://$MODULE_DIR$/target/generated-sources/annotations" />
        </sourceRoots>
      </configuration>
    </facet>
    <facet type="Spring" name="Spring">
      <configuration>
        <fileset id="fileset" name="Spring 应用程序上下文" removed="false">
          <file>file://$MODULE_DIR$/src/main/resources/springmvc-servlet.xml</file>
          <file>file://$MODULE_DIR$/src/main/resources/mybatis-config.xml</file>
        </fileset>
      </configuration>
    </facet>
    </component>
    </module>
现在，Tomcat 应该能够运行并显示首页。

包和依赖设置
导入必要的包。注意：对于 Tomcat 10，使用 Jakarta Servlet，因为 javax 包不再受支持。

创建以下包：

dao
database\mapper
service
pojo
数据库配置
设置 POJO（Plain Old Java Object）实体类。

创建 database.properties 文件并包含以下设置，确保在 URL 中添加时区:?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8。

建立 mapper-config.xml 和 springmvc-servlet.xml 文件。

MyBatis 配置
在 dao 包中创建 BookMapper 并实现基本的 CRUD 方法。同时，创建 BookMapper.xml 定义 SQL 查询。

!!!!!!!!!!!!BookMapper.xml要放到resources中，不然会报错!!!!!!!!!!!!!!!!




 在 mybatis-config.xml 中配置命名空间：
   
      <?xml version="1.0" encoding="UTF-8" ?>
         <!DOCTYPE configuration
         PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
         "https://mybatis.org/dtd/mybatis-3-config.dtd">
      <configuration>
     <!--配置数据源-->
     <typeAliases>
         <package name="com.ymd.pojo"/>
     </typeAliases>
 
     <mappers>
         <mapper class="com.ymd.dao.BookMapper"/>
     </mappers>
     </configuration>
 <!-- End of .iml File Code -->
 




Spring 整合
配置 Spring：
扫描 DataSource：<context:property-placeholder location="classpath:database.properties"/>
连接数据池。
扫描 dao 包。你可以使用 MapperScannerConfigurer 来设置 sqlSessionFactory。
这样结构化的 README.md 应该能够使读者更容易地按照你项目的步骤进行操作。根据你项目的具体情况，随意进行进一步的自定义。

接下来是Service,service实现一样的方法，
 `@Autowired`
 `@Qualifier("bookMapper")`
 `private BookMapper bookMapper;`
 `public void setBookMapper(BookMapper bookMapper){`
 `this.bookMapper=bookMapper;`
 `}`
这是关联dao

整合：
`<context:component-scan base-package="com.ymd.service"/>
<!--    将所有的业务类注入到spring,可以配置或者注解-->`
    <bean id="bookServiceImpl" class="com.ymd.service.BookServiceImpl">
        <property name="bookMapper" ref="bookMapper"/>
    </bean>

<!--    声明事务-->
    <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>


SpringMVC整合

<!--    整合springmvc-->
    <mvc:annotation-driven/>
    <mvc:default-servlet-handler/>
    <context:component-scan base-package="com.ymd.controller"/>

    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/jsp/"/>
        <property name="suffix" value=".jsp"/>
    </bean>

写好controller层与前端关联上
