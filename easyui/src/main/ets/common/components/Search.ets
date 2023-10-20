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


/**
 * 搜索_基础用法
 */
import promptAction from '@ohos.promptAction';
@Component
export struct  search_default {
  @State searchIconUrl: string = "";//搜索图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State text: string = "";//输入框文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State borderRadius_num: number = 0;//输入框圆角值
  @State visibility_close: Visibility = Visibility.Hidden;//关闭按钮的可见性
  controller: TextInputController = new TextInputController();

  build(){
    Column(){
      Row(){
        Row(){
          Stack(){
            Image($rawfile(this.searchIconUrl))
              .height(30)
              .width(30)
          }
          .width("15%")

          Stack(){
            TextInput({ placeholder: this.placeholder, text: this.text, controller: this.controller})
              .placeholderColor(Color.Black)
              .caretColor(Color.Black)
              .backgroundColor("#ffefefef")
              .height(50)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Black)
              .borderWidth(0)
              .borderRadius(this.borderRadius_num)
              .type(this.inputType)
              .onChange((value: string) => {
                this.text = value;
                if(this.text.length > 0)
                  this.visibility_close = Visibility.Visible;
                else
                  this.visibility_close = Visibility.Hidden;
              })
              .onEditChange((isEdit: boolean) => {
                if(isEdit && this.text.length > 0){
                  this.visibility_close = Visibility.Visible;
                }
                else{
                  this.visibility_close = Visibility.Hidden;
                }
              })
          }
          .width("75%")
          .opacity(0.5)

          Image($rawfile("Search_close.png"))
            .height(30)
            .position({x: "88%", y: "10%"})
            .visibility(this.visibility_close)
            .onClick(() => {
              this.text = "";
            })
            .opacity(0.7)
        }
        .borderRadius(this.borderRadius_num)
        .width('90%')
        .margin({right: "5%", left: "5%"})
        .backgroundColor("#ffefefef")
      }
      .backgroundColor(Color.White)
      .borderRadius(this.borderRadius_num)
      .width("100%")
      .height(100)
      .alignItems(VerticalAlign.Center)
    }
  }
}

/**
 * 搜索_监听
 */
@Component
export struct  search_listen {
  @State searchIconUrl: string = "";//搜索图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State text: string = "";//输入框文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State borderRadius_num: number = 0;//输入框圆角值
  @State visibility_close: Visibility = Visibility.Hidden;//关闭按钮的可见性
  controller: TextInputController = new TextInputController();

  build(){
    Column(){
      Row(){
        Row(){
          Stack(){
            Image($rawfile(this.searchIconUrl))
              .height(30)
              .width(30)
          }
          .width("15%")

          Row(){
            TextInput({ placeholder: this.placeholder, text: this.text, controller: this.controller})
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .width("90%")
              .height(50)
              .fontSize(20)
              .backgroundColor("#ffefefef")
              .fontWeight(FontWeight.Bold)
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderWidth(0)
              .borderRadius(this.borderRadius_num)
              .type(this.inputType)
              .onSubmit((key:EnterKeyType) => {
                promptAction.showToast({
                  message: this.text, // 显示文本
                  duration: 1500,              // 显示时长
                  bottom: 500                  // 距离底部的距离
                })
              })
              .onChange((value: string) => {
                this.text = value;
                if(this.text.length > 0)
                  this.visibility_close = Visibility.Visible;
                else
                  this.visibility_close = Visibility.Hidden;
              })
              .onEditChange((isEdit: boolean) => {
                if(isEdit && this.text.length > 0){
                  this.visibility_close = Visibility.Visible;
                }
                else{
                  this.visibility_close = Visibility.Hidden;
                }
              })

            Image($rawfile("Search_close.png"))
              .height(35)
              .position({x: "88%", y: "15%"})
              .visibility(this.visibility_close)
              .onClick(() => {
                this.text = "";
              })
          }
          .backgroundColor("#ffefefef")
          .width("70%")
          .opacity(0.5)

          Text("取消")
            .width("15%")
            .height("100%")
            .backgroundColor(Color.White)
            .fontSize(20)
            .fontColor(Color.Black)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              promptAction.showToast({
                message: "取消", // 显示文本
                duration: 1500,              // 显示时长
                bottom: 500                  // 距离底部的距离
              })

              this.text = ""
            })
        }
        .height("50")
        .borderRadius(this.borderRadius_num)
        .width('90%')
        .margin({right: "5%", left: "5%"})
        .backgroundColor("#ffefefef")
      }
      .backgroundColor(Color.White)
      .borderRadius(this.borderRadius_num)
      .width("100%")
      .height(100)
      .alignItems(VerticalAlign.Center)
    }
  }
}


/**
 * 搜索_高级
 */
@Component
export struct  search_advance {
  @State searchIconUrl: string = "";//搜索图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State text: string = "";//输入框文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State borderRadius_num: number = 0;//输入框圆角值
  @State visibility_close: Visibility = Visibility.Hidden;//关闭按钮的可见性
  controller: TextInputController = new TextInputController();

  build(){
    Column(){
      Row(){
        Row(){
          Row(){
            Text("地址")
              .fontSize("20")
              .margin({left: 5})

            Image($rawfile(this.searchIconUrl))
              .height(30)
              .width(30)
              .margin({left: 5})
          }
          .width("18%")

          Row(){
            TextInput({ placeholder: this.placeholder, text: this.text, controller: this.controller})
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .width("90%")
              .height(50)
              .fontSize(20)
              .borderRadius(0)
              .backgroundColor("#ffefefef")
              .fontWeight(FontWeight.Bold)
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderWidth(0)
              //.borderRadius(this.borderRadius_num)
              .type(this.inputType)
              .onSubmit((key:EnterKeyType) => {
                promptAction.showToast({
                  message: this.text, // 显示文本
                  duration: 1500,              // 显示时长
                  bottom: 500                  // 距离底部的距离
                })
              })
              .onChange((value: string) => {
                this.text = value;
                if(this.text.length > 0)
                  this.visibility_close = Visibility.Visible;
                else
                  this.visibility_close = Visibility.Hidden;
              })
              .onEditChange((isEdit: boolean) => {
                if(isEdit && this.text.length > 0){
                  this.visibility_close = Visibility.Visible;
                }
                else{
                  this.visibility_close = Visibility.Hidden;
                }
              })

            Image($rawfile("Search_close.png"))
              .height(35)
              .position({x: "88%", y: "15%"})
              .visibility(this.visibility_close)
              .onClick(() => {
                this.text = "";
              })
          }
          .margin({left: "5%"})
          .width("75%")
          .opacity(0.5)
        }
        .borderRadius(this.borderRadius_num)
        .backgroundColor("#ffefefef")
        .height("50")
        .width('80%')
        .margin({left: "5%"})

        Text("搜索")
          .height("100%")
          .backgroundColor(Color.White)
          .fontSize(20)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            promptAction.showToast({
              message: this.text, // 显示文本
              duration: 1500,              // 显示时长
              bottom: 500                  // 距离底部的距离
            })
          })
      }
      .backgroundColor(Color.White)
      .width("100%")
      .height(100)
      .alignItems(VerticalAlign.Center)
    }
  }
}
