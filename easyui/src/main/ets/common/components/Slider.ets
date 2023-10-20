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


// @Entry
@Component
export struct Slider_basic {
  @Link selectValue: number
  private step:number = 0
  private trackColor:string = "#ff007dff"
  private sliderDirection:Axis = Axis.Horizontal
  build() {
    Column(){
      Row(){
        Slider({
          value:this.selectValue,
          min:0,
          max:100,
          style:SliderStyle.OutSet,
          step:this.step,
          direction:this.sliderDirection
        })
          .blockColor('#ffffffff')
          .trackColor('#ffe3e3e3')
          .selectedColor(this.trackColor)
          .onChange((value: number, mode: SliderChangeMode) => {
            if (mode.toString() == "2") {
              this.selectValue = value
              }
          })
      }
      }
    // .width(360)
  }
}

// @Entry
@Component
export struct Slider_range {
  @Link@Watch("watchSelectValue")  selectValue:number
  @State circlePositionX:number =   0;
  private minRange:number = 10
  private maxRange:number = 90
  @State selectWidth:number = 0

  watchSelectValue(propName: string): void {
    this.circlePositionX = this.selectValue*3.4+10
    this.selectWidth = this.selectValue*3.4
  }

  aboutToAppear(){
    this.selectWidth = this.selectValue*3.3 +10
    this.circlePositionX = this.selectValue*3.3 +10
  }
  build() {
    Column(){
      Stack(){
        Row()
          .height(2)
          .width(340)
          .backgroundColor("#ffd6d6d6")
          .borderRadius(10)
          .position({x:0,y:10})
        Flex(){
          Row()
            .height(2)
            .width(this.selectWidth)
            .backgroundColor("#ff007dff")
            .borderRadius(10)
        }
        Row()
          .width(20)
          .height(20)
          .backgroundColor("#ffffffff")
          .borderRadius(20)
          .shadow({
            radius:5,
            color:Color.Black,
            offsetX:0,
            offsetY:0
          })
          .position({
            x:this.circlePositionX,
            y:0
          })
          .markAnchor({
            x:20
          })
          .onTouch((event:TouchEvent)=>{

            let realWidth
            if(event.touches[0].screenX >= 340- (100-this.maxRange)*3.4){
              realWidth = 340 - (100-this.maxRange)*3.4
              this.selectWidth = 350 - (100-this.maxRange)*3.4
              this.circlePositionX = 350 - (100-this.maxRange)*3.4
            }else if(event.touches[0].screenX <=   + this.minRange*3.4){
              realWidth =  0 + this.minRange*3.4
              this.selectWidth = 0 + this.minRange*3.4
              this.circlePositionX = this.minRange*3.4 +10
            }else {
              realWidth =  event.touches[0].screenX
              this.selectWidth = event.touches[0].screenX
              this.circlePositionX = event.touches[0].screenX
            }

            if(event.type == 1){
              this.selectValue = realWidth/340*100
            }
          })
      }
    }
    .markAnchor({
      x:0,
      y:0
    })
    .margin(10)
  }
}

// @Entry
@Component
export struct Slider_disable {
  @Link @Watch("watchSelectValue") selectValue: number
  @State circlePositionX:number = 0;
  @State selectWidth:number = 0

  // @Watch 回调
  watchSelectValue(propName: string): void {
    this.circlePositionX = this.selectValue*3.4+10
    this.selectWidth = this.selectValue*3.4
  }
  aboutToAppear(){
    this.selectWidth = this.selectValue*3.3
    this.circlePositionX = this.selectValue*3.3 +10
  }
  build() {
    Column(){
      Stack() {
        Row()
          .height(2)
          .width(340)
          .backgroundColor("#ffd6d6d6")
          .borderRadius(10)
          .position({x:0,y:10})
        Flex() {
          Row()
            .height(2)
            .width(this.selectWidth)
            .backgroundColor("#ffb0d3f7")
            .borderRadius(10)
        }
        Row()
          .width(20)
          .height(20)
          .backgroundColor("#ffffffff")
          .borderRadius(20)
          .shadow({
            radius: 5,
            color: Color.Grey,
            offsetX: 0,
            offsetY: 0
          })
          .markAnchor({
            x:20
          })
          .position({
            x: this.circlePositionX,
            y: 0
          })
      }
    }
    .markAnchor({
      x:0,
      y:0
    })
    .margin(10)
  }
}

// @Entry
@Component
export struct Slider_button {
  @Link@Watch("watchSelectValue") selectValue: number
  @State circlePositionX:number = 0;
  private minRange:number = 0
  private maxRange:number = 100

  @State selectWidth:number = 0

  // @Watch 回调
  watchSelectValue(propName: string): void {
    this.circlePositionX = this.selectValue*3.4 +10
    this.selectWidth = this.selectValue*3.4
  }
  aboutToAppear(){
    this.selectWidth = this.selectValue*3.3
    this.circlePositionX = this.selectValue*3.3 +12
  }
  build() {
    Column(){
      Stack(){
        Row()
          .height(2)
          .width(340)
          .backgroundColor("#ffd6d6d6")
          .borderRadius(10)
        .position({x:0,y:10})

        Flex(){
          Row()
            .height(2)
            .width(this.selectWidth)
            .backgroundColor("#ffff0000")
            .borderRadius(10)
        }
        Column(){
          Text(`${this.selectValue.toFixed()}`)
            .textAlign(TextAlign.Center)
            .alignSelf(ItemAlign.Center)
            .fontColor("#ffffffff")
        }

          .width(30)
          .height(20)
          .backgroundColor("#ffff0000")
          .borderRadius(20)
          .shadow({
            radius:5,
            color:Color.Black,
            offsetX:0,
            offsetY:0
          })
          .position({
            x:this.circlePositionX,
            y:0
          })
        .markAnchor({
            x:24
        })
          .onTouch((event:TouchEvent)=>{
            let realWidth
            if(event.touches[0].screenX >= 350- (100-this.maxRange)*3.4){
              realWidth = 340 - (100-this.maxRange)*3.4
              this.selectWidth = 350 - (100-this.maxRange)*3.4
              this.circlePositionX = 350 - (100-this.maxRange)*3.4
            }else if(event.touches[0].screenX < this.minRange*3.4){
              realWidth = this.minRange*3.4
              this.selectWidth = this.minRange*3.4 +10
              this.circlePositionX = this.minRange*3.4+10
            }else {
              realWidth = event.touches[0].screenX
              this.selectWidth = event.touches[0].screenX
              this.circlePositionX = event.touches[0].screenX+10
            }
              this.selectValue = realWidth/340*100 //计算选中的值
            if(this.selectValue <= 2){
              this.selectValue = 0
            }
            if(this.selectValue >=100){
              this.selectValue = 100
            }
          })
      }

    }
    .markAnchor({
      x:0,
      y:0
    })
    .margin(10)
  }
}