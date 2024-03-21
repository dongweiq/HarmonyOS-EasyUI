/*
 * Copyright (c) 2021 Institute of Software, Chinese Academy of Sciences.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { Cell, Cell_group } from '@isrc/easyui'
import router from '@ohos.router'
@Entry
@Component
struct TestCell {

  build() {
    Scroll() {
      Column() {
        Text("基础用法")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftTitle: "单元格",
          rightTitle: "内容"
        })
        Cell({
          leftTitle: "单元格",
          rightTitle: "内容",
          describeMessage:"描述信息"
        })
        Text("单元格大小")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftTitle: "单元格",
          rightTitle: "内容"
        })
        Cell({
          leftTitle: "单元格",
          rightTitle: "内容",
          describeMessage:"描述信息"
        })
        Text("展示图标")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftIcon: "Alert_info.png",
          leftTitle: "单元格",
          rightTitle: "内容"
        })
        Text("只设置value")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          rightTitle: "内容"
        })
        Text("展示箭头")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftTitle: "单元格",
          rightArrow: ">"
        })

        Cell({
          leftTitle: "单元格",
          rightArrow: ">"
        })
        Cell({
          leftTitle: "单元格",
          rightArrow: "V"
        })
        Text("页面跳转")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftTitle: "单元格",
          rightArrow: ">",
          url:"pages/TestNumberKeyboard"
        })
        Cell({
          leftTitle: "单元格",
          rightArrow: ">",
          url:"pages/TestNumberKeyboard"
        })

        Text("分组标题")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell_group({
          groupTitle:"分组1",
          leftTitle: "单元格",
          rightTitle: "内容"
        })
        Cell_group({
          groupTitle:"分组2",
          leftTitle: "单元格",
          rightTitle: "内容"
        })
        Text("高级用法")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        Cell({
          leftIcon: "Alert_info.png",
          leftTitle: "单元格",
          label:"标签",
          rightTitle: "内容",
          rightArrow:">"
        })
        Cell({
          leftIcon: "Alert_info.png",
          leftTitle: "单元格",
          rightArrow:">"
        })
        Cell({
          leftTitle: "单元格",
          rightArrow:"♀"
        })
      }.width("100%")
    }
    .backgroundColor("#ffe5e5e5")
  }
}