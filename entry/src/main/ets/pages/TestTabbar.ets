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
import { Tabbar_default } from 'easyui'

@Entry
@Component
struct TestTabbar{
  build(){
    Scroll(){
      Column(){
        Column({space: 10}){
          Text("Tabbar基础用法")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Tabbar_default()
          }
          .width("100%")
          .height(100)
        }

        Column({space: 10}){
          Text("Tabbar自定义图标")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Tabbar_default(
              {
                tabIcon_up: ["Tabbar_group_customIcon_gray.png", "Tabbar_search_default_gray.png", "Tabbar_setting_default_gray.png"],
                tabIcon_down: ["Tabbar_group_customIcon_blue.png", "Tabbar_search_default_blue.png", "Tabbar_setting_default_blue.png"],
                tabIcon_cur: ["Tabbar_group_customIcon_gray.png", "Tabbar_search_default_gray.png", "Tabbar_setting_default_gray.png"],
                tabRed_text: ["标签", "标签", "标签"],
                tabRed: [3, 0, 0],
              }
            )
          }
          .width("100%")
          .height(100)
        }

        Column({space: 10}){
          Text("Tabbar自定义颜色")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Tabbar_default(
              {
                tabIcon_up: ["Tabbar_index_default_gray.png", "Tabbar_search_default_gray.png", "Tabbar_group_default_gray.png", "Tabbar_setting_default_gray.png"],
                tabIcon_down: ["Tabbar_index_customColor_green.png", "Tabbar_search_customColor_green.png", "Tabbar_group_customColor_green.png", "Tabbar_setting_customColor_green.png"],
                tabIcon_cur: ["Tabbar_index_default_gray.png", "Tabbar_search_default_gray.png", "Tabbar_group_default_gray.png", "Tabbar_setting_default_gray.png"],
                tabRed_text: ["标签", "标签", "标签", "标签"],
                tabRed: [0, 0, 0, 0],
              }
            )
          }
          .width("100%")
          .height(100)
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