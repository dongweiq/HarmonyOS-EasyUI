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


import { Radio_default } from '@isrc/easyui';
import { Radio_disabled } from '@isrc/easyui';
import { Radio_color } from '@isrc/easyui';
import { Radio_icon } from '@isrc/easyui';
import { Radio_cell } from '@isrc/easyui';

@Entry
@Component
struct TestRadio{

  build(){
    Scroll(){
      Column(){
        Column({space: 5}){
          Text("Radio基础用法")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10, top: 10})
            .align(Alignment.Start)
          Column(){
            Radio_default({name: ["单选框 1", "单选框 2"], checked_init:[false, true], radio_groupName: "1"})
          }
          .width("100%")
          .margin({left: 10})
        }

        Column({space: 5}){
          Text("Radio禁用状态")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10, top: 10})
            .align(Alignment.Start)
          Column(){
            Radio_disabled({name: ["单选框 1", "单选框 2"], checked_init:[false, true], isDisabled:[true, true], radio_groupName: "1"})
          }
          .width("100%")
          .margin({left: 10})
        }

        Column({space: 5}){
          Text("Radio自定义颜色")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10, top: 10})
            .align(Alignment.Start)
          Column(){
            Radio_color({name: ["单选框"], checked_init:[true], radio_groupName: "1"})
          }
          .width("100%")
          .margin({left: 10})
        }

        Column({space: 5}){
          Text("Radio自定义图标")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10, top: 10})
            .align(Alignment.Start)
          Column(){
            Radio_icon({name: ["自定义图标"], checked_init:[true], radio_groupName: "1"})
          }
          .width("100%")
          .margin({left: 10})
        }

        Column({space: 5}){
          Text("Radio+cell")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10, top: 10})
            .align(Alignment.Start)
          Column(){
            Radio_cell({name: ["单选框1", "单选框2", "单选框3"], checked_init:[true, false, false], radio_groupName: "1"})
          }
          .width("100%")
          .margin({left: 10})
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