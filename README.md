# xmlblog
用XML+XSL写的Blog，体验地址：http://www.cssforest.org/xmlblog/index.xml

2007年写的一个实验性项目，不过当时浏览器对XSL的支持并不是很好，只有Opera支持的比较好，现在Chrome和IE都已支持了XSL的模板语法。

作为一个实验项目，没有使用数据库，直接用PHP读取了我博客的RSS并重新生成所需要的XML文件，主要是因为跨域的问题，如果你将数据源也放在同个域里，可以直接读取RSS文件而不需要通过PHP。

## 已实现功能

1. 多语言的切换
2. 更换样式皮肤
