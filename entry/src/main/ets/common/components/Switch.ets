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
// @Entry
@Component
export struct Switch {


  private switchOn:boolean = false
  @State circlePosition:number = 0
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 0
  @State bottomBorderOpacity:number = 0
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ff007dff")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill(Color.White)
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)
      .shadow({
        radius:10,
        color:this.shadowColor,
      })
      .onClick(()=>{

        this.switchOn = !this.switchOn
        this.shadowColor = "#ff3280fc"


        if(this.switchOn){
          console.log("开关打开")
          this.borderColorOn = "#ff3280fc"
          this.shadowColor = "#ff3280fc"
          this.circlePosition = 15
          this.bottomBorderWidth = 40
          this.bottomBorderOpacity = 1

        }else{
          console.log("开关关闭")
          this.borderColorOn = "#ffd6d6d6"
          this.shadowColor = "#ffffffff"
          this.circlePosition = 0
          this.bottomBorderWidth = 0
          this.bottomBorderOpacity = 0

        }
      })

      Text("夜间模式")
        .margin({left:5,right:5})
    }
    .margin(10)
    .width("95%")
    .borderWidth(1)
    .borderColor("#ffd6d6d6")
    .padding(20)
  }
}

// @Entry
@Component
export struct Switch_textLeft {

  private switchOn:boolean = false
  @State circlePosition:number = 0
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 0
  @State bottomBorderOpacity:number = 0
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ff007dff")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill(Color.White)
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)
      .shadow({
        radius:10,
        color:this.shadowColor,
      })
      .onClick(()=>{

        this.switchOn = !this.switchOn
        this.shadowColor = "#ff3280fc"
        if(this.switchOn){
          console.log("开关打开")
          this.borderColorOn = "#ff3280fc"
          this.shadowColor = "#ff3280fc"
          this.circlePosition = 15
          this.bottomBorderWidth = 40
          this.bottomBorderOpacity = 1

        }else{
          console.log("开关关闭")
          this.borderColorOn = "#ffd6d6d6"
          this.shadowColor = "#ffffffff"
          this.circlePosition = 0
          this.bottomBorderWidth = 0
          this.bottomBorderOpacity = 0

        }
      })

      Blank().width("65%")
      Text("夜间模式")
        .margin({left:5,right:5})
    }
    .direction(Direction.Rtl)
    .margin(10)
    .width("95%")
    .borderWidth(1)
    .borderColor("#ffd6d6d6")
    .padding(20)
  }
}


@Component
export struct Switch_textRight {

  private switchOn:boolean = false
  @State circlePosition:number = 0
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 0
  @State bottomBorderOpacity:number = 0
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ff007dff")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill(Color.White)
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)
      .shadow({
        radius:10,
        color:this.shadowColor,
      })
      .onClick(()=>{

        this.switchOn = !this.switchOn
        this.shadowColor = "#ff3280fc"
        if(this.switchOn){
          console.log("开关打开")
          this.borderColorOn = "#ff3280fc"
          this.shadowColor = "#ff3280fc"
          this.circlePosition = 15
          this.bottomBorderWidth = 40
          this.bottomBorderOpacity = 1

        }else{
          console.log("开关关闭")
          this.borderColorOn = "#ffd6d6d6"
          this.shadowColor = "#ffffffff"
          this.circlePosition = 0
          this.bottomBorderWidth = 0
          this.bottomBorderOpacity = 0

        }
      })

      Blank().width("65%")
      Text("夜间模式")
        .margin({left:5,right:5})
    }
    .margin(10)
    .width("95%")
    .borderWidth(1)
    .borderColor("#ffd6d6d6")
    .padding(20)
  }
}

@Component
export struct Switch_inline {

  private switchOn:boolean = false
  @State circlePosition:number = 0
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 0
  @State bottomBorderOpacity:number = 0
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ff007dff")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill(Color.White)
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .backgroundColor("#ffffffff")
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)
      .shadow({
        radius:10,
        color:this.shadowColor,
      })
      .onClick(()=>{

        this.switchOn = !this.switchOn
        this.shadowColor = "#ff3280fc"
        if(this.switchOn){
          console.log("开关打开")
          this.borderColorOn = "#ff3280fc"
          this.shadowColor = "#ff3280fc"
          this.circlePosition = 15
          this.bottomBorderWidth = 40
          this.bottomBorderOpacity = 1

        }else{
          console.log("开关关闭")
          this.borderColorOn = "#ffd6d6d6"
          this.shadowColor = "#ffffffff"
          this.circlePosition = 0
          this.bottomBorderWidth = 0
          this.bottomBorderOpacity = 0

        }
      })

      Text("夜间模式")
        .margin({left:5,right:5})
    }
    .backgroundColor("#fffff0d5")
    .margin(10)
    .borderColor("#ffd6d6d6")
    .padding({ top:5,bottom:5 })
  }
}


@Component
export struct Switch_disable_on {

  @State circlePosition:number = 15
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 40
  @State bottomBorderOpacity:number = 1
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ffcccccc")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill("#fff0f0f0")
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)

      Text("夜间模式")
        .margin({left:5,right:5})
        .fontColor("#ffdddddd")
    }
    .margin(10)
    .width("95%")
    .borderWidth(1)
    .borderColor("#ffd6d6d6")
    .padding(20)
  }
}

@Component
export struct Switch_disable_off {

  @State circlePosition:number = 0
  @State shadowColor:string = "#ffffffff"
  @State bottomBorderWidth:number = 40
  @State bottomBorderOpacity:number = 0
  @State borderColorOn:string = "#ffd6d6d6"

  build() {
    Row(){
      Row(){
        Stack() {
          Flex() {
            Flex() {
            }
            .backgroundColor("#ffcccccc")
            .width(this.bottomBorderWidth)
            .height(24)
            .borderRadius(11)
            .opacity(this.bottomBorderOpacity)
            .animation({
              duration: 200,
              curve: Curve.Smooth
            })
          }

          Circle().width(23).height(23)
            .fill("#fff0f0f0")
            .strokeWidth(1)
            .stroke(this.borderColorOn)
            .position({
              x:this.circlePosition,
              y:0
            })
            .animation({
              duration:200,
              curve:Curve.Smooth
            })
        }
      }
      .markAnchor({
        x:0,
        y:0
      })
      .width(40)
      .height(25)
      .borderRadius(15)
      .borderWidth(1)
      .borderColor(this.borderColorOn)

      Text("夜间模式")
        .margin({left:5,right:5})
        .fontColor("#ffdddddd")
    }
    .margin(10)
    .width("95%")
    .borderWidth(1)
    .borderColor("#ffd6d6d6")
    .padding(20)
  }
}
