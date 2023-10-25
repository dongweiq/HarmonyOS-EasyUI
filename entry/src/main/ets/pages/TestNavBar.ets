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


import { NavBar } from 'easyui'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct TestNavBar {

  @State@Watch("showLeftWarn") leftClicked:boolean = false
  @State@Watch("showRightWarn") rightClicked:boolean = false
  //左边文本按钮点击事件
  leftClickEvent(){
    console.log("leftClickEvent")
  }
  //右边文本按钮点击事件
  rightClickEvent(){
    console.log("rightClickEvent")
  }

  //左边按钮的提示弹窗消息
  showLeftWarn(){
    promptAction.showToast({
      message:"返回",
      duration:2000,
      bottom:300
    })
  }
  //右边按钮的提示弹窗消息
  showRightWarn(){
    promptAction.showToast({
      message:"按钮",
      duration:2000,
      bottom:300
    })
  }

  build() {
    Column(){
      Text("基础用法")
        .fontColor("#ff737373")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      NavBar({
        leftClickEvent:this.leftClickEvent,
        rightClickEvent:this.rightClickEvent,
        title:"标题",
        rightText:"按钮",
        leftText:"返回",
        hasLeftArrow:true,
        leftClicked:$leftClicked,
        rightClicked:$rightClicked
      })
      Text("高级用法")
        .fontColor("#ff737373")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      NavBar({
        leftClickEvent:this.leftClickEvent,
        rightClickEvent:this.rightClickEvent,
        rightIcon:"NavBar_search.png",
        leftClicked:$leftClicked,
        rightClicked:$rightClicked
      })
    }.width("100%")
    .height("100%")
    .backgroundColor("#ffeeeeee")
  }
}