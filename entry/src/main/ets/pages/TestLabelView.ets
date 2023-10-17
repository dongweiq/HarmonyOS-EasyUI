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
import { LabelView } from 'easyui'
import prompt from '@ohos.prompt'
@Entry
@Component
struct TestLabelView {
  build() {
    // LabelView组件测试
    //Button组件
    Stack() {
      Button("Button")
        .width(300)
        .height(60)
        .fontSize(25)
        .type(ButtonType.Normal)

      LabelView({
        viewW: 300,
        viewH: 60,
        labelTitle: "HD",
        labelLoc: 1,
        distance: 20,
        labelW: 30
      })

      Rect()
        .width(300)
        .height(60)
        .opacity(0)
        .onClick(() => {
          prompt.showToast({
            message: "click button", // 显示文本
            duration: 1500, // 显示时长
            bottom: 800 // 距离底部的距离
          })
        })

    }
    .width("95%")
    .height(80)
    .margin({ top: 20 })
    .border({ width: 5, color: Color.Gray, radius: 15 })
    .backgroundColor(Color.White)
    .shadow({
      radius: 15,
      color: Color.Gray,
      offsetX: 15,
      offsetY: 15
    })

  }
}