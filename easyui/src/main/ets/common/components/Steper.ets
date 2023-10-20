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


// @Entry
@Component
export struct steper {
  @State currentValue:number = 1
  private min:number = 1
  private max:number = 100
  private step:number = 1
  private disabled:boolean = false
  private asyncChange:boolean =false

  build() {
    if(!this.disabled){
      Row() {
        if (this.currentValue == this.min) {
          Button(){
            Text("-")
              .fontColor("#ff757575")
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffececec")
          .borderRadius(2)
          .width(30)
          .height(30)

        } else {
          Button() {
            Text("-")
              .fontColor("#ff000000")
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffd9d9d9")
          .borderRadius(2)
          .width(30)
          .height(30)
          .onClick(()=>{
            if((this.currentValue-this.step)>=this.step){
              if(!this.asyncChange){
                this.currentValue -= this.step
              }else{
                setTimeout(()=>{
                  this.currentValue -= this.step
                },1000)
              }
            }else{
              if(!this.asyncChange){
                this.currentValue = this.min
              }else{
                setTimeout(()=>{
                  this.currentValue = this.min
                },1000)
              }
            }
          })
        }

        Text(`${this.currentValue}`)
          .backgroundColor("#ffd9d9d9")
          .textAlign(TextAlign.Center)
          .margin({left:2,right:2})
          .width(30)
          .height(30)

        if (this.currentValue == this.max) {
          Button(){
            Text("+")
              .fontColor("#ff757575")
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffececec")
          .borderRadius(2)
          .width(30)
          .height(30)
        } else {
          Button() {
            Text("+")
              .fontColor("#ff000000")
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffd9d9d9")
          .borderRadius(2)
          .width(30)
          .height(30)
          .onClick(()=>{
            if((this.currentValue+this.step)<=this.max){
              if(!this.asyncChange){
                this.currentValue += this.step
              }else{
                setTimeout(()=>{
                  this.currentValue += this.step
                },1000)
              }
            }else{
              if(!this.asyncChange){
                this.currentValue = this.max
              }else{
                setTimeout(()=>{
                  this.currentValue = this.max
                },1000)
              }
            }
          })
        }
      }
    }else {
      Row() {
        Button() {
          Text("-")
            .fontColor("#ffc1c1c1")
        }
        .type(ButtonType.Normal)
        .backgroundColor("#ffececec")
        .borderRadius(2)
        .width(30)
        .height(30)
        .hitTestBehavior(HitTestMode.None)

        Text(`${this.currentValue}`)
          .fontColor("#ffc1c1c1")
          .backgroundColor("#ffececec")
          .textAlign(TextAlign.Center)
          .margin({ left: 2, right: 2 })
          .width(30)
          .height(30)

        Button() {
          Text("+")
            .fontColor("#ffc1c1c1")
        }
        .type(ButtonType.Normal)
        .backgroundColor("#ffececec")
        .borderRadius(2)
        .width(30)
        .height(30)
        .hitTestBehavior(HitTestMode.None)
      }
    }
  }
}