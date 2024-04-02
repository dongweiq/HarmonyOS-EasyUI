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


import {MaskGuideView} from "@isrc/easyui"
import router from '@ohos.router'
@Entry
@Component
struct TestMaskGuideView {
  private url:string = "pages/TestCardView"
  build() {
    Column() {
      MaskGuideView({ //使用蒙版
        tipMessage: "第一步：点击此按钮，即可跳转到页面1中", //设置引导提示语
        selectAreaPositionX: 30, //设置高亮区域的x坐标
        selectAreaPositionY: 20, //设置高亮区域的y坐标
        selectAreaWidth: 80, //设置高亮区域宽度
        selectAreaHeight: 40, //设置高亮区域高度
        screenWidth:480,
        screenHeight:760
      })
      Button("页面1") //演示蒙版使用
        .width(80)
        .height(40)
        .position({
          x: 30,
          y: 20
        })
        .onClick(()=>{
          router.pushUrl({
            url:this.url
          })
        })
    }
  }
}