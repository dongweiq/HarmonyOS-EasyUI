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
 * 带图标
 */
@Component
export struct  TextInput_icon{
  @State iconUrl: string = "";//图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State inputType: InputType = InputType.Normal;//输入框类型

  build(){
    Column(){
      Row(){
        Row(){
          Stack(){
            Image($rawfile(this.iconUrl))
              .height(30)
              .margin({top: 5, left: 5})
          }
          .width("15%")

          Stack(){
            TextInput({ placeholder: this.placeholder})
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .height(50)
              .fontSize(20)
              .maxLength(15)
              .fontWeight(FontWeight.Bold)
              .fontFamily("sans-serif")
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderWidth(0)
              .borderRadius(0)
              .type(this.inputType)
          }
          .width("85%")
          .onAppear(() => {
            switch (this.placeholder){
              case "密码":
                this.inputType = InputType.Password;
                break;
              case "邮箱":
                this.inputType = InputType.Email;
                break;
              case "手机号":
                this.inputType = InputType.Number;
                break;
            }

          })
          .opacity(0.5)
        }
        .margin({right: "5%", left: "5%", top: "10"})
        .backgroundColor("#F3F3F3")
      }
    }
  }
}

/**
 * 带标签
 */
@Component
export struct TextInput_label{
  @State placeholder: string = "";//输入框提示文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State labelText: string = "";//标签文本
  @State labelTextColor: Color = Color.Red;//标签文本的颜色

  build(){
    Column(){
      Row(){
        Row(){
          Stack(){
            Text(this.placeholder)
              .fontSize(15)
              .margin({left:5})
          }
          .width("18%")

          Stack({alignContent:Alignment.End}){
            TextInput()
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .height(50)
              .fontSize(20)
              .maxLength(15)
              .fontFamily("sans-serif")
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderRadius(0)
              .type(this.inputType)

            Text(this.labelText)
              .fontSize(15)
              .fontColor(this.labelTextColor)
              .zIndex(10)
              .onAppear(() => {

                switch (this.labelText){
                  case "合法!!":
                    this.labelTextColor = Color.Green;
                    break;
                  case "不合法!!":
                    this.labelTextColor = Color.Red;
                    break;
                }
              })
          }
          .width("82%")
          .onAppear(() => {
            switch (this.placeholder){
              case "密码:":
                this.inputType = InputType.Password;
                break;
              case "邮箱:":
                this.inputType = InputType.Email;
                break;
              case "手机号:":
                this.inputType = InputType.Number;
                break;
              case "用户名:":
                this.inputType = InputType.Normal;
                break;
            }
          })
          .opacity(0.5)
        }
        .margin({right: "5%", left: "5%", top: "10"})
        .backgroundColor("#F3F3F3")
      }
    }
  }
}

/**
 * 搜索框
 */
@Component
export struct  TextInput_search {
  @State searchIconUrl: string = "";//搜索图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State borderRadius_num: number = 0;//输入框圆角值

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
            TextInput({ placeholder: this.placeholder})
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .height(50)
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontFamily("sans-serif")
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderWidth(0)
              .borderRadius(this.borderRadius_num)
              .type(this.inputType)
          }
          .width("85%")
          .opacity(0.5)
        }
        .borderRadius(this.borderRadius_num)
        .width('90%')
        .margin({right: "5%", left: "5%", top: "10"})
        .backgroundColor("#F3F3F3")
      }
      .borderRadius(this.borderRadius_num)
      .width("100%")
      .alignItems(VerticalAlign.Center)
    }
  }
}

/**
 * 禁用
 */
@Component
export struct  TextInput_disabled {
  @State iconUrl: string = "";//图标图片路径
  @State placeholder: string = "";//输入框提示文本
  @State inputType: InputType = InputType.Normal;//输入框类型
  @State borderRadius_num: number = 0;//输入框的圆角值
  @State isEnabled: boolean = false;//是否禁用
  @State isVisibility: Visibility = Visibility.Visible;//“已禁用！”提示文本的可见性

  build(){
    Column(){
      Row(){
        Row(){
          Stack(){
            Image($rawfile(this.iconUrl))
              .height(30)
              .width(30)
          }
          .width("15%")

          Stack({alignContent:Alignment.End}){
            TextInput({ placeholder: this.placeholder})
              .placeholderColor(Color.Gray)
              .caretColor(Color.Black)
              .height(50)
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
              .fontFamily("sans-serif")
              .fontStyle(FontStyle.Normal)
              .fontColor(Color.Black)
              .borderWidth(0)
              .borderRadius(this.borderRadius_num)
              .type(this.inputType)
              .enabled(this.isEnabled)
              .onAppear(() => {
                if(!this.isEnabled){
                  this.isVisibility = Visibility.Visible;
                }
                else {
                  this.isVisibility = Visibility.Hidden;
                }
              })

            Text("已禁用！")
              .fontSize(15)
              .fontColor(Color.Red)
              .zIndex(10)
              .visibility(this.isVisibility)
          }
          .width("85%")
          .opacity(0.5)
        }
        .borderRadius(this.borderRadius_num)
        .width('90%')
        .margin({right: "5%", left: "5%", top: "10"})
        .backgroundColor("#F3F3F3")
      }
      .borderRadius(this.borderRadius_num)
      .width("100%")
      .alignItems(VerticalAlign.Center)
    }
  }
}