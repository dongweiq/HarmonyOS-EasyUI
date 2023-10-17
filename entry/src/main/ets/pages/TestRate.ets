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
import { Rate_default } from "easyui"
import { Rate_icon } from "easyui"
import { Rate_style } from "easyui"
import { Rate_halfStar } from "easyui"
import { Rate_number } from "easyui"
import { Rate_disabled } from "easyui"
import { Rate_readOnly } from "easyui"

@Entry
@Component
struct TestRate{
  build(){
    Scroll(){
      Column(){
        Column({space: 5}){
          Text("Rate基础用法")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_default();
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate自定义图标")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_icon();
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate自定义样式")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_style();
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate半星")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_halfStar();
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate自定义数量")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_number({total_score: 7});
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate禁用状态")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_disabled();
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("Rate只读状态")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Rate_readOnly();
          }
          .width("100%")
        }
      }
    }
    .scrollable(ScrollDirection.Vertical) // 设置竖直滚动
    .scrollBarColor(Color.Gray)          // 设置滚动条颜色
    .scrollBarWidth(5)                   // 设置滚动条宽度
    .scrollBar(BarState.Auto)            // 设置滚动条永久显示
    .height("100%")
    .align(Alignment.Top)
  }
}