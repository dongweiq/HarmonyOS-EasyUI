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
@Component
export struct CircleProgress {
  @Link progressCurrentValue:number         //进度条的当前值
  private progressTotalValue:number = 100   //进度条总共值
  private progressWidth:number = 120        //进度条组件的宽度
  private progressColor:string|Color  = "#ffdd2121"  //进度条颜色
  private progressStrokeWidth:number = 10    //进度条的环形宽度

  build() {
    Stack() {
      Column() {
        Progress({
          value: this.progressCurrentValue,
          total: this.progressTotalValue,
          type: ProgressType.Ring
        })
          .value(this.progressCurrentValue)
          .width(this.progressWidth)
          .color(this.progressColor)
          .style({
            strokeWidth: this.progressStrokeWidth
          })
      }
      Text(((this.progressCurrentValue/this.progressTotalValue*100).toFixed())+"%")
        .fontSize(16*this.progressWidth/120)
    }
  }
}