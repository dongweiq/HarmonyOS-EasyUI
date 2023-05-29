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
import { DatetimePicker_date } from "../common/components/DatetimePicker"

@Entry
@Component
struct TestRate{
  build(){
    Scroll(){
      Column(){
        Column({space: 5}){
          Column(){
            Text("DatetimePicker - 年月日时分")
              .fontSize(20)
              .width("100%")
              .height(30)
              .margin({left: 10})
              .align(Alignment.Start)
            DatetimePicker_date({hasYear: true, hasMonth: true, hasDay: true, hasHour: true, hasMinute: true});

            Text("DatetimePicker - 时分")
              .fontSize(20)
              .width("100%")
              .height(30)
              .margin({left: 10})
              .align(Alignment.Start)
            DatetimePicker_date({hasYear: false, hasMonth: false, hasDay: false, hasHour: true, hasMinute: true});

            Text("DatetimePicker - 年月日")
              .fontSize(20)
              .width("100%")
              .height(30)
              .margin({left: 10})
              .align(Alignment.Start)
            DatetimePicker_date({hasYear: true, hasMonth: true, hasDay: true, hasHour: false, hasMinute: false});

            Text("DatetimePicker - 年月")
              .fontSize(20)
              .width("100%")
              .height(30)
              .margin({left: 10})
              .align(Alignment.Start)
            DatetimePicker_date({hasYear: true, hasMonth: true, hasDay: false, hasHour: false, hasMinute: false});
          }
          .width("100%")
        }

        // Column({space: 5}){
        //   Text("DatetimePicker - 时分")
        //     .fontSize(20)
        //     .width("100%")
        //     .height(30)
        //     .margin({left: 10})
        //     .align(Alignment.Start)
        //   Column(){
        //     DatetimePicker_time();
        //   }
        //   .width("100%")
        // }
        //
        // Column({space: 5}){
        //   Text("DatetimePicker - 年月日时分")
        //     .fontSize(20)
        //     .width("100%")
        //     .height(30)
        //     .margin({left: 10})
        //     .align(Alignment.Start)
        //   Column(){
        //     DatetimePicker_datetime();
        //   }
        //   .width("100%")
        // }
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