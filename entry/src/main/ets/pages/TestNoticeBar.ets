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


import { NoticeBar_default } from "easyui"
import { NoticeBar_bar } from "easyui"
import { NoticeBar_disabled } from "easyui"
import { NoticeBar_nextLine } from "easyui"

@Entry
@Component
struct TestNoticeBar{
  build(){
    Scroll(){
      Column(){
        Column({space: 5}){
          Text("NoticeBar基础用法")
            .fontSize(15)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            NoticeBar_default({notice_text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。"});
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("NoticeBar通告栏模式")
            .fontSize(15)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            NoticeBar_bar({notice_text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。", iconURL: "NoticeBar_close.png"});
          }
          .width("100%")

          Column(){
            NoticeBar_bar({notice_text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。", iconURL: "NoticeBar_detail.png"});
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("NoticeBar禁用滚动")
            .fontSize(15)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            NoticeBar_disabled({notice_text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。"});
          }
          .width("100%")
        }

        Column({space: 5}){
          Text("NoticeBar文本换行")
            .fontSize(15)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            NoticeBar_nextLine({notice_text: "足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。"});
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