# Rise-animation
- 模仿薄荷健康添加食物的动画，通过简单的CABasicAnimation以及延时动画实现

- ![RPReplay_Final1558009741](https://ws1.sinaimg.cn/large/006tNc79ly1g33ftdcdbkg30n01dsb2c.gif)

# 缺憾
- 运动曲线不合理，速度过慢
- 由于一改动duration就会导致整个动画鬼畜，所以看起来非常的违和，和薄荷还是有区别
- beginTime的使用，本来希望是用CACurrentMediaTime() + x来实现的，结果用了还是会鬼畜，我真的是佛了，一个动画怎么要设计的那么复杂
- ![仿薄荷](http://ww1.sinaimg.cn/large/006tNc79ly1g35h3bs5mjg306w0dcgqu.gif)