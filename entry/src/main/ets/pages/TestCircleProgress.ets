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


import { CircleProgress } from '@isrc/easyui'
@Entry
@Component
struct TestCircleProgress {
  @State progressCurrentValue:number = 20
  private progressToTalValue:number = 100
  build() {
    Column(){
      Text("基础用法")
        .alignSelf(ItemAlign.Start).margin(20)
      Row(){
        CircleProgress({
          progressCurrentValue:$progressCurrentValue,
          progressTotalValue:this.progressToTalValue,
          progressWidth:150,
          progressColor:"#ff1989fa",
          progressStrokeWidth:5
        }).margin({right:20})
        CircleProgress({
          progressCurrentValue:$progressCurrentValue,
          progressTotalValue:this.progressToTalValue,
          progressWidth:150,
          progressColor:"#ff07c160"
        })
      }
      .alignSelf(ItemAlign.Start)
      .margin({left:20})
      Row(){
        Button("增加")
          // .padding({left:20,right:20,top:10,bottom:10})
          .type(ButtonType.Normal)
          .backgroundColor("#ff07c161")
          .borderRadius(5)
          .fontColor(Color.White)
          .margin({left:10,right:10})
          .onClick(()=>{
              if(this.progressCurrentValue<this.progressToTalValue)
                this.progressCurrentValue += 20
          })

        Button("减少")
          .type(ButtonType.Normal)
          .backgroundColor("#ffff4444")
          .borderRadius(5)
          .fontColor(Color.White)
          .onClick(()=>{
            if(this.progressCurrentValue>0)
              this.progressCurrentValue -= 20
          })
      }.alignSelf(ItemAlign.Start)
      .margin({top:20})

    }.width("100%")
  }
}