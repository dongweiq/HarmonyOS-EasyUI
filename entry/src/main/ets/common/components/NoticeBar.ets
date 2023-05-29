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
import { WindowMode } from '@ohos.UiTest';
import display from '@ohos.display';
/**
 * 基础用法
 */
@Component
export struct NoticeBar_default{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State notice_text: string = "滚动文本滚动文本滚动文本";//滚动文本
  @State notice_textLen: number = 0;//滚动文本长度
  @State roll_number: number = 0;//向左滚动值

  build(){
    Stack(){
      //音量图标
      Row(){
        Image($rawfile("NoticeBar_volume.png"))
          .width("60%")
          .height("50%")
          .margin(10)
      }
      .height("100%")
      .width("10%")
      .backgroundColor("#FFFBE8")
      .zIndex(10)
      .position({x: 0})

      //滚动文本
      Row(){
        Text(this.notice_text)
          .fontColor("#F06A0C")
          .fontSize(15)
          .width(this.notice_textLen * 15)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .align(Alignment.Center)
          .offset({
            x: this.roll_number,
            y: 0
          })
      }
      .margin(5)
      .height("100%")
      .width("84%")
      .position({x: "10%"})
      .onAppear(() => {
        setInterval(() => {
          if(this.roll_number >= -(this.notice_textLen-1) * 15)
            this.roll_number -= 3;
          else
            this.roll_number = this.cur_width * 0.9;
        }, 50);
      })

      //末尾间隙
      Row(){
      }
      .backgroundColor("#FFFBE8")
      .height("100%")
      .width("6%")
      .margin(5)
      .zIndex(2)
      .position({x: "94%"})
    }
    .height(this.cur_height)
    .width(this.cur_width)
    .backgroundColor("#FFFBE8")
    .onAppear(() => {
      this.notice_textLen = this.notice_text.length;
      console.log("======" + this.notice_textLen)
    })
  }
}


/**
 * 通告栏模式
 */
@Component
export struct NoticeBar_bar{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State notice_text: string = "滚动文本滚动文本滚动文本滚动文本滚动文本滚动文本";//滚动文本
  @State notice_textLen: number = 0;//滚动文本长度
  @State roll_number: number = 0;//向左滚动值
  @State iconURL: string = "NoticeBar_close.png";//图标url

  build(){
    Stack(){
      //开头间隙
      Row(){
      }
      .backgroundColor("#FFFBE8")
      .height("100%")
      .width("6%")
      .margin(5)
      .zIndex(10)
      .position({x: "0%"})

      //滚动文本
      Row(){
        Text(this.notice_text)
          .fontColor("#F06A0C")
          .fontSize(15)
          .width(this.notice_textLen * 15)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .align(Alignment.Center)
          .offset({
            x: this.roll_number,
            y: 0
          })
      }
      .margin(5)
      .height("100%")
      .width("84%")
      .position({x: "6%"})
      .onAppear(() => {
        setInterval(() => {
          if(this.roll_number >= -(this.notice_textLen-1) * 15)
            this.roll_number -= 3;
          else
            this.roll_number = this.cur_width * 0.85;
        }, 50);
      })

      //图标
      Row(){
        Image($rawfile(this.iconURL))
          .width("50%")
          .height("30%")
          .align(Alignment.Center)
      }
      .height("100%")
      .width("10%")
      .margin({left:10})
      .backgroundColor("#FFFBE8")
      .zIndex(10)
      .position({x: "90%"})
      .onClick(() => {
        if(this.iconURL == "NoticeBar_close.png"){
            this.cur_height = 0;
        }
      })
    }
    .height(this.cur_height)
    .width(this.cur_width)
    .backgroundColor("#FFFBE8")
    .onAppear(() => {
      this.notice_textLen = this.notice_text.length;
      console.log("======" + this.notice_textLen)
    })
  }
}

/**
 * 禁用模式
 */
@Component
export struct NoticeBar_disabled{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State notice_text: string = "滚动文本滚动文本滚动文本滚动文本滚动文本滚动文本";//滚动文本
  @State notice_textLen: number = 0;//滚动文本长度

  build(){
    Stack(){
      //开头间隙
      Row(){
      }
      .backgroundColor("#FFFBE8")
      .height("100%")
      .width("6%")
      .margin(5)
      .zIndex(10)
      .position({x: "0%"})

      //滚动文本
      Row(){
        Text(this.notice_text)
          .fontColor("#F06A0C")
          .fontSize(15)
          .maxLines(1)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .align(Alignment.Center)
      }
      .margin(5)
      .height("100%")
      .width("84%")
      .position({x: "6%"})

      //图标
      Row(){

      }
      .height("100%")
      .width("10%")
      .backgroundColor("#FFFBE8")
      .zIndex(10)
      .position({x: "90%"})
    }
    .height(this.cur_height)
    .width(this.cur_width)
    .backgroundColor("#FFFBE8")
    .onAppear(() => {
      this.notice_textLen = this.notice_text.length;
      console.log("======" + this.notice_textLen)
    })
  }
}

/**
 * 文本换行
 */
@Component
export struct NoticeBar_nextLine{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State notice_text: string = "滚动文本滚动文本滚动文本滚动文本滚动文本滚动文本";//滚动文本
  @State notice_textLen: number = 0;//滚动文本长度
  @State textLine: number = 1;//滚动文本行数

  build(){
    Stack(){
      //开头间隙
      Row(){
      }
      .backgroundColor("#FFFBE8")
      .height("100%")
      .width("6%")
      .margin(5)
      .zIndex(10)
      .position({x: "0%"})

      //滚动文本
      Row(){
        Text(this.notice_text)
          .fontColor("#F06A0C")
          .fontSize(15)
          .maxLines( this.textLine )
          .textOverflow({overflow: TextOverflow.None})
          .align(Alignment.Center)
          .onAppear(() => {
            this.textLine = Math.ceil((15 * this.notice_textLen) / (this.cur_width * 0.9));
            this.cur_height = this.textLine * this.cur_height * 0.5;
            console.log("===== ooo ==== " + this.textLine + "----" + this.cur_height);
          })
      }
      .margin(5)
      .height("100%")
      .width("90%")
      .position({x: "6%"})

      //图标
      Row(){

      }
      .height("100%")
      .width("4%")
      .backgroundColor("#FFFBE8")
      .zIndex(10)
      .position({x: "96%"})
    }
    .height(this.cur_height)
    .width(this.cur_width)
    .backgroundColor("#FFFBE8")
    .onAppear(() => {
      this.notice_textLen = this.notice_text.length;
      console.log("======" + this.notice_textLen)
    })
  }
}



