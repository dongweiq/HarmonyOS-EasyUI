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


@Component
export struct CustomSteps {

  private steps:string[] = []        //步骤信息
  private successIcon:string = "Steps_success_circle.png"   //成功icon
  private defaultIcon:string = "Steps_default_circle.png"  //默认icon
  private hasSuccessIcon:string = "Steps_default_successCircle.png" //已经成功的icon
  private successFontColor:string = "#ff22980d"     //成功字体颜色
  private defaultFontColor:string = "#ff737373"     //默认字体颜色
  private hasSuccessFontColor:string = "#ff000000"  //已经成功的字体颜色
  private lineDefaultColor:string = "#ff737373"   //连接线默认颜色
  private lineSuccessColor:string = "#ff22980d"   //连接线成功颜色
  @Link currentStep:number  //是否是当前步骤
  build() {
    Column(){
      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){
        ForEach(this.steps,(item,index)=>{
          if(this.currentStep==index){
            Text(item)
              .fontColor(this.successFontColor)
          }else if(this.currentStep<index){
            Text(item)
              .fontColor(this.defaultFontColor)
          }else {
            Text(item)
              .fontColor(this.hasSuccessFontColor)
          }
        })
      }.margin(10)
      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}) {
        ForEach(this.steps,(item,index)=> {
          Row() {
            if (this.currentStep == index) {
              Image($rawfile(this.successIcon))
                .width(20)
                .height(20)
            } else if(this.currentStep<index){
              Image($rawfile(this.defaultIcon))
                .width(10)
                .height(10)
            }else{
              Image($rawfile(this.hasSuccessIcon))
                .width(10)
                .height(10)
            }
          }.height(25).width(50)
          if(index!=this.steps.length-1){
            if(this.currentStep<=index){
              Row(){
                Row()
                  .layoutWeight(1)
                  .height(2)
                  .backgroundColor(this.lineDefaultColor)
                  .alignSelf(ItemAlign.Center)
                  .margin({left:10,right:10})

              }.height(20).width("100%")
            }else{
              Row(){
                Row()
                  .layoutWeight(1)
                  .height(2)
                  .backgroundColor(this.lineSuccessColor)
                  .alignSelf(ItemAlign.Center)
                  .margin({left:10,right:10})

              }.height(20).width("100%")
            }

          }
        })
      }.margin({bottom:10,left:10,right:10})
    }.backgroundColor("#ffffffff")
  }
}

/**
 * 竖向步骤条
 */
@Component
export struct CustomSteps_vertical {

  private stepsStatus:string[] = []  //步骤状态
  private stepsTime:string[] = []    //步骤时间
  private successIcon:string = "Steps_success_circle.png"   //成功icon
  private defaultIcon:string = "Steps_default_circle.png"  //默认icon
  private hasSuccessIcon:string = "Steps_default_successCircle.png" //已经成功的icon
  private successFontColor:string = "#ff22980d"     //成功字体颜色
  private defaultFontColor:string = "#ff737373"     //默认字体颜色
  private hasSuccessFontColor:string = "#ff000000"  //已经成功的字体颜色
  private lineDefaultColor:string = "#ff737373"   //连接线默认颜色
  private lineSuccessColor:string = "#ff22980d"   //连接线成功颜色
  @Link currentStep:number

  build(){
    Row() {
      Column() {
        ForEach(this.stepsStatus, (item, index) => {
          Row(){
            if (this.currentStep == index) {
              Image($rawfile(this.successIcon))
                .width(20)
                .height(20)
            } else if (this.currentStep < index) {
              Image($rawfile(this.defaultIcon))
                .width(10)
                .height(10)
                .alignSelf(ItemAlign.Center)
            } else {
              Image($rawfile(this.hasSuccessIcon))
                .width(10)
                .height(10)
            }
          }.height(20)

          if (index != this.stepsStatus.length - 1) {
            if (this.currentStep <= index) {
              Column() {
                Divider()
                  .width(2)
                  .height(30)
                  .backgroundColor(this.lineDefaultColor)
                  .alignSelf(ItemAlign.Center)
              }.width("100%")
            }else{
              Column() {
                Divider()
                  .width(2)
                  .height(30)
                  .backgroundColor(this.lineSuccessColor)
                  .alignSelf(ItemAlign.Center)
              }.width("100%")
            }
          }
        })
      }.layoutWeight(1)
      .alignSelf(ItemAlign.Start)
      // .height(140)
      Column() {
        ForEach(this.stepsStatus, (item, index) => {
          if(this.currentStep==index){
            Column(){
              Text(item)
                .fontColor(this.successFontColor)
                .alignSelf(ItemAlign.Start)
              Text(this.stepsTime[index])
                .fontColor(this.successFontColor)
                .alignSelf(ItemAlign.Start)
            }.height(50).width("100%")
          }else if(this.currentStep<index){
            Column(){
              Text(item)
                .fontColor(this.defaultFontColor)
                .alignSelf(ItemAlign.Start)
              Text(this.stepsTime[index])
                .fontColor(this.defaultFontColor)
                .alignSelf(ItemAlign.Start)
            }.height(50).width("100%")
          }else {
            Column(){
              Text(item)
                .fontColor(this.hasSuccessFontColor)
                .alignSelf(ItemAlign.Start)
              Text(this.stepsTime[index])
                .fontColor(this.hasSuccessFontColor)
                .alignSelf(ItemAlign.Start)
            }.height(50).width("100%")
          }
        })
      }.layoutWeight(7)
    }
    .padding({top:10,bottom:10})
    .backgroundColor("#ffffffff")
  }
}
