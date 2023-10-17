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
import router from '@ohos.router';
import web_webview from '@ohos.web.webview';

/**
 * 感情色彩
 */
@Component
export struct Alert_emotion{

  cur_emotion: string = "";
  //感情色彩: (默认为灰色)
  // 默认 -- 灰色     primary -- 蓝色   success -- 绿色
  // info -- 青色    warning -- 橙色   danger -- 红色
  cur_title: string = "";//Alert的标题文本
  cur_detail: string = "";//Alert的详细说明文本
  isSingleLine: boolean = false//是否单行显示

  height_single_message: number = 50;
  height_multi_message: number = 100;

  @State cur_bg_color: string = "#F1F1F1";//Alert背景颜色
  @State cur_text_color: string = "#000000";//Alert文本颜色
  @State cur_divider_color: string = "#E4E4E4";//标题与详细说明之间的分隔线的颜色

  @State single_line_Visible: Visibility = Visibility.Hidden;
  @State multi_Line_Visible: Visibility = Visibility.Visible;

  @State height_message: number = 100;//Alert高度

  build(){
    Stack({alignContent: Alignment.Center}){
      Column(){//两行显示
        Row(){
          Text(this.cur_title)
            .fontWeight(3)
            .margin({left: 10})
            .fontWeight(900)
            .fontColor(this.cur_text_color)
        }
        .width("100%")
        .height("49%")
        .align(Alignment.Start)

        Rect()
          .height("2%")
          .fill(this.cur_divider_color)
          .width("98%")

        Row(){
          Text(this.cur_detail)
            .fontWeight(3)
            .margin({left: 10})
            .fontWeight(400)
            .fontColor(this.cur_text_color)
        }
        .width("100%")
        .height("49%")
        .align(Alignment.Start)
      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_multi_message)
      .visibility(this.multi_Line_Visible)
      .onAppear(() => {
        if(this.multi_Line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#E4E4E4";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#D0E0F1";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              this.cur_divider_color = "#BAE8B6";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#E75033";
              this.cur_divider_color = "#fff1c2b9";
              break;
          }
        }
      })


      Column(){//单行显示
        Row(){
          Text(this.cur_title)
            .fontWeight(3)
            .margin({left: 10})
            .fontWeight(900)
            .fontColor(this.cur_text_color)

          Text(this.cur_detail)
            .fontWeight(3)
            .margin({left: 10})
            .fontWeight(400)
            .fontColor(this.cur_text_color)
        }
        .width("100%")
        .height("100%")
        .align(Alignment.Start)
      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_single_message)
      .visibility(this.single_line_Visible)
      .onAppear(() => {
        if(this.single_line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#FF2023";
              break;
          }
        }
      })

    }
    .height(this.height_message)
    .onAppear(() => {
      if(this.isSingleLine == true){
        this.single_line_Visible = Visibility.Visible;
        this.multi_Line_Visible = Visibility.Hidden;
        this.height_message = this.height_single_message;
      }
      else {
        this.single_line_Visible = Visibility.Hidden;
        this.multi_Line_Visible = Visibility.Visible;
        this.height_message = this.height_multi_message;
      }
    })
  }
}

/**
 * 感情色彩+图标
 */
@Component
export struct Alert_emotion_icon{
  cur_emotion: string = "";
  //感情色彩: (默认为灰色)
  // 默认 -- 灰色     primary -- 蓝色   success -- 绿色
  // info -- 青色    warning -- 橙色   danger -- 红色
  cur_iconUrl: string = "";//Alert图标url
  icon_size: number = 30;//Alert图标大小
  cur_title: string = "";//Alert的标题文本
  cur_detail: string = "";//Alert的详细说明文本
  isSingleLine: boolean = false;//是否单行显示

  height_single_message: number = 50;
  height_multi_message: number = 100;

  @State cur_bg_color: string = "#F1F1F1";//Alert背景颜色
  @State cur_text_color: string = "#000000";//Alert文本颜色
  @State cur_divider_color: string = "#E4E4E4";//标题与详细说明之间的分隔线的颜色

