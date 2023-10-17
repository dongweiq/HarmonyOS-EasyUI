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
import promptAction from '@ohos.promptAction';
import {Area_basic, Area_selectedPCD,Area_selectedPC,Area_placeholder} from "easyui"
@Entry
@Component
struct TestArea {
  @State @Watch("showResult") result: string = ""
  private scroller: Scroller = new Scroller()
  @State selectedProvince: string = "河北省"
  @State selectedCity: string = "唐山市"
  @State selectedDistrict: string = "路北区"

  showResult() {
    promptAction.showToast({
      message: "选中值：" + this.result,
      duration: 2000,
      bottom: 300
    })
  }

  build() {
    Scroll(this.scroller) {
      Column() {

        Text("基础用法")
          .margin({ top: 10 })
        Area_basic({
          result: $result
        })
          .margin({ left: 10, right: 10, top: 10 })
          .shadow({
            color: "#ff989898",
            radius: 10
          , offsetX: 0,
            offsetY: 0
          })
        Text("选中省市区")
          .margin({ top: 10 })
        Area_selectedPCD({
          result: $result,
          selectedProvince: $selectedProvince,
          selectedCity: $selectedCity,
          selectedDistrict: $selectedDistrict
        })
          .margin({ left: 10, right: 10, top: 10 })
          .shadow({
            color: "#ff989898",
            radius: 10
          , offsetX: 0,
            offsetY: 0
          })

        Text("配置显示列")
          .margin({ top: 10 })
        Area_selectedPC({
          result: $result,
          title: "标题1"
        })
          .margin({ left: 10, right: 10, top: 10 })
          .shadow({
            color: "#ff989898",
            radius: 10
          , offsetX: 0,
            offsetY: 0
          })

        Text("显示占位文字")
          .margin({ top: 10 })
        Area_placeholder({
          result: $result,
          title: "标题2"
        })
          .margin({ left: 10, right: 10, top: 10 })
          .shadow({
            color: "#ff989898",
            radius: 10
          , offsetX: 0,
            offsetY: 0
          })
      }
      .margin({ bottom: 10 })
    }
  }
}