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


import { Slider_basic,Slider_range,Slider_disable ,Slider_button} from 'easyui'
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct TestSlider {
  @State@Watch("selectValueChange_1") selectValue_1:number = 50
  @State@Watch("selectValueChange_2") selectValue_2:number = 50
  @State@Watch("selectValueChange_3") selectValue_3:number = 50
  @State@Watch("selectValueChange_4") selectValue_4:number = 50
  @State@Watch("selectValueChange_5") selectValue_5:number = 50
  @State selectValue_6:number = 50
  @State@Watch("selectValueChange_7") selectValue_7:number = 50

  selectValueChange_1(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_1.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }
    selectValueChange_2(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_2.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }
    selectValueChange_3(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_3.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }
    selectValueChange_4(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_4.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }
    selectValueChange_5(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_5.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }
  selectValueChange_7(){
    promptAction.showToast({
      message: `当前值：${this.selectValue_7.toFixed()}`,
      duration: 2000,
      bottom:440
    });
  }

  build() {
    Stack() {
      Column() {
        Text("基本用法")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_basic({
          selectValue: $selectValue_1 //设置初始值
        })
          .margin({ bottom: 10 })
          .margin({ bottom: 10 })
        Text("指定步长")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_basic({
          selectValue: $selectValue_4, //设置初始值
          step: 10
        })
          .margin({ bottom: 10 })
        Text("自定义样式")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_basic({
          selectValue: $selectValue_5, //设置初始值
          trackColor: "#ffff0000"
        })

        Text("自定义按钮")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_button({
          selectValue:$selectValue_6
        })
        Text("指定选择范围")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_range({
          minRange: 10, //范围最小值
          maxRange: 90, //范围最大值
          selectValue:$selectValue_2
        })
          .margin({ bottom: 10 })
        Text("禁用")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })
        Slider_disable({
          selectValue:$selectValue_3
        })

          .margin({ bottom: 10 })
        Text("垂直方向")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 10, top: 10 })

        Slider_basic({
          selectValue: $selectValue_7, //设置初始值
          sliderDirection: Axis.Vertical, //设置初始值
        })
          .height(290)
      }
      .backgroundColor("#ffececec")
    }
  }
}
