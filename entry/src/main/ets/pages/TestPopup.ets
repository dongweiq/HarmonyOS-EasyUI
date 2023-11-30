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


import { Popup_bottom, Popup_default, Popup_right, Popup_top} from '@isrc/easyui'
@Entry
@Component
struct TestTabbar{
  @State pop_w_default: string = "0%";
  // @State pop_visibility_default: Visibility = Visibility.Hidden;
  @State pop_visibility_bottom: Visibility = Visibility.Hidden;
  @State pop_visibility_top: Visibility = Visibility.Hidden;
  @State pop_visibility_right: Visibility = Visibility.Hidden;
  build(){
      Column({space: 20}){

        Column({space: 10}){
          Text("Popup基础用法")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Column(){
            Button("弹出Popup")
              .type(ButtonType.Normal)
              .height("10%")
              .width("35%")
              .backgroundColor(Color.White)
              .fontSize(25)
              .fontColor(Color.Black)
              .shadow({radius: 5})
              .onClick(() => {
                // this.pop_visibility_default = Visibility.Visible;
                this.pop_w_default = "100%";
              })
          }
        }


        Column({space: 10}){
          Text("Popup弹出位置")
            .fontSize(25)
            .width("100%")
            .height(30)
            .margin({left: 10})
            .align(Alignment.Start)
          Row({space: 10}){
            Button("底部弹出")
              .type(ButtonType.Normal)
              .height("10%")
              .width("30%")
              .backgroundColor(Color.White)
              .fontSize(25)
              .fontColor(Color.Black)
              .shadow({radius: 5})
              .onClick(() => {
                this.pop_visibility_bottom = Visibility.Visible;
              })

            Button("顶部弹出")
              .type(ButtonType.Normal)
              .height("10%")
              .width("30%")
              .backgroundColor(Color.White)
              .fontSize(25)
              .fontColor(Color.Black)
              .shadow({radius: 5})
              .onClick(() => {
                this.pop_visibility_top = Visibility.Visible;
                setTimeout(() => {
                  this.pop_visibility_top = Visibility.Hidden;
                }, 2000)
              })

            Button("右侧弹出")
              .type(ButtonType.Normal)
              .height("10%")
              .width("30%")
              .backgroundColor(Color.White)
              .fontSize(25)
              .fontColor(Color.Black)
              .shadow({radius: 5})
              .onClick(() => {
                this.pop_visibility_right = Visibility.Visible;
              })
          }
        }

        // Popup_default({default_visibility: $pop_visibility_default})
        Popup_default({comp_w: $pop_w_default})


        Popup_bottom({bottom_visibility: $pop_visibility_bottom})

        Popup_top({top_visibility: $pop_visibility_top})

        Popup_right({right_visibility: $pop_visibility_right})

      }
  }
}