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


import {  CustomCalendar } from "@isrc/easyui"
@Entry
@Component
struct TestCustomCalendar {

  dialogController: CustomDialogController = new CustomDialogController({
    builder:  CustomCalendar({confirmSelectedDay:$selectedDay}),
    cancel:()=>{
      console.info('退出选择日期')
    },
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset:{dx:0,dy:-20}
  })
  @State selectedDay:string=''  // 点击选中的时间
  build() {
    Column() {
      Button('显示日历弹框')
        .onClick(() => {
          this.dialogController.open()
        }).backgroundColor(0x317aff)
      Text(this.selectedDay)
        .fontSize(30)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .margin({ top: 5 })
  }
}