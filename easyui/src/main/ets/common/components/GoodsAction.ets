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


import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
// @Entry
@Component
export struct GoodsAction_mini {
  private text:string = "客服"
  private icon:string = "GoodAction_service.png"
  private showTip:boolean = false;
  private tipNumber:number = 0
  private url:string = ""
  private isShowPrompt:boolean = false
  private promptMessage:string = "点击图标"
  showPrompt(){
    promptAction.showToast({
      message: this.promptMessage,
      duration: 1000,
      bottom:440
    });
  }

  build() {
    Column(){
        Button() {
          Stack() {
            Column() {
              Image($rawfile(this.icon))
                .height(20)
                .width(20)
              Text(this.text)
                .fontSize(12)
                .margin({ top: 3 })
            }.alignSelf(ItemAlign.Center)

            if (this.showTip) {
              Column() {
                Text(this.tipNumber.toString())
                  .fontSize(9)
                  .fontColor("#ffffffff")
                  .textAlign(TextAlign.Center)
                  .backgroundColor("#ffff0000")
                  .borderRadius(20)
                  .padding(this.tipNumber>=10?1:{left:3,right:3,top:1,bottom:1})
                  .alignSelf(ItemAlign.End)
                  .margin({ right: 5, top: 2 })

              }.width("100%")
              .height("100%")
            }
          }
          .height("100%")
        }
        .type(ButtonType.Normal)
        .backgroundColor("#ffffffff")
        .width(50)
        .height(50)
        .borderWidth(1)
        .borderColor("#ffefefef")
        .onClick(()=>{
          if(this.isShowPrompt){
            this.showPrompt()
          }
          router.pushUrl({
            url:this.url
          })
        })
      }
  }
}
// @Entry
@Component
export struct GoodsAction_big {
  private text:string = "加入购物车"
  private isPrimary:boolean = false
  private disable:boolean = false;
  private url:string = ""
  private isShowPrompt:boolean = false
  private promptMessage:string = "点击按钮"
  showPrompt(){
    promptAction.showToast({
      message: this.promptMessage,
      duration: 1000,
      bottom:440
    });
  }

  build() {
    Button() {
      Column() {
        Text(this.text)
          .margin(10)
          .fontColor("#ffffffff")
      }
    }
    .backgroundColor(this.isPrimary ? "#ffff4444" : "#ffff976a")
    .type(ButtonType.Normal)
    .hitTestBehavior(this.disable ? HitTestMode.None : HitTestMode.Default)
    .height(50)
    .layoutWeight(1)
    .onClick(() => {
      if(this.isShowPrompt){
        this.showPrompt()
      }
      router.pushUrl({
        url: this.url
      })
    })
  }
}
