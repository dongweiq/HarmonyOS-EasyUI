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


import { Alert_emotion, Alert_emotion_icon_block } from "@isrc/easyui"
import { Alert_emotion_icon } from "@isrc/easyui"
import { Alert_emotion_icon_inverse } from "@isrc/easyui"
import { Alert_close } from "@isrc/easyui"

@Entry
@Component
struct TestAlert{
  build(){
    Scroll(){
      Column({space: 10}){
        Text("(1)感情色彩")
          .fontSize(20)
          .height("50")
        Column(){
          Alert_emotion({cur_emotion: "", cur_title: "你好", cur_detail: "有一些内容你可能需要知道。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion({cur_emotion: "primary", cur_title: "Hello", cur_detail: "World.", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion({cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion({cur_emotion: "info", cur_title: "Hi!", cur_detail: "这条消息可能需要你注意。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion({cur_emotion: "warning", cur_title: "注意!", cur_detail: "看起来遇到一些问题。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion({cur_emotion: "danger", cur_title: "不好了!", cur_detail: "确实遇到了问题，请立即处理吧。", isSingleLine: false})
        }
        .width("100%")


        Text("(2)感情色彩+图标")
          .fontSize(20)
          .height("50")
        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_inbox.png", cur_emotion: "", cur_title: "你好", cur_detail: "有一些内容你可能需要知道。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_ok.png", cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_star.png", cur_emotion: "primary", cur_title: "Hello", cur_detail: "World.", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_info.png", cur_emotion: "info", cur_title: "Hi!", cur_detail: "这条消息可能需要你注意。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_warning.png", cur_emotion: "warning", cur_title: "注意！", cur_detail: "看起来遇到一些问题。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon({cur_iconUrl: "Alert_danger.png", cur_emotion: "danger", cur_title: "不好了!", cur_detail: "确实遇到了问题，请立即处理吧。", isSingleLine: false})
        }
        .width("100%")


        Text("(3)感情色彩+图标+反色主题")
          .fontSize(20)
          .height("50")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_inbox2.png", cur_emotion: "", cur_title: "你好", cur_detail: "有一些内容你可能需要知道。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_ok2.png", cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_star2.png", cur_emotion: "primary", cur_title: "Hello", cur_detail: "World.", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_info2.png", cur_emotion: "info", cur_title: "Hi!", cur_detail: "这条消息可能需要你注意。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_warning2.png", cur_emotion: "warning", cur_title: "注意！", cur_detail: "看起来遇到一些问题。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_inverse({cur_iconUrl: "Alert_danger2.png", cur_emotion: "danger", cur_title: "不好了!", cur_detail: "确实遇到了问题，请立即处理吧。", isSingleLine: false})
        }
        .width("100%")


        Text("(4)块级消息")
          .fontSize(20)
          .height("50")

        Column(){
          Alert_emotion_icon_block({cur_iconUrl: "Alert_ok2.png", cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。", isSingleLine: false})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_block({cur_iconUrl: "Alert_ok2.png", cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。", isSingleLine: true})
        }
        .width("100%")

        Column(){
          Alert_emotion_icon_block({cur_iconUrl: "Alert_danger2.png", cur_emotion: "danger", cur_title: "不好了!", cur_detail: "确实遇到了问题，请立即处理吧。", isSingleLine: false})
        }
        .width("100%")
        Column(){
          Alert_emotion_icon_block({cur_iconUrl: "Alert_danger2.png", cur_emotion: "danger", cur_title: "不好了!", cur_detail: "确实遇到了问题，请立即处理吧。", isSingleLine: true})
        }
        .width("100%")

        Text("(5)可关闭的消息框")
          .fontSize(20)
          .height("50")

        Column(){
          Alert_close({cur_iconUrl: "Alert_ok2.png", cur_emotion: "success", cur_title: "太好了!", cur_detail: "一切已准备就绪。"})
        }
        .width("100%")

        Column(){
          Alert_close({cur_iconUrl: "Alert_warning.png", cur_emotion: "warning", cur_title: "注意！", cur_detail: "看起来遇到一些问题。"})
        }
        .width("100%")
      }
    }
    .scrollable(ScrollDirection.Vertical) // 设置竖直滚动
    .scrollBarColor(Color.Gray)          // 设置滚动条颜色
    .scrollBarWidth(5)                   // 设置滚动条宽度
    .scrollBar(BarState.Auto)            // 设置滚动条永久显示
    .height("100%")
    .align(Alignment.Top)
  }
}