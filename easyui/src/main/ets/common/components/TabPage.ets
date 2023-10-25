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


// xxx.ets
import display from '@ohos.display';
import deviceInfo from '@ohos.deviceInfo';
import promptAction from '@ohos.promptAction';


export class Func{
  static mainFunc(){
    let a = "aaa"
    console.log(a);
  }
}

@Component
export struct TabPage {
  @Link@Watch("showTip") currentIndex: number
  private controller: TabsController = new TabsController()

  private tabLabels:string[] = ["标签1","标签2","标签3","标签4"]  //标签页
  private tabContents:string[] = ["内容1","内容2","内容3","内容4"]  //内容页
  private animated:boolean = false   //是否开启切换动画
  private tabDisabled:number =-1   //禁用标签序号，从0开始
  private type:string = ""  //标签风格
  private tabPageWidth:number|string  = 60
  private onMessage:boolean = false
  private noContent:boolean = false

  showTip(){
      if(this.currentIndex == this.tabDisabled){
        promptAction.showToast({
          message:"标签"+(this.currentIndex+1)+"已被禁用",
          duration:2000,
          bottom:300
        })
      }else{
        if(this.onMessage){
          promptAction.showToast({
            message:"标签"+(this.currentIndex+1),
            duration:2000,
            bottom:300
          })
        }
      }
    }

  aboutToAppear(){

    //处理在开发板中和previewer中效果不同的情况
    if(this.tabLabels.length>4){
      if(deviceInfo.deviceType == "default"){
        this.tabPageWidth = px2vp(display.getDefaultDisplaySync().width/5)
      }else{
        this.tabPageWidth = 360/5
      }
    }else{
      this.tabPageWidth = "100%"
    }
  }

  @Builder TabBuilder(index: number, name: string) {
    if(this.type == "card"){
      if(this.tabDisabled != index){
        Column() {
          Text(name)
            .fontColor(this.currentIndex === index ? '#ffffffff' : '#ffff0000')
            .fontSize(16)
            .fontWeight(this.currentIndex === index ? 500 : 400)
            .lineHeight(22)
            .margin({ top: 17, bottom: 7 })
        }.width(this.tabPageWidth)
        .borderWidth(1)
        .borderColor("#ffff0000")
        .backgroundColor(this.currentIndex === index ? '#ffff0000' : '#ffffffff')
      }else{
        Column() {
          Text(name)
            .fontColor(this.currentIndex === index ? '#ffd7d7d7' : '#ffd7d7d7')
            .fontSize(16)
            .fontWeight(this.currentIndex === index ? 500 : 400)
            .lineHeight(22)
            .margin({ top: 17, bottom: 7 })
        }.width(this.tabPageWidth)
        .borderWidth(1)
        .borderColor("#ffd7d7d7")
        .backgroundColor('#ffffffff')
      }
    }
    if(this.tabDisabled != index){
      Column() {
        Text(name)
          .fontColor(this.currentIndex === index ? '#ff000000' : '#ff5d5d5d')
          .fontSize(16)
          .fontWeight(this.currentIndex === index ? 500 : 400)
          .lineHeight(22)
          .margin({ top: 17, bottom: 7 })
        Divider()
          .strokeWidth(2)
          .color('#ffff0000')
          .width("60%")
          .opacity(this.currentIndex === index ? 1 : 0)
          .animation({
            duration:200
          })
      }.width(this.tabPageWidth)
    }else{
      Column() {
        Text(name)
          .fontColor(this.currentIndex === index ? '#ffd7d7d7' : '#ffd7d7d7')
          .fontSize(16)
          .fontWeight(this.currentIndex === index ? 500 : 400)
          .lineHeight(22)
          .margin({ top: 17, bottom: 7 })
      }.width(this.tabPageWidth)
    }

  }

  build() {
    Column() {
          Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {

            ForEach(this.tabLabels, (item, index) => {
              TabContent() {
                if(this.currentIndex != this.tabDisabled){
                  Column() {
                    Text("" + this.tabContents[index])
                      .alignSelf(ItemAlign.Start)
                      .margin({ top: 10, left: 10 })
                  }.width('100%').height('100%').backgroundColor('#ffffffff')
                }
              }.tabBar(this.TabBuilder(index, item))
            })
          }
          .scrollable(true)
          .vertical(false)
          .barMode(this.tabLabels.length>4?BarMode.Scrollable:BarMode.Fixed)
          .barWidth("100%")
          .barHeight(56)
          .animationDuration(this.animated?300:0)
          .onChange((index: number) => {
            this.currentIndex = index
          })
          .width("100%")
          .height(this.noContent?56:100)
          .margin({ top: 0 })
          .backgroundColor('#ffffffff')

    }.width('100%')
  }
}