  @State single_line_Visible: Visibility = Visibility.Hidden;
  @State multi_Line_Visible: Visibility = Visibility.Visible;

  @State height_message: number = 100;//Alert高度

  build(){
    Stack({alignContent: Alignment.Center}){
      Row(){//两行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)

          Rect()
            .height("2%")
            .fill(this.cur_divider_color)
            .width("98%")

          Row(){
            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)
        }
        .width("85%")

      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_multi_message)
      .visibility(this.multi_Line_Visible)
      .onAppear(() => {
        if(this.multi_Line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#E4E4E4";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#D0E0F1";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              this.cur_divider_color = "#BAE8B6";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              this.cur_divider_color = "#DDF3F5";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              this.cur_divider_color = "#FFF0D5";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#E75033";
              this.cur_divider_color = "#fff1c2b9"
              break;
          }
        }
      })


      Row(){//单行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)

            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("100%")
          .align(Alignment.Start)
        }
        .width("85%")
      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_single_message)
      .visibility(this.single_line_Visible)
      .onAppear(() => {
        if(this.single_line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#FF2023";
              break;
          }
        }
      })

    }
    .height(this.height_message)
    .onAppear(() => {
      if(this.isSingleLine == true){
        this.single_line_Visible = Visibility.Visible;
        this.multi_Line_Visible = Visibility.Hidden;
        this.height_message = this.height_single_message;
      }
      else {
        this.single_line_Visible = Visibility.Hidden;
        this.multi_Line_Visible = Visibility.Visible;
        this.height_message = this.height_multi_message;
      }
    })
  }
}

/**
 * 感情色彩+图标+反色主题
 */
@Component
export struct Alert_emotion_icon_inverse{
  cur_emotion: string = "";
  //感情色彩: (默认为灰色)
  // 默认 -- 灰色     primary -- 蓝色   success -- 绿色
  // info -- 青色    warning -- 橙色   danger -- 红色
  cur_iconUrl: string = "";//Alert图标url
  icon_size: number = 30;//Alert图标大小
  cur_title: string = "";//Alert的标题文本
  cur_detail: string = "";//Alert的详细说明文本
  isSingleLine: boolean = false;//是否单行显示

  height_single_message: number = 50;
  height_multi_message: number = 100;

  @State cur_bg_color: string = "#000000";//Alert背景颜色
  @State cur_text_color: string = "#FFFFFF";//Alert文本颜色
  @State cur_divider_color: string = "#5F5F5F";//标题与详细说明之间的分隔线的颜色

  @State single_line_Visible: Visibility = Visibility.Hidden;
  @State multi_Line_Visible: Visibility = Visibility.Visible;

  @State height_message: number = 100;//Alert高度

  build(){
    Stack({alignContent: Alignment.Center}){
      Row(){//两行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)

          Rect()
            .height("2%")
            .fill(this.cur_divider_color)
            .width("98%")

          Row(){
            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)
        }
        .width("85%")

      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_multi_message)
      .visibility(this.multi_Line_Visible)
      .onAppear(() => {
        if(this.multi_Line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#000000";
              this.cur_divider_color = "#5F5F5F";
              break;
            case "primary":
              this.cur_bg_color = "#3280FC";
              this.cur_divider_color = "#5C97F4";
              break;
            case "success":
              this.cur_bg_color = "#38B03F";
              this.cur_divider_color = "#61BB66";
              break;
            case "info":
              this.cur_bg_color = "#03B8CF";
              this.cur_divider_color = "#03B8CF";
              break;
            case "warning":
              this.cur_bg_color = "#F1A325";
              this.cur_divider_color = "#F1A325";
              break;
            case "danger":
              this.cur_bg_color = "#EA644A";
              this.cur_divider_color = "#fff1c2b9";
              break;
          }
          console.log("========" + this.cur_emotion + " ==== " + this.cur_bg_color + " ===== " + this.cur_divider_color);
        }
      })


