# book_MVC
用mvc写的book管理的增删改查功能

项目：
首先配置好web框架，配置好tomcat，然后如果启动tomcat出现404，则添加iml文件

iml文件Code：

[//]: # (<?xml version="1.0" encoding="UTF-8"?>)

[//]: # ()
[//]: # (<module version="4">)

[//]: # ()
[//]: # (  <component name="FacetManager">)

[//]: # (    <facet type="web" name="Web">)

[//]: # (      <configuration>)

[//]: # (        <descriptors>)

[//]: # (          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/web/WEB-INF/web.xml"></deploymentDescriptor>)

[//]: # (          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/web/WEB-INF/web.xml"></deploymentDescriptor>)

[//]: # (          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/web/WEB-INF/web.xml"></deploymentDescriptor>)

[//]: # (        </descriptors>)

[//]: # (        <webroots>)

[//]: # (          <root url="file://$MODULE_DIR$/web" relative="/"></root>)

[//]: # (        </webroots>)

[//]: # (        <sourceRoots>)

[//]: # (          <root url="file://$MODULE_DIR$/src/main/java" />)

[//]: # (          <root url="file://$MODULE_DIR$/src/main/resources" />)

[//]: # (          <root url="file://$MODULE_DIR$/target/generated-sources/annotations" />)

[//]: # (        </sourceRoots>)

[//]: # (      </configuration>)

[//]: # (    </facet>)

[//]: # (    <facet type="Spring" name="Spring">)

[//]: # (      <configuration>)

[//]: # (        <fileset id="fileset" name="Spring 应用程序上下文" removed="false">)

[//]: # (          <file>file://$MODULE_DIR$/src/main/resources/springmvc-servlet.xml</file>)

[//]: # (          <file>file://$MODULE_DIR$/src/main/resources/mybatis-config.xml</file>)

[//]: # (        </fileset>)

[//]: # (      </configuration>)

[//]: # (    </facet>)

[//]: # (  </component>)

[//]: # (</module>)


另一种Code_iml：要改好项目名

[//]: # (<?xml version="1.0" encoding="UTF-8"?>)

[//]: # (<module version="4">)

[//]: # (  <component name="AdditionalModuleElements">)

[//]: # (    <content url="file://$MODULE_DIR$/mvcServlet" dumb="true">)

[//]: # (      <sourceFolder url="file://$MODULE_DIR$/mvcServlet/src/main/java" isTestSource="false" />)

[//]: # (    </content>)

[//]: # (  </component>)

[//]: # (  <component name="FacetManager">)

[//]: # (    <facet type="web" name="Web">)

[//]: # (      <configuration>)

[//]: # (        <descriptors>)

[//]: # (          <deploymentDescriptor name="web.xml" url="file://$MODULE_DIR$/mvcServlet/web/WEB-INF/web.xml"></deploymentDescriptor>)

[//]: # (        </descriptors>)

[//]: # (        <webroots>)

[//]: # (          <root url="file://$MODULE_DIR$/mvcServlet/web" relative="/"></root>)

[//]: # (        </webroots>)

[//]: # (      </configuration>)

[//]: # (    </facet>)

[//]: # (    <facet type="Spring" name="Spring">)

[//]: # (      <configuration>)

[//]: # (        <fileset id="fileset" name="Springmvc Servlet" removed="false">)

[//]: # (          <file>file://$MODULE_DIR$/mvcServlet/src/main/resources/springmvc-servlet.xml</file>)

[//]: # (        </fileset>)

[//]: # (      </configuration>)

[//]: # (    </facet>)

[//]: # (  </component>)

[//]: # (</module>)

到现在tomcat应该可以开始运行显示出index了

下一步：导入好需要的包，注意tomcat10需要用jakart的servlet，javax的包不行了

建立好包dao:database\mapper  service  pojo  

第一设置好pojo实体类
第二建立好database.properties 注意url中加入时区：?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8
第三步建立好mapper-config.xml  springmvc-servlet.xml
第四步在dao建立BookMapper，实现基本方法。同时建立BookMapper.xml，里面写好方法的sql
第五步在mybatis-config.xml配置命名空间Code：

[//]: # (<?xml version="1.0" encoding="UTF-8" ?>)

[//]: # (<!DOCTYPE configuration)

[//]: # (        PUBLIC "-//mybatis.org//DTD Config 3.0//EN")

[//]: # (        "https://mybatis.org/dtd/mybatis-3-config.dtd">)

[//]: # (<configuration>)

[//]: # (<!--配置数据源-->)

[//]: # (    <typeAliases>)

[//]: # (        <package name="com.ymd.pojo"/>)

[//]: # (    </typeAliases>)

[//]: # ()
[//]: # (    <mappers>)

[//]: # (        <mapper class="com.ymd.dao.BookMapper"/>)

[//]: # (    </mappers>)

[//]: # (</configuration>)

第六spring整合：
扫描dataSouce:<context:property-placeholder location="classpath:database.properties"/>
连接数据池->dao包扫描，可以用MapperScannerConfigurer ->sqlSessionFactory


