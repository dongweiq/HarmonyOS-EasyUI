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
export const baseColor:string = "#ffdedede"

export const defaultColor:string = "#ff808080"

export const primaryColor:string = "#ff3280fc"

export const successColor:string = "#ff38b03f"

export const infoColor:string = "#ff03b8cf"

export const warningColor:string = "#fff1a325"

export const dangerColor:string = "#ffea644a"

/**
 * 颜色主题
 */
@Component
export struct Label_topic_default {
//  private textContent:string = "Default"
//  private fontColor:string = "#ffffffff"
  build() {
    Flex(){
      Text("Default")
        .forTopic()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(defaultColor)
    }
  }
}

@Component
export struct Label_topic_primary {
  build() {
    Flex(){
      Text("Primary")
        .forTopic()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(primaryColor)
    }
  }
}

@Component
export struct Label_topic_success {
  build() {
    Flex(){
      Text("Success")
        .forTopic()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(successColor)
    }
  }
}

@Component
export struct Label_topic_info {
  build() {
    Flex(){
      Text("Info")
        .forTopic()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(infoColor)
    }
  }
}

@Component
export struct Label_topic_warning {
  build() {
    Flex(){
      Text("Warning")
        .forTopic()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(warningColor)
    }
  }
}

@Component
export struct Label_topic_danger {
  build() {
    Flex(){
      Text("Danger")
        .fontSize(16)
        .forTopic()
        .fontColor("#ffffffff")
        .backgroundColor(dangerColor)
    }
  }
}

/**
 * 作为徽标
 */
@Component
export struct Label_badge_default {
  build() {
    Flex(){
      Text("Default")
        .fontSize(16)
        .forBadge()
        .fontColor("#ffffffff")
        .backgroundColor(defaultColor)
    }
  }
}

@Component
export struct Label_badge_primary {
  build() {
    Flex(){
      Text("Primary")
        .forBadge()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(primaryColor)
    }
  }
}

@Component
export struct Label_badge_success {
  build() {
    Flex(){
      Text("Success")
        .forBadge()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(successColor)
    }
  }
}

@Component
export struct Label_badge_info {
  build() {
    Flex(){
      Text("Info")
        .forBadge()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(infoColor)
    }
  }
}

@Component
export struct Label_badge_warning {
  build() {
    Flex(){
      Text("Warning")
        .forBadge()
        .fontSize(16)
        .fontColor("#ffffffff")
        .backgroundColor(warningColor)
    }
  }
}

@Component
export struct Label_badge_danger {
  build() {
    Flex(){
      Text("Danger")
        .fontSize(16)
        .forBadge()
        .fontColor("#ffffffff")
        .backgroundColor(dangerColor)
    }
  }
}

/**
 * 小圆点徽标
 */
@Component
export struct Label_dot_default {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(defaultColor)
    }
  }
}

@Component
export struct Label_dot_primary {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(primaryColor)
    }
  }
}

@Component
export struct Label_dot_success {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(successColor)
    }
  }
}

@Component
export struct Label_dot_info {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(infoColor)
    }
  }
}

@Component
export struct Label_dot_warning {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(warningColor)
    }
  }
}

@Component
export struct Label_dot_danger {
  build() {
    Flex(){
      Circle()
        .forDot()
        .fill(dangerColor)
    }
  }
}

/**
 * 轮廓外观
 */
@Component
export struct Label_outline_topic_default {
  build() {
    Flex(){
      Text("Default")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(defaultColor)
        .borderColor(defaultColor)
    }
  }
}

@Component
export struct Label_outline_topic_primary {
  build() {
    Flex(){
      Text("Primary")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(primaryColor)
        .borderColor(primaryColor)
    }
  }
}

@Component
export struct Label_outline_topic_success {
  build() {
    Flex(){
      Text("Success")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(successColor)
        .borderColor(successColor)
    }
  }
}

@Component
export struct Label_outline_topic_info {
  build() {
    Flex(){
      Text("Info")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(infoColor)
        .borderColor(infoColor)
    }
  }
}

@Component
export struct Label_outline_topic_warning {
  build() {
    Flex(){
      Text("Warning")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(warningColor)
        .borderColor(warningColor)
    }
  }
}

@Component
export struct Label_outline_topic_danger {
  build() {
    Flex(){
      Text("Danger")
        .fontSize(16)
        .forOutlineTopic()
        .fontColor(dangerColor)
        .borderColor(dangerColor)
    }
  }
}
//////
@Component
export struct Label_outline_badge_default {
  build() {
    Flex(){
      Text("Default")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(defaultColor)
        .borderColor(defaultColor)
    }
  }
}

@Component
export struct Label_outline_badge_primary {
  build() {
    Flex(){
      Text("Primary")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(primaryColor)
        .borderColor(primaryColor)
    }
  }
}

@Component
export struct Label_outline_badge_success {
  build() {
    Flex(){
      Text("Success")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(successColor)
        .borderColor(successColor)
    }
  }
}

