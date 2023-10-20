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


import { ImagePreview } from 'easyui'
@Entry
@Component
struct TestImagePreview {
  @State showImagePreview_basicUse:boolean = false
  @State showImagePreview_setStartIndex:boolean = false
  @State showImagePreview_asyncClose:boolean = false
  @State showImagePreview_callComponent:boolean = false

  build() {
    Stack() {
      Column() {
        Text("基础用法")
          .margin(20)
          .fontColor("#ff757575")
          .alignSelf(ItemAlign.Start)
        Button("预览图片")
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .fontColor("#ff000000")
          .padding(10)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 20, left: 20 })
          .onClick(() => {
            this.showImagePreview_basicUse = true
          })

        Text("指定初始位置")
          .margin(20)
          .fontColor("#ff757575")
          .alignSelf(ItemAlign.Start)
        Button("指定初始位置")
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .fontColor("#ff000000")
          .padding(10)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 20, left: 20 })
          .onClick(() => {
            this.showImagePreview_setStartIndex = true
          })

        Text("异步关闭")
          .margin(20)
          .fontColor("#ff757575")
          .alignSelf(ItemAlign.Start)
        Button("异步关闭")
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .fontColor("#ff000000")
          .padding(10)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 20, left: 20 })
          .onClick(() => {
            this.showImagePreview_asyncClose = true
          })

        Text("组件调用")
          .margin(20)
          .fontColor("#ff757575")
          .alignSelf(ItemAlign.Start)
        Button("组件调用")
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .fontColor("#ff000000")
          .padding(10)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 20, left: 20 })
          .onClick(() => {
            this.showImagePreview_callComponent = true
          })
      }.width("100%")
      .height("100%")
      .backgroundColor("#ffe9e9e9")

      if (this.showImagePreview_basicUse) {
        ImagePreview({
          images: ["SwipeCaptcha_test1.jpg", "SwipeCaptcha_test2.jpg", "SwipeCaptcha_test3.jpg", "SwipeCaptcha_test4.jpg"],
          showImagePreview: $showImagePreview_basicUse
        })
      }
      if (this.showImagePreview_setStartIndex) {
        ImagePreview({
          images: ["SwipeCaptcha_test1.jpg", "SwipeCaptcha_test2.jpg", "SwipeCaptcha_test3.jpg", "SwipeCaptcha_test4.jpg"],
          showImagePreview: $showImagePreview_setStartIndex,
          startIndex: 2
        })
      }
      if (this.showImagePreview_asyncClose) {
        ImagePreview({
          images: ["SwipeCaptcha_test1.jpg", "SwipeCaptcha_test2.jpg", "SwipeCaptcha_test3.jpg", "SwipeCaptcha_test4.jpg"],
          showImagePreview: $showImagePreview_asyncClose,
          asyncClose: true
        })
      }
      if (this.showImagePreview_callComponent) {
        ImagePreview({
          images: ["SwipeCaptcha_test1.jpg", "SwipeCaptcha_test2.jpg", "SwipeCaptcha_test3.jpg", "SwipeCaptcha_test4.jpg"],
          showImagePreview: $showImagePreview_callComponent,
          showIndexPage: false
        })
      }
    }
  }
}