# KKFrameProject
个人测试项目 - 项目框架搭建

## 当有滚动视图时，自定义侧滑手势冲突的建议：
问题阐述：当有VC中有滚动视图，会与我们自定义的返回手势产生冲突(如何解决这里就不阐述了，代码里面有写，在基类KKNavigationController文件中)，那么返回的方式就有两种：
1. 可以选择当scrillView的contentOffset.x为0时，使用全屏返回的手势返回上个页面，但是这样会有一个问题。当用户在滑动视图中滑到一半之后停止当前操作，当前的contentOffset.x大于0，这时如果用户想返回上个页面，只能是滑到启示位置(contentOffset.x=0)，才会触发返回手势
2. 判断当前touch的view是否是滚动视图，如果是滚动视图，则恢复系统自带的侧滑返回(self.interactivePopGestureRecognizer.enabled = YES)，否则继续使用自定义全凭返回手势
3. 个人建议选择第二种，交互上体验会更好一些。