@Component
export struct Label_outline_badge_info {
  build() {
    Flex(){
      Text("Info")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(infoColor)
        .borderColor(infoColor)
    }
  }
}

@Component
export struct Label_outline_badge_warning {
  build() {
    Flex(){
      Text("Warning")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(warningColor)
        .borderColor(warningColor)
    }
  }
}

@Component
export struct Label_outline_badge_danger {
  build() {
    Flex(){
      Text("Danger")
        .forOutlineBadge()
        .fontSize(16)
        .backgroundColor("#ffffffff")
        .fontColor(dangerColor)
        .borderColor(dangerColor)
    }
  }
}
//////
@Component
export struct Label_outline_dot_default {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(defaultColor)
    }
  }
}

@Component
export struct Label_outline_dot_primary {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(primaryColor)
    }
  }
}

@Component
export struct Label_outline_dot_success {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(successColor)
    }
  }
}

@Component
export struct Label_outline_dot_info {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(infoColor)
    }
  }
}

@Component
export struct Label_outline_dot_warning {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(warningColor)
    }
  }
}

@Component
export struct Label_outline_dot_danger {
  build() {
    Flex(){
      Circle()
        .forOutlineDot()
        .fill("#ffffffff")
        .strokeWidth(1)
        .stroke(dangerColor)
    }
  }
}

@Component
export struct Label_useInButton_default {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("我的消息")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(defaultColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_primary {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(primaryColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_success {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(successColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_info {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(infoColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_warning {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(warningColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_danger {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor(dangerColor)
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_primary_1 {

  @State bgColor:string = primaryColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor("#ff2464cd")
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = primaryColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff2464cd"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_success_1 {

  @State bgColor:string = successColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor("#ff277c2e")
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = successColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff277c2e"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_info_1 {

  @State bgColor:string = infoColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor("#ff058492")
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = infoColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff058492"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_warning_1 {

  @State bgColor:string = warningColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor("#ffcd8a1b")
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = warningColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ffcd8a1b"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_danger_1 {

  @State bgColor:string = dangerColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5})
          .alignSelf(ItemAlign.Center)
        Text("12")
          .fontSize(16)
          .padding({left:8,right:8,top:2,bottom:2})
          .borderRadius(20)
          .fontColor("#ffffffff")
          .backgroundColor("#ffc1482f")
          .margin({top:3,bottom:3})
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = dangerColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ffc1482f"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_default_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("列表")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff2464cd")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}


@Component
export struct Label_useInButton_primary_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff2464cd")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_success_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff277c2e")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_info_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff058492")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_warning_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ffcd8a1b")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_danger_2 {

  @State bgColor:string = baseColor
  build() {
    Flex() {
      Row() {
        Text("处理错误")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ffc1482f")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = baseColor
        }
      })
      .onClick(()=>{
        this.bgColor = defaultColor
        console.log("点击按钮")
      })
    }
  }
}


@Component
export struct Label_useInButton_primary_3 {

  @State bgColor:string = primaryColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff2464cd")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = primaryColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff2464cd"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_success_3 {

  @State bgColor:string = successColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff277c2e")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = successColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff277c2e"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_info_3 {

  @State bgColor:string = infoColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ff058492")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = infoColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ff058492"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_warning_3 {

  @State bgColor:string = warningColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ffcd8a1b")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = warningColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ffcd8a1b"
        console.log("点击按钮")
      })
    }
  }
}

@Component
export struct Label_useInButton_danger_3 {

  @State bgColor:string = dangerColor
  build() {
    Flex() {
      Row() {
        Text("联系人")
          .fontColor("#ffffffff")
          .margin({right:5,top:3,bottom:3})
          .alignSelf(ItemAlign.Center)
        Circle()
          .width(10)
          .height(10)
          .fill("#ffc1482f")
      }.backgroundColor(this.bgColor)
      .padding({left:10,right:10,top:5,bottom:5})
      .borderRadius(5)
      .animation({
        duration:50,
        onFinish:()=>{
          this.bgColor = dangerColor
        }
      })
      .onClick(()=>{
        this.bgColor = "#ffc1482f"
        console.log("点击按钮")
      })
    }
  }
}



@Styles function forTopic(){
  .padding({left:10,right:10,top:5,bottom:5})
  .borderRadius(5)
}

@Styles function forBadge(){
  .padding({left:10,right:10,top:5,bottom:5})
  .borderRadius(20)
}

@Styles function forDot(){
  .width(20)
  .height(20)
}

@Styles function forOutlineTopic(){
  .borderWidth(2)
  .padding({left:8,right:8,top:4,bottom:4})
  .borderRadius(5)
}

@Styles function forOutlineBadge(){
  .borderWidth(2)
  .padding({left:8,right:8,top:4,bottom:4})
  .borderRadius(20)
}

@Styles function forOutlineDot(){
  .width(19)
  .height(19)
}