      Row(){//单行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)

            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("100%")
          .align(Alignment.Start)
        }
        .width("85%")
      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_single_message)
      .visibility(this.single_line_Visible)
      .onAppear(() => {
        if(this.single_line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#000000";
              break;
            case "primary":
              this.cur_bg_color = "#3280FC";
              break;
            case "success":
              this.cur_bg_color = "#38B03F";
              break;
            case "info":
              this.cur_bg_color = "#03B8CF";
              break;
            case "warning":
              this.cur_bg_color = "#F1A325";
              break;
            case "danger":
              this.cur_bg_color = "#EA644A";
              break;
          }
          console.log("========" + this.cur_emotion + " ==== " + this.cur_bg_color + " ===== " + this.cur_divider_color);
        }
      })

    }
    .height(this.height_message)
    .onAppear(() => {
      if(this.isSingleLine == true){
        this.single_line_Visible = Visibility.Visible;
        this.multi_Line_Visible = Visibility.Hidden;
        this.height_message = this.height_single_message;
      }
      else {
        this.single_line_Visible = Visibility.Hidden;
        this.multi_Line_Visible = Visibility.Visible;
        this.height_message = this.height_multi_message;
      }
    })
  }
}

/**
 * 块级消息(没有外边距和圆角)
 */
@Component
export struct Alert_emotion_icon_block{
  cur_emotion: string = "";
  //感情色彩: (默认为灰色)
  // 默认 -- 灰色     primary -- 蓝色   success -- 绿色
  // info -- 青色    warning -- 橙色   danger -- 红色
  cur_iconUrl: string = "";//Alert图标url
  icon_size: number = 30;//Alert图标大小
  cur_title: string = "";//Alert的标题文本
  cur_detail: string = "";//Alert的详细说明文本
  isSingleLine: boolean = false;//是否单行显示

  height_single_message: number = 50;
  height_multi_message: number = 100;

  @State cur_bg_color: string = "#F1F1F1";//Alert背景颜色
  @State cur_text_color: string = "#000000";//Alert文本颜色
  @State cur_divider_color: string = "#E4E4E4";//标题与详细说明之间的分隔线的颜色

  @State single_line_Visible: Visibility = Visibility.Hidden;
  @State multi_Line_Visible: Visibility = Visibility.Visible;

  @State height_message: number = 100;//Alert高度

  build(){
    Stack({alignContent: Alignment.Center}){
      Row(){//两行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)

          Rect()
            .height("2%")
            .fill(this.cur_divider_color)
            .width("98%")

          Row(){
            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("49%")
          .align(Alignment.Start)
        }
        .width("85%")

      }
      .backgroundColor(""+this.cur_bg_color)
      .width("100%")
      .height(this.height_multi_message)
      .visibility(this.multi_Line_Visible)
      .onAppear(() => {
        if(this.multi_Line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#E4E4E4";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              this.cur_divider_color = "#D0E0F1";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              this.cur_divider_color = "#BAE8B6";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              this.cur_divider_color = "#DDF3F5";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              this.cur_divider_color = "#FFF0D5";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#E75033";
              this.cur_divider_color = "#fff1c2b9"
              break;
          }
        }
      })


      Row(){//单行显示
        Column(){
          Image($rawfile(this.cur_iconUrl))
            .width(this.icon_size)
            .height(this.icon_size)
        }
        .width("15%")

        Column(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)

            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("100%")
          .align(Alignment.Start)
        }
        .width("85%")
      }
      .backgroundColor(""+this.cur_bg_color)
      .width("100%")
      .height(this.height_single_message)
      .visibility(this.single_line_Visible)
      .onAppear(() => {
        if(this.single_line_Visible == Visibility.Visible){
          switch (this.cur_emotion){
            case "":
              this.cur_bg_color = "#F1F1F1";
              this.cur_text_color = "#000000";
              break;
            case "primary":
              this.cur_bg_color = "#EBF2F9";
              this.cur_text_color = "#000000";
              break;
            case "success":
              this.cur_bg_color = "#DDF4DF";
              this.cur_text_color = "#329D38";
              break;
            case "info":
              this.cur_bg_color = "#DDF3F5";
              this.cur_text_color = "#03A2B6";
              break;
            case "warning":
              this.cur_bg_color = "#FFF0D5";
              this.cur_text_color = "#ED980F";
              break;
            case "danger":
              this.cur_bg_color = "#FFE5E0";
              this.cur_text_color = "#FF2023";
              break;
          }
        }
      })

    }
    .height(this.height_message)
    .onAppear(() => {
      if(this.isSingleLine == true){
        this.single_line_Visible = Visibility.Visible;
        this.multi_Line_Visible = Visibility.Hidden;
        this.height_message = this.height_single_message;
      }
      else {
        this.single_line_Visible = Visibility.Hidden;
        this.multi_Line_Visible = Visibility.Visible;
        this.height_message = this.height_multi_message;
      }
    })
  }
}

