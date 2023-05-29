/**
 * Copyright 2022 Institute of Software Chinese Academy of Sciences, ISRC
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { TabPage } from '../common/components/TabPage'
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct TestTabPage {
  @State currentIndex_1:number = 0
  @State currentIndex_2:number = 0
  @State currentIndex_3:number = 0
  @State currentIndex_4:number = 0
  @State currentIndex_5:number = 0
  @State currentIndex_6:number = 0
  @State currentIndex_7:number = 0

  build() {
    Scroll() {
      Column() {
        Text("基础用法")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_1
        })
        Text("通过名称匹配")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_2,
          tabLabels: ["标签1", "标签2", "标签3"],
          tabContents: ["内容1", "内容2", "内容3"],
        })
        Text("标题栏滚动")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_3,
          tabLabels: ["标签1", "标签2", "标签3", "标签4", "标签5", "标签6", "标签7"],
          tabContents: ["内容1", "内容2", "内容3", "内容4", "内容5", "内容6", "内容7"],
        })
        Text("禁用标签")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_4,
          tabLabels: ["标签1", "标签2", "标签3"],
          tabContents: ["内容1", "内容2", "内容3"],
          tabDisabled: 1
        })
        Text("样式风格")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_5,
          tabLabels: ["标签1", "标签2", "标签3"],
          noContent:true,
          type:"card"
        })
        Text("点击事件")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_6,
          tabLabels: ["标签1", "标签2", "标签3"],
          tabContents: ["内容1", "内容2", "内容3"],
          onMessage:true //开启提示消息
        })
        Text("切换动画")
          .alignSelf(ItemAlign.Start)
          .margin(20)
        TabPage({
          currentIndex: $currentIndex_7,
          tabLabels: ["标签1", "标签2", "标签3"],
          tabContents: ["内容1", "内容2", "内容3"],
          animated:true
        })
      }
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#ffe9e9e9")
  }
}