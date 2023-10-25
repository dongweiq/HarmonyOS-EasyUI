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


import {CustomSteps,CustomSteps_vertical} from "easyui"
@Entry
@Component
struct TestCustomSteps {
  private steps:string[] = ["买家下单","商家接单","买家提货","交易完成"]  //传入流程即可
  private stepsVerticalStatus:string[] = ["【城市】物流状态1","【城市】物流状态2","快件已发货","快件已下单"]
  private stepsVerticalTime:string[] = ["2016-07-12 12:40","2016-07-11 10:00","2016-07-10 09:30","2016-07-9 09:30"]
  @State currentStep:number = 0  //当前的步骤
  build() {
    Column(){
      Text("基础用法")
        .alignSelf(ItemAlign.Start)
        .margin({left:20,top:20,bottom:20})
        .fontSize(20)
        .fontColor("#ff797979")
      //使用组件
      CustomSteps({
        steps:this.steps, //传入步骤流程
        currentStep:$currentStep //传入当前的步骤
      })

      Button("下一步")
        .type(ButtonType.Normal)
        .backgroundColor("#ffffffff")
        .fontColor("#ff000000")
        .margin(20)
        .alignSelf(ItemAlign.Start)
        .onClick(()=>{
          if(this.currentStep<this.steps.length-1){
            this.currentStep +=1
          }else{
            this.currentStep = 0
          }
        })

      Text("自定义样式")
        .alignSelf(ItemAlign.Start)
        .margin({left:20,top:20,bottom:20})
        .fontSize(20)
        .fontColor("#ff797979")
      CustomSteps({
        steps:this.steps,
        currentStep:$currentStep,
        successIcon:"Steps_success_normal.png",
        successFontColor:"#ff1195db"
      })
      Text("竖向步骤条")
        .alignSelf(ItemAlign.Start)
        .margin({left:20,top:40,bottom:20})
        .fontSize(20)
        .fontColor("#ff797979")
      CustomSteps_vertical({
        currentStep:$currentStep,
        stepsStatus:this.stepsVerticalStatus,
        stepsTime:this.stepsVerticalTime
      })

    }.backgroundColor("#ffe7e7e7")
    .width("100%")
    .height("100%")
  }
}
