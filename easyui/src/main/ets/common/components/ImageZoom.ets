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


import { ImageItem } from "./beans/ImageItem"

@Component
export struct ImageZoom{

  @StorageLink("Img") Img: ImageItem = new ImageItem("");

  @State rotateValue: number = 0;
  @State scaleValue: number = 10;

  build(){
    Column(){
      Stack(){
        Row(){
          Image($rawfile(this.Img.name))
            .rotate({
              x: 0,
              y: 0,
              z: 5,
              angle: this.rotateValue,
            })
            .scale({x: this.scaleValue, y: this.scaleValue})


        }
        .width('80%')
        .height('50%')

      }
      .width('100%')
      .height('80%')
      .margin({top: 10})




      Row(){
        Column(){
          Row(){
            Text("旋转角度: " + this.rotateValue + "°")
              .fontSize(25)
              .margin({top: 4})
          }

          Row(){
            Text("-180°")
              .fontSize(15)

            Slider({
              value: this.rotateValue,
              min: -180,
              max: +180,
              step: 10,
              style: SliderStyle.OutSet,
              direction: Axis.Horizontal,
              reverse: false
            })
            .width('75%')
            .height(40)
            .backgroundColor("#ffcbcbcf")
            .blockColor(Color.Red)   // 设置滑块颜色
            .trackColor(Color.Pink)   // 设置滑轨颜色
            .selectedColor(Color.Red) // 设置滑轨的已滑动颜色
            .trackThickness(6)        // 设置滚动条宽度
            .onChange((value: number, mode: SliderChangeMode) => {
              this.rotateValue = value;
              if( (this.rotateValue >= 0 ) && ( this.rotateValue > parseInt(this.rotateValue + "") ) && ( this.rotateValue < parseInt(this.rotateValue + "") + 1 ) ){
                this.rotateValue = parseInt(this.rotateValue + "") +1;
              }
              if( (this.rotateValue < 0 ) && ( this.rotateValue < parseInt(this.rotateValue + "") ) && ( this.rotateValue > parseInt(this.rotateValue + "") - 1 ) ){
                this.rotateValue = parseInt(this.rotateValue + "");
              }
            })

            Text("+180°")
              .fontSize(15)
          }
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height('10%')

      Row(){
        Column(){
          Row(){
            Text("宽高缩放倍数: × " + this.scaleValue )
              .fontSize(25)
              .margin({top: 4})
              .onAppear(() => {
                this.scaleValue = parseFloat(1.0 + "");
              })
          }

          Row(){
            Text("0.1")
              .fontSize(15)
              .margin({right: 5})

            Slider({
              value: 10,
              min: 1,
              max: 20,
              step: 1,
              style: SliderStyle.OutSet,
              direction: Axis.Horizontal,
              reverse: false
            })
              .width('75%')
              .height(40)
              .backgroundColor("#ffcbcbcf")
              .blockColor(Color.Red)   // 设置滑块颜色
              .trackColor(Color.Pink)   // 设置滑轨颜色
              .selectedColor(Color.Red) // 设置滑轨的已滑动颜色
              .trackThickness(6)        // 设置滚动条宽度
              .onChange((value: number, mode: SliderChangeMode) => {
                this.scaleValue = parseFloat((value / 10.0).toFixed(1));
              })

            Text("2.0")
              .fontSize(15)
              .margin(5)
          }
        }
        .width('100%')
        .height('100%')
      }
      .width('100%')
      .height('10%')

    }
    .width('100%')
    .height('95%')

  }
}