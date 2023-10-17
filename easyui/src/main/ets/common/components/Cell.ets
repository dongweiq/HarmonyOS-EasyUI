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
// @Entry
import router from '@ohos.router'
@Component
export struct Cell {

  private leftTitle:string = "" //自定义标题显示内容
  private describeMessage:string = ""   //自定义标题下方描述显示内容
  private label:string = ""
  private rightTitle:string = ""
  private leftIcon:string = ""  //自定义左侧图标
  private rightArrow:string = "" //自定义右侧按钮
  private url:string = ""

  @State bgColor:string = "#ffffffff"
  build() {
    Column() {
      Row() {
        if (this.leftIcon != "") {
            Image($rawfile(this.leftIcon))
              .width(16)
              .height(16)
              .margin({ right: 5 })
        }
        if (this.leftTitle != "") {
            Text(this.leftTitle)
              .alignSelf(ItemAlign.Start)
              .margin({ right: 5 })
        }
        if (this.label != "") {
          Text(this.label)
            .fontColor("#ffffffff")
            .fontSize(14)
            .backgroundColor("#ffff0000")
            .padding(2)
        }
          if(this.leftTitle==""&&this.leftIcon==""&&this.label==""&&this.describeMessage==""){ //如果只设置rightTitle
            Text(this.rightTitle)
              .fontColor("#ff000000")
              .margin({ right: 5 })
          }else {
            Column() {
              Text(this.rightTitle)
                .fontColor("#ff818181")
                .alignSelf(ItemAlign.End)
                .margin({ right: 5 })
            }.layoutWeight(1)
          }
        if (this.rightArrow != "") {
          Text(this.rightArrow)
            .fontWeight(FontWeight.Bolder)
            .fontColor("#ff818181")
        }
      }.width("100%")
      if(this.describeMessage!=""){
        Text(this.describeMessage)
          .fontSize(14)
          .fontColor("#ff818181")
          .alignSelf(ItemAlign.Start)
          .margin({top:5})
      }
    }
    .backgroundColor(this.bgColor)
    .padding(10)
    .width("100%")
    .hitTestBehavior(this.rightArrow==""?HitTestMode.None:HitTestMode.Default)
    .onClick(()=>{
      this.bgColor = "#ffc1c1c1"
      router.pushUrl({
        url:this.url
      })
      setTimeout(()=>{
        this.bgColor = "#ffffffff"
      },50)
    })
    .animation({
      duration:50
    })
  }
}


@Component
export struct Cell_group {

  private leftTitle:string = "" //自定义标题显示内容
  private describeMessage:string = ""   //自定义标题下方描述显示内容
  private label:string = ""
  private rightTitle:string = ""
  private leftIcon:string = ""  //自定义左侧图标
  private rightArrow:string = "" //自定义右侧按钮
  private url:string = ""
  private groupTitle:string = ""

  @State bgColor:string = "#ffffffff"

  build() {
    Column() {
      Text(this.groupTitle)
        .fontColor("#ff818181")
        .alignSelf(ItemAlign.Start)
      .margin({left:10,bottom:5,top:10})
      Row(){
        Row() {
          if (this.leftIcon != "") {
            Image($rawfile(this.leftIcon))
              .width(16)
              .height(16)
              .margin({ right: 5 })
          }
          if (this.leftTitle != "") {
            Text(this.leftTitle)
              .alignSelf(ItemAlign.Start)
              .margin({ right: 5 })
          }
          if (this.label != "") {
            Text(this.label)
              .fontColor("#ffffffff")
              .fontSize(12)
              .backgroundColor("#ffff0000")
              .padding(2)
          }
          if(this.leftTitle==""&&this.leftIcon==""&&this.label==""&&this.describeMessage==""){ //如果只设置rightTitle
            Text(this.rightTitle)
              .fontColor("#ff000000")
              .margin({ right: 5 })
          }else {
            Column() {
              Text(this.rightTitle)
                .fontColor("#ff818181")
                .alignSelf(ItemAlign.End)
                .margin({ right: 5 })
            }.layoutWeight(1)
          }
          if (this.rightArrow != "") {
            Text(this.rightArrow)
              .fontWeight(FontWeight.Bolder)
              .fontColor("#ff818181")
          }
        }.width("100%")
        if(this.describeMessage!=""){
          Text(this.describeMessage)
            .fontSize(14)
            .fontColor("#ff818181")
            .alignSelf(ItemAlign.Start)
            .margin({top:5})
        }
      }
      .backgroundColor(this.bgColor)
      .padding(10)
      .hitTestBehavior(this.rightArrow==""?HitTestMode.None:HitTestMode.Default)
      .onClick(()=>{
        this.bgColor = "#ffc1c1c1"
        router.pushUrl({
          url:this.url
        })
        setTimeout(()=>{
          this.bgColor = "#ffffffff"
        },50)
      })
      .animation({
        duration:50
      })
    }
    .width("100%")

  }
}