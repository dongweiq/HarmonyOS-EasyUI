# lottie

## 简介

lottie是一个适用于OpenHarmony的动画库，它可以解析Adobe After Effects软件通过Bodymovin插件导出的json格式的动画，并在移动设备上进行本地渲染。

![showlottie](./screenshot/showlottie.gif)


## 下载安裝

```
 ohpm install @ohos/lottie
```
OpenHarmony ohpm 环境配置等更多内容，请参考[如何安装 OpenHarmony ohpm 包](https://gitee.com/openharmony-tpc/docs/blob/master/OpenHarmony_har_usage.md)

## 使用说明

前提：数据准备

lottie动画文件是由设计人员使用Adobe After Effects软件通过bodymovin插件导出json格式的文件。

AE软件创建动画时需要设置动画的宽(w)、高(h)、bodymovin插件的版本号(v)、帧率(fr)、开始帧(ip)、
结束帧(op)、静态资源信息(assets)、图层信息(layers)等重要信息。

如果仅是用于demo测试，可以使用[工程示例中的json文件](https://gitee.com/openharmony-tpc/lottie/tree/master/entry/src/main/ets/common/lottie) 。

1.在相应的类中引入组件：

```
import lottie from '@ohos/lottie'
```

2.构建渲染上下文

```
  private mainRenderingSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private mainCanvasRenderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.mainRenderingSettings)
```

3.將动画需要的json文件放到pages同级别目录下，然后引用。(json路径为entry/src/main/ets/common/lottie/data.json)

注意：json文件路径不能使用 ./ 或者 ../ 等相对路径，相对路径获取不到动画源数据，会导致动画加载不出来,

传递给loadAnimation 方法的路径是相对于pages父文件夹为基准的，而index页面内引入的相对路径的动画是以index.ets文件为基准的，两者基准不一致。

所以如果json文件放置在pages文件夹下，路径应为 'pages/common/data.json' 样式

```
  private path:string = "common/lottie/data.json"
  或
  private jsonData:string = {"v":"4.6.6","fr":24,"ip":0,"op":72,"w":1000,"h":1000,"nm":"Comp 2","ddd":0,"assets":[],...}
```

4.关联画布

```
       Canvas(this.mainCanvasRenderingContext)
        .width('50%')
        .height(360 + 'px')
        .backgroundColor(Color.Gray)
        .onReady(()=>{
        
        })
```

5.加载动画

- 加载动画的时机需要注意，点击按钮加载动画可按照正常逻辑放在点击事件内，如果想要实现进入页面自动播放动画，需要结合Canvas组件的onReady()生命回调周期实现，加载动画时机需放置在onReady()生命周期回调内或及之后。
- 同一Canvas组件加载多次/不同动画资源，需要手动销毁动画(lottie.destroy()/animationItem.destroy())，之后才可再次加载其他动画资源。
```      
    let animationItem = lottie.loadAnimation({
            container: this.mainCanvasRenderingContext,  // 渲染上下文
            renderer: 'canvas',                          // 渲染方式
            loop: true,                                  // 是否循环播放,默认true
            autoplay: true,                              // 是否自动播放，默认true
            path: this.path,                             // json路径
            initialSegment: [10,50]                      // 播放的动画片段
          })
     或      
    lottie.loadAnimation({
            container: this.mainCanvasRenderingContext,  // 渲染上下文
            renderer: 'svg',                             // 渲染方式
            loop: true,                                  // 是否循环播放,默认true
            autoplay: true,                              // 是否自动播放，默认true
            animationData: this.jsonData,                // json对象数据
            initialSegment: [10,50]                      // 播放的动画片段
          })
```

- 加载动画时，path 参数和 animationData 参数，二者选其一。
- path 参数：只支持加载entry/src/main/ets 文件夹下的相对路径，不支持跨包查找文件。
- animationData 参数：可结合ResourceManager进行读取资源文件内容进行设置。

6.控制动画

- 播放动画

  ```
  lottie.play()
  或
  animationItem.play()
  ```

- 停止动画

  ```
  lottie.stop()
  或
  animationItem.stop()
  ```

- 暂停动画

  ```
  lottie.pause()
  或
  animationItem.pause()
  ```

- 切换暂停/播放

  ```
  lottie.togglePause()
  或
  animationItem.togglePause()
  ```

- 设置播放速度
  > 注意：speed>0正向播放, speed<0反向播放, speed=0暂停播放, speed=1.0/-1.0正常速度播放

  ```
  lottie.setSpeed(1)
  或
  animationItem.setSpeed(1)
  ```

- 设置动画播放方向
  > 注意：direction 1为正向，-1为反向

  ```
  lottie.setDirection(1)
  或
  animationItem.setDirection(1)
  ```

- 销毁动画
  > 注意：页面不显示或退出页面时，需要销毁动画; 可配合页面生命周期aboutToDisappear()及onPageHide(),或者Canvas组件的onDisAppear()使用

  ```
  lottie.destroy()
  或
  animationItem.destroy()
  ```

- 控制动画停止在某一帧或某一时刻
  > 注意：根据第二个参数判断按帧还是按毫秒控制，true 按帧控制，false 按时间控制，缺省默认为false

  ```
  animationItem.goToAndStop(250,true)
  或
  animationItem.goToAndStop(5000,false)
  ```

- 控制动画从某一帧或某一时刻开始播放
  > 注意:根据第二参数判断按帧还是按毫秒控制，true 按帧控制，false 按时间控制，缺省默认为false
  ```
  animationItem.goToAndPlay(250,true)
  或
  animationItem.goToAndPlay(12000,false)
  ```

- 限定动画资源播放时的整体帧范围，即设置动画片段

  ```
  animationItem.setSegment(5,15);
  ```

- 播放动画片段
  > 注意：第二参数值为true立刻生效, 值为false循环下次播放的时候生效

  ```
  animationItem.playSegments([5,15],[20,30],true)
  ```

- 重置动画播放片段，使动画从起始帧开始播放完整动画
  > 注意：参数值为true立刻生效, 值为false循环下次播放的时候生效

  ```
  animationItem.resetSegments(5,15);
  ```

- 获取动画时长/帧数
  > 注意：参数值为true时获取帧数，值为false时获取时间(单位ms)

  ```
  animationItem.getDuration();
  ```

- 添加侦听事件
  > 注意：添加和移除的事件监听，回调函数需是同一个，需预先定义，否则将不能正确移除

  ```
  AnimationEventName = 'enterFrame' | 'loopComplete' | 'complete' | 'segmentStart' | 'destroy' | 'DOMLoaded';
  
  animationItem.addEventListener("enterFrame",function(){
      // TODO something
  })
  ```

- 更改动画渲染颜色

  > 注意：第一个参数颜色是RGB值，第二个参数是动画的层次 可不填，第三个参数是对应动画层次的元素的下标值 可不填

  ```
  animateItem.changeColor([255,150,203])  //修改整个动画的颜色
  或
  animateItem.changeColor([255,150,203],2) //修改该动画第二层的颜色
  或
  animateItem.changeColor([255,150,203],2,2) //修改该动画第二层第二个元素的颜色
  ```

- 移除侦听事件

  ```
  animationItem.removeEventListener("enterFrame",function(){
      // TODO something
  })
  ```


## 接口说明


| 使用方法                  | 类型                     | 相关描述      |
|-----------------------|------------------------|-----------|
| play()                | name?                  | 播放        |
| stop()                | name?                  | 停止        |
| pause()               | name?                  | 暂停        |
| togglePause()         | name?                  | 切换暂停      |
| destroy()             | name?                  | 销毁动画      |
| goToAndStop()         | value, isFrame?, name? | 跳到某一时刻并停止 |
| goToAndPlay()         | value, isFrame?, name? | 跳到某一时刻并播放 |
| setSegment()          | init,end               | 设置动画片段    |
| playSegments()        | arr, forceFlag         | 播放指定片段    |
| resetSegments()       | forceFlag              | 重置动画      |
| setSpeed()            | speed                  | 设置播放速度    |
| setDirection()        | direction              | 设置播放方向    |
| getDuration()         | isFrames?              | 获取动画时长    |
| addEventListener()    | eventName,callback     | 添加监听状态    |
| removeEventListener() | name,callback?         | 移除监听状态    |
| changeColor()         | color, layer?, index?  | 更改动画颜色    |

## 约束与限制

在下述版本验证通过：

DevEco Studio: 4.0 Canary2(4.0.3.312), SDK: API10 (4.0.9.3)

## 目录结构

````
/lottie        # 项目根目录
├── entry      # 示例代码文件夹
├── lottie     # lottie库文件夹
│    └─ src/main/js
│       └─ build/player 
│          └─ lottie.js # 核心代码，包含json解析，动画绘制，操作动画
│       └─index.d.ts    # 接口声明文档                     
├── README.md  # 安装使用方法                    
````

## 贡献代码

使用过程中发现任何问题都可以提 [Issue](https://gitee.com/openharmony-tpc/lottie/issues) 给我们，当然，我们也非常欢迎你给我们发 [PR](https://gitee.com/openharmony-tpc/lottie/pulls) 。

## 开源协议

本项目基于 [MIT License](https://gitee.com/openharmony-tpc/lottie/blob/master/LICENSE) ，请自由地享受和参与开源。

## 遗留问题

* 不支持HTML渲染方式
* 不支持SVG渲染中filter效果
* 不支持SVG渲染中mask部分特性
* 不支持渲染网络图片资源
* 不支持组件控制动画显示、隐藏、resize
* 不支持注册动画
* 不支持查找动画
* 不支持更新动画数据
* 不支持部分效果
* 不支持含有表达式的动画
