# easyui
***
## 简介
***
easyui是一套基于ArkTS语言开发的轻量、可靠的移动端组件库，它是对OpenHarmony ArkUI进行深度定制的组件框架。 
ohos_easyUI可扩展性较强，可以基于源码进行二次开发，修改原有组件以及新增部分组件，以满足具体项目的开发需求。
该框架适用大部分 OpenHarmony 应用的开发 ，能够更加完善OpenHarmony 的应用开发能力，使我们的应用开发更简单。

## 下载安裝
***
```typescript
ohpm install @isrc/easyui
```

OpenHarmony ohpm 环境配置等更多内容，请参考如何安装 OpenHarmony ohpm 包

## 使用实例
***
使用easyui组件库中的AddressList地址列表组件
```typescript
import { AddressList } from 'easyui'
@Entry
@Component
struct TestAddressList {
  build() {
    Column(){
      Text("基础用法")
        .fontSize(20)
        .fontColor("#ff808080")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      AddressList({
        addressList: [              //地址列表
          { "id":1,"name":"张三","tel":"13000000000","address":"浙江省杭州市西湖区文一路 138 号东方通信大厦7楼501室"}
          ,{ "id":2,"name":"李四","tel":"13100000000","address":"浙江省杭州市拱墅区莫干山路 50号"}
          ,{ "id":3,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道13号"}
        ],
        outRangeIdArray:[5,6,7]        //超出配送范围的地址id集合
      })

    }.width("100%")
    .height("100%")
    .backgroundColor("#ffeaeaea")
  }
}

```
## easyui库中的组件列表
***
| 组件             | 组件名    |
|----------------|--------|
| **业务组件**       |        |
| AddressList    | 地址列表   |
| AddressEdit    | 地址编辑组件 |
| GoodsAction    | 商品导航   |
| Area           | 省市区选择组件 |
| Contact        | 联系人    |
| **基础组件**       |        |
| Button         | 按钮组件   |
| Popup          | 弹出组件   |
| Cell           | 单元格组件  |
| Radio          | 单选框组件  |
| Icon           | 图标     |
| **表单组件**       |        |
| TextInput      | 输入框组件  |
| Slider         | 滑动条组件  |
| Rate           | 评分组件   |
| DatetimePicker | 时间选择组件 |
| NumberKeyboard | 数字键盘组件 |
| Search         | 搜索组件   |
| Stepper        | 步进器组件   |
| Switch         | 开关组件   |
| Uploader       | 图片上传    |
| **展示组件**       |        |
| Label          | 标签组件   |
| NoticeBar      | 通告栏组件    |
| Steps          | 步骤条    |
| Tag            | 标记    |
| Circle         |  环形进度条    |
| ImagePreview   |  图片预览   |
| SwipeCaptcha   | 滑动验证   |
| CountDown      |  倒计时   |
| CustomCalendar | 自定义日历   |
| CardView       | 卡片视图   |
| ImageCrop      | 图片裁剪   |
| ImageCurtain   | 图片窗帘   |
| ImageSwiper    | 图片轮播   |
| ImageZoom      |  图片缩放   |
| LabelView      | 标签视图   |
| MaskGuideView  |  蒙版引导  |
| SearchView     |  搜索   |
| **反馈组件**       |        |
| Alert          |  提示消息框组件   |
| Collapse       |  折叠组件   |
| Toast          |  轻提示    |
| SwipeCell      |  滑动单元格组件   |
| **导航组件**       |        |
| NavBar     |  导航栏    |
| Badge     |  徽章    |
| Pagination     |  分页组件   |
| Tabber     |  标签栏   |
| TreeSelect     |  分类选择组件   |
| TabPage     |  标签页组件   |


## 需要权限
***
无
## 约束与限制
***
在下述版本验证通过：

* DevEco Studio 3.1 Beta2，version:3.1.0.400 
* SDK：3.2.14.2  API9


## 目录结构

```
/easyui        # 项目根目录
├── easyui     # easyui组件库
│    └─ src/main
│       └─ ets/common/components  # 组件库中的所有组件
│       └─index.ets    # 组件导出文件    
├── entry      # 组件使用方法测试代码示例代码文件夹 
│    └─ src/main
│       └─ ets/page/Main  # 组件测试效果代码           
├── README.md  # 安装使用方法
```
              
```typescript

```
## 贡献代码

使用过程中发现任何问题都可以提 Issue 给我们，当然，我们也非常欢迎你给我们发 PR 。

## License
*** 
Licensed under the Apache License, Version 2.0 (the "License")。
