# SSM内容管理系统

## 需求分析

```
使用SSM+Shiro+EasyUI实现一个网站CMS内容管理系统
前台首页包括文章分类和文章，文章分类下包含文章，文章使用富文本，并可以展示幻灯片
前台管理使用Shiro身份验证，可以增删改查文章、文章分类、友情链接

```
<br/>
		
## 前台展示
![img](https://github.com/luguanxing/JavaWeb-Apps/blob/master/03-SSM%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/pictures/01.jpg?raw=true)
<br/><br/>
![img](https://github.com/luguanxing/JavaWeb-Apps/blob/master/03-SSM%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/pictures/02.jpg?raw=true)
<br/><br/>
![img](https://github.com/luguanxing/JavaWeb-Apps/blob/master/03-SSM%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/pictures/03.jpg?raw=true)
<br/><br/><br/><br/><br/><br/>

## 后管理展示
![img](https://github.com/luguanxing/JavaWeb-Apps/blob/master/03-SSM%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/pictures/05.jpg?raw=true)
<br/><br/>
![img](https://github.com/luguanxing/JavaWeb-Apps/blob/master/03-SSM%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/pictures/06.jpg?raw=true)
<br/><br/>
<br/><br/><br/><br/><br/><br/>

## 开发日志
```
步骤1-搭建web框架
	源码分包src/main/java
	cms
		cms.controller
		cms.dao
		cms.entity
		cms.realm
		cms.service
		cms.utils
	配置分文件夹src/main/resources
	mappers
		dao的实现文件
	spring
		spring-web
		spring-service
		spring-web
		spring-realm
	mybatis-config.xml
	log4j.properties
	
案例2-完成登录验证功能
	配置realm验证和加密，写dao、service、controller，导入前端页面
	
案例3-完成主页前端
	index.jsp
	common/
		header.jsp
		menu.jsp
		link.jsp
		footer.jsp
		
案例4-使用application缓存页面数据
	class InitComponet implements ApplicationContextAware, ServletContextListener
	内部static ApplicationContext applicationContext用于管理bean等
	refreshSystem(ServletContext application)用于操作applicationContext
	创建和使用相关的service读数据并存储到servlet的application中
	
案例5-完成主页、文章、文章类别及其标题和分页的显示
	在application缓存的数据直接在jsp页面中用jstl可获取
	使用HtmlUtils拼接字符串,拼接时传入contextPath表示项目路径
	传入map参数进Dao,在XML文件中使用<if test=“”>拼接分页条件
	rest风格开发:@RequestMapping("/{id}"),配合springmvc拦截器拦截*.html和*.do
	mybatis.xml中大于小于号 < > 使用转义字符 &lt; &gt;
	controller中加入try并使用HttpServletResponse重定向保持稳定
	
案例6-完成后台写文章功能
	所有的"xxPrefix"写项目名(本项目写的是"/ssm-cms")
	所有的"xxPathFormat"图片存储的位置(本项目写的是"/static/uploadImages/{yyyy}{mm}{dd}/{time}{rand:6}")
	读取时/从ROOT目录开始(不带项目名所以要手动加)
	存储时/表示从项目路径开始(所以直接指定项目下的存储位置)
	删除index.html防止尝试上传
	
	
案例7-后台管理
	easyui分页:前端固定了取分页的参数,后端list方法如下:
	list(	@RequestParam(value="page", defaultValue="1") int page, 
		@RequestParam(value="rows", defaultValue="10") int pageSize
	)
	返回中文:@RequestMapping(value="/list", produces="application/json;charset=utf-8

```
