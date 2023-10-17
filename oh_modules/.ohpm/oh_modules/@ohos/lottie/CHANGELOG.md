## v2.0.4
    fix: 修复lottie播放mask动画多次调用getPixelMap方法，导致动画播放掉帧的问题
    fix: 适配ArkTs语法

## v2.0.3
    fix: 修复lottie不同版本在同一个界面启动，导致动画播放失败的问题
    fix: 修复动画销毁，重新刷新界面导致应用的崩溃问题

## v2.0.2
    feature:新增支持Canvas渲染中mask部分特性
            支持渲染本地图片，包含base64编码和文件路径方式
    fix: 修正圆形动画加载小球不重叠
    fix: 修正动画全部播放完后，Animator也要停止刷帧
    updated: 适配DevEco Studio: 4.0 Canary2(4.0.3.312)
             适配SDK: API10 (4.0.9.3)

## v2.0.1
    feature:新增动画动态渲染颜色能力
    fix: 修正License文件版权
    fix: 添加Array.apply()函数的参数检验，如果长度为undefined时，设置长度为0
    updated: 适配DevEco Studio: 4.0 Canary1(4.0.0.112)
             适配SDK: API10 (4.0.7.2)
    updated: 修改Library目录结构根目录名称

## v2.0.0
    feature: 动画加载代码解耦
    updated: 包管理工具由npm切换为ohpm
             适配DevEco Studio: 3.1 Beta2(3.1.0.400)
             适配SDK: API9 Release(3.2.11.9)

## v1.1.2
    fix: 未设置动画数据就直接加载动画，销毁动画时，导致的空指针异常
    fix: 修正根据路径加载不到动画数据时的处理方式，不进行构建动画配置
    fix: 删除动画加载限制，重复加载动画前需手动销毁上一个已加载动画
    fix: 补充readme文件内Lottie组件使用注意事项
         loadAnimation使用时须在页面加载完成之后，例如Canvas.onReady()生命周期
         loadAnimation加载动画使用path参数设置时，需要注意path参数只支持entry/src/main/ets文件夹下的相对路径，不支持跨包设置。
         同一Canvas组件加载多次/不同动画资源，需要手动销毁动画(lottie.destroy()/animationItem.destroy())，之后才可再次加载其他动画资源。

## v1.1.1
    feature:补充svg渲染能力
    适配原库5.10.0版本
不支持特性：
* 不支持SVG渲染中filter效果
* 不支持SVG渲染中mask部分特性
* 不支持渲染本地图片及网络图片资源

## v1.1.0
    updated: 名称由lottieETS修改为lottie
    updated: 旧的包@ohos/lottieETS已不再维护，请使用新包@ohos/lottie
    fix:修复多次在同一画布上加载动画，导致动画重叠的问题

不支持特性：
* 不支持SVG、HTML渲染方式
* 不支持组件控制动画显示、隐藏、resize
* 不支持注册动画
* 不支持查找动画
* 不支持更新动画数据
* 不支持部分效果
* 不支持含有表达式的动画


## v1.0.3
    fix:修复销毁动画时未清空画布的bug
    fix:添加对通过路径获取动画文件json数据的非空校验，如果未获取到将抛出异常进行提示


## v1.0.2
    适配API9 Stage 模型


## v1.0.1
    升级IDE到3.0.0.900，使项目能在该环境下运行


## v1.0.0
    适配兼容OpenHarmony系统，完成相关功能，具体如下：
* 动画播放、暂停、停止、切换暂停、跳到某一时刻并停止、跳到某一时刻并播放等动画基础功能。
* 播放指定片段、重置动画、设置播放速度、设置播放方向、添加监听状态、获取动画时长等扩展功能。
* canvas渲染。



### 对源库改动如下：
* 删除html渲染。
* 删除svg渲染，等待后续迭代。