/**
 * 可以关闭的消息框
 */
@Component
export struct Alert_close{
  cur_emotion: string = "";
  //感情色彩: (默认为灰色)
  // 默认 -- 灰色     primary -- 蓝色   success -- 绿色
  // info -- 青色    warning -- 橙色   danger -- 红色
  cur_iconUrl: string = "";//Alert图标url
  icon_size: number = 30;//Alert图标大小
  cur_title: string = "";//Alert的标题文本
  cur_detail: string = "";//Alert的详细说明文本
  cur_tip_text: string = "您可以点击右上角的 X 来关闭这条消息。";//Alert的提示文本

  @State height_message: number = 100;

  @State cur_bg_color: string = "#F1F1F1";//Alert背景颜色
  @State cur_text_color: string = "#000000";//Alert文本颜色

  @State closeBtn_visible: Visibility = Visibility.Visible;



  build(){
    Stack({alignContent: Alignment.Center}){
      Column(){
        Row(){
          Row(){
            Text(this.cur_title)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(900)
              .fontColor(this.cur_text_color)

            Text(this.cur_detail)
              .fontWeight(3)
              .margin({left: 10})
              .fontWeight(400)
              .fontColor(this.cur_text_color)
          }
          .width("100%")
          .height("100%")
          .align(Alignment.Start)
        }
        .height("40%")

        Row(){
          Text(this.cur_tip_text)
            .fontWeight(3)
            .margin({left: 10})
            .fontWeight(500)
            .fontColor(this.cur_text_color)
        }
        .height("40%")
        .width("100%")
      }
      .backgroundColor(""+this.cur_bg_color)
      .borderRadius(10)
      .width("98%")
      .height(this.height_message)
      .onAppear(() => {
        switch (this.cur_emotion){
          case "":
            this.cur_bg_color = "#F1F1F1";
            this.cur_text_color = "#000000";
            break;
          case "primary":
            this.cur_bg_color = "#EBF2F9";
            this.cur_text_color = "#000000";
            break;
          case "success":
            this.cur_bg_color = "#DDF4DF";
            this.cur_text_color = "#329D38";
            break;
          case "info":
            this.cur_bg_color = "#DDF3F5";
            this.cur_text_color = "#03A2B6";
            break;
          case "warning":
            this.cur_bg_color = "#FFF0D5";
            this.cur_text_color = "#ED980F";
            break;
          case "danger":
            this.cur_bg_color = "#FFE5E0";
            this.cur_text_color = "#FF2023";
            break;
        }
      })

      Stack(){
        Text('x')
          .width(20)
          .height(20)
          .fontSize(20)
          .fontColor(this.cur_text_color)
          .backgroundColor(this.cur_bg_color)
          .margin({top: 5, right: 5})
          .onClick(() => {
            this.closeBtn_visible = Visibility.Hidden;
            this.height_message = 0;
          })
      }
      .visibility(this.closeBtn_visible)
      .zIndex(10)
      .width("100%")
      .height(this.height_message)
      .align(Alignment.TopEnd)

    }
  }
}
