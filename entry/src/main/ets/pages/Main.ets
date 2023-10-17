/**
 * Copyright 2022 Institute of Software Chinese Academy of Sciences, ISRC
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0

 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Cell } from 'easyui'
@Entry
@Component
struct Main {
  @State basicCompHeight:number = 0
  @State formCompHeight:number = 0
  @State feedBackCompHeight:number = 0
  @State showCompHeight:number = 0
  @State navCompHeight:number = 0
  @State busCompHeight:number = 0

  build() {
    Column() {
      Text("EasyUI")
        .fontSize(30)
        .fontWeight(FontWeight.Bolder)
        .margin({ bottom: 20 })
      Column() {
        Scroll() {
          Column() {
            Column() {
              Row() {
                Text("基础组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "Button 按钮",
                  rightArrow: ">",
                  url: "pages/TestButton" //
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "Popup 弹出",
                  rightArrow: ">",
                  url: "pages/TestPopup"
                })
                Cell({
                  leftTitle: "Cell 单元格",
                  rightArrow: ">",
                  url: "pages/TestCell"
                })
                Cell({
                  leftTitle: "Radio 单选框",
                  rightArrow: ">",
                  url: "pages/TestRadio"
                })
                Cell({
                  leftTitle: "Icon 图标",
                  rightArrow: ">",
                  url: "pages/TestIcon"
                })
              }
              .height(this.basicCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.basicCompHeight == 0) {
                this.basicCompHeight = 200
              } else {
                this.basicCompHeight = 0
              }
            })

            Column() {
              Row() {
                Text("表单组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "TextInput 输入框",
                  rightArrow: ">",
                  url: "pages/TestTextInput"
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "Switch 开关",
                  rightArrow: ">",
                  url: "pages/TestSwitch"
                })
                Cell({
                  leftTitle: "Slider 滑动条",
                  rightArrow: ">",
                  url: "pages/TestSlider"
                })
                Cell({
                  leftTitle: "Rate 评分",
                  rightArrow: ">",
                  url: "pages/TestRate"
                })

                Cell({
                  leftTitle: "DatetimePicker 时间选择",
                  rightArrow: ">",
                  url: "pages/TestDatetimePicker"
                })

                Cell({
                  leftTitle: "NumberKeyboard 数字键盘",
                  rightArrow: ">",
                  url: "pages/TestNumberKeyboard"
                })

                Cell({
                  leftTitle: "Search 搜索",
                  rightArrow: ">",
                  url: "pages/TestSearch"
                })

                Cell({
                  leftTitle: "Stepper 步进器",
                  rightArrow: ">",
                  url: "pages/TestSteper"
                })
                Cell({
                  leftTitle: "Uploader 图片上传",
                  rightArrow: ">",
                  url: "pages/TestUploader"
                })
              }
              .height(this.formCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.formCompHeight == 0) {
                this.formCompHeight = 360
              } else {
                this.formCompHeight = 0
              }
            })

            Column() {
              Row() {
                Text("反馈组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "Alert 消息提示",
                  rightArrow: ">",
                  url: "pages/TestAlert"
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "Collapse 折叠",
                  rightArrow: ">",
                  url: "pages/TestCollapse"
                })

                Cell({
                  leftTitle: "SwipeCell 滑动单元格",
                  rightArrow: ">",
                  url: "pages/TestSwipeCell"
                })

                Cell({
                  leftTitle: "Toast 轻提示",
                  rightArrow: ">",
                  url: "pages/TestToast"
                })

              }
              .height(this.feedBackCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.feedBackCompHeight == 0) {
                this.feedBackCompHeight = 160
              } else {
                this.feedBackCompHeight = 0
              }
            })

            Column() {
              Row() {
                Text("展示组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "Label 标签",
                  rightArrow: ">",
                  url: "pages/TestLabel"
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "NoticeBar 通告栏",
                  rightArrow: ">",
                  url: "pages/TestNoticeBar"
                })
                Cell({
                  leftTitle: "SwipeCaptcha 滑动验证",
                  rightArrow: ">",
                  url: "pages/TestSwipeCaptcha"
                })
                Cell({
                  leftTitle: "CountDown 倒计时",
                  rightArrow: ">",
                  url: "pages/TestCountDown"
                })
                Cell({
                  leftTitle: "CustomCalendar 自定义日历",
                  rightArrow: ">",
                  url: "pages/TestCustomCalendar"
                })
                Cell({
                  leftTitle: "CardView 卡片视图",
                  rightArrow: ">",
                  url: "pages/TestCardView"
                })
                Cell({
                  leftTitle: "ImageCrop 图片裁剪",
                  rightArrow: ">",
                  url: "pages/TestImageCrop"
                })
                Cell({
                  leftTitle: "ImageCurtain 图片窗帘",
                  rightArrow: ">",
                  url: "pages/TestImageCurtain"
                })
                Cell({
                  leftTitle: "ImageSwiper 图片轮播",
                  rightArrow: ">",
                  url: "pages/TestImageSwiper"
                })
                Cell({
                  leftTitle: "ImageZoom 图片缩放",
                  rightArrow: ">",
                  url: "pages/TestImageZoom"
                })
                Cell({
                  leftTitle: "LabelView 标签视图",
                  rightArrow: ">",
                  url: "pages/TestLabelView"
                })
                Cell({
                  leftTitle: "MaskGuideView 蒙版引导",
                  rightArrow: ">",
                  url: "pages/TestMaskGuideView"
                })
                Cell({
                  leftTitle: "SearchView 搜索",
                  rightArrow: ">",
                  url: "pages/TestSearchView"
                })
                Cell({
                  leftTitle: "CustomStep 步骤条",
                  rightArrow: ">",
                  url: "pages/TestCustomSteps"
                })
                Cell({
                  leftTitle: "Tag 标签",
                  rightArrow: ">",
                  url: "pages/TestTag"
                })
                Cell({
                  leftTitle: "CircleProgress 环形进度条",
                  rightArrow: ">",
                  url: "pages/TestCircleProgress"
                })
              }
              .height(this.showCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.showCompHeight == 0) {
                this.showCompHeight = 620
              } else {
                this.showCompHeight = 0
              }
            })

            Column() {
              Row() {
                Text("导航组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "Pagination 分页",
                  rightArrow: ">",
                  url: "pages/TestPagination"
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "Tabbar 标签栏",
                  rightArrow: ">",
                  url: "pages/TestTabbar"
                })
                Cell({
                  leftTitle: "TreeSelect 分类选择",
                  rightArrow: ">",
                  url: "pages/TestTreeSelect"
                })
                Cell({
                  leftTitle: "TabPage 标签页",
                  rightArrow: ">",
                  url: "pages/TestTabPage"
                })
              }
              .height(this.navCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.navCompHeight == 0) {
                this.navCompHeight = 160
              } else {
                this.navCompHeight = 0
              }
            })

            Column() {
              Row() {
                Text("业务组件")
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
              }.width("100%")

              Column() {
                Cell({
                  leftTitle: "Area 省市区选择",
                  rightArrow: ">",
                  url: "pages/TestArea"
                })
                  .margin({ top: 10 })
                Cell({
                  leftTitle: "AddressEdit 地址编辑",
                  rightArrow: ">",
                  url: "pages/TestAddressEdit"
                })
                Cell({
                  leftTitle: "GoodsAction 商品导航",
                  rightArrow: ">",
                  url: "pages/TestGoodAction"
                })
                Cell({
                  leftTitle: "AddressList 地址列表",
                  rightArrow: ">",
                  url: "pages/TestAddressList"
                })

              }
              .height(this.busCompHeight)
              .animation({
                duration: 300
              })
            }
            .padding({ left: 10, right: 10, top: 15, bottom: 15 })
            .borderRadius(15)
            .margin({ bottom: 20 })
            .backgroundColor("#ffffffff")
            .width("100%")
            .onClick(() => {
              if (this.busCompHeight == 0) {
                this.busCompHeight = 160
              } else {
                this.busCompHeight = 0
              }
            })
          }
        }.scrollBar(BarState.Auto)
      }
      .height("90%")
    }
    .backgroundColor("#fff2f3f5")
    .padding(20)
    .width("100%")
    .height("100%")
  }
}