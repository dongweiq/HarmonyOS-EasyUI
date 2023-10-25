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


import { NumberKeyboard_custom, NumberKeyboard_default } from 'easyui'
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct TestNumberKeyboard {
  @State@Watch("showResult") result:string = ""
  @State isPop_1:boolean = false  //控制默认键盘弹出
  @State isPop_2:boolean = false //控制自定义键盘弹出

  showResult(){
    promptAction.showToast({
      message:"选中值："+this.result,
      duration:2000,
      bottom:350
    })
  }

  build() {
    Column(){
      Column(){
        Text("默认样式")
          .alignSelf(ItemAlign.Start)
          .margin({left:10,top:10})
          .fontColor("#ff7a7a7a")
        Button("弹出默认键盘")
          .fontColor("#ff000000")
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .margin({left:10,top:10})
          .onClick(()=>{
            this.isPop_1 = true
            this.isPop_2 = false
          })
      }
      .width("100%")

      Column(){
        Text("自定义样式")
          .alignSelf(ItemAlign.Start)
          .margin({left:10,top:10})
          .fontColor("#ff7a7a7a")
        Button("弹出自定义键盘")
          .fontColor("#ff000000")
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .margin({left:10,top:10})
          .onClick(()=>{
            this.isPop_1 = false
            this.isPop_2 = true
          })
      }
      .width("100%")


        Row() {
          Stack() {
              NumberKeyboard_default({
                result: $result,
                isPop: $isPop_1
              })
              NumberKeyboard_custom({
                result: $result,
                isPop: $isPop_2
              })
          }
          .alignSelf(ItemAlign.End)
        }.layoutWeight(4)
    }
    .backgroundColor("#ffe3e3e3")
    .width("100%")
  }
}