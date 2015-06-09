# LNPullRefresh
仿QQ的下拉刷新，主体是MJREfresh,在这之上修改的

其他添加方法参照MJRefresh

webView 页面调用

刷新成功的时候调用
[webView.scrollView.header endRefreshingWithSuccess];

刷新失败调用
[webView.scrollView.header endRefreshingWithFail];

这里明确声明：非常感谢MJRefresh 的作者提供的很好的框架，以表示敬意。
 
