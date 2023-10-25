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


/**
 * Popup基础用法
 */
@Component
export struct Popup_default{
  // @Link default_visibility: Visibility;
  @Link comp_w: string;
  build(){
    Column(){
      Stack(){
        Text()
          .height("140%")
          .width("100%")
          .backgroundColor(Color.Black)
          .opacity(0.6)
          .position({x:0, y: "-40%"})
          .onClick(() => {
            // this.default_visibility = Visibility.Hidden;
            this.comp_w = "0%";
          })

        Text("内容")
          .height("10%")
          .width("40%")
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.White)
          .position({x: "30%", y: "0%"})

      }
      .height("100%")
      .width("100%")
    }
    .width(this.comp_w)
    .height("100%")
    // .animation({duration: 2000})
    // .visibility(this.default_visibility)
  }
}



/**
 * Popup弹出位置：下方
 */
@Component
export struct Popup_bottom{
  @Link bottom_visibility: Visibility;
  @State cities: string[] = ["杭州", "宁波", "温州", "嘉兴", "湖州"];
  build(){
    Column(){
      Stack(){
        Text()
          .height("100%")
          .width("100%")
          .backgroundColor(Color.Black)
          .opacity(0.6)
          .onClick(() => {
            this.bottom_visibility = Visibility.Hidden;
          })

        Stack(){
          Text()
            .width("100%")
            .height("40%")
            .backgroundColor(Color.White)

          Column(){
            Row(){
              Text("取消")
                .width("100")
                .height("50")
                .fontSize(20)
                .fontColor(Color.Blue)
                .layoutWeight(2)
                .margin({left: 20})
                .onClick(() => {
                  this.bottom_visibility = Visibility.Hidden;
                })

              Text()
                .height("50")
                .layoutWeight(10)

              Text("确认")
                .width("100")
                .height("50")
                .fontColor(Color.Blue)
                .fontSize(20)
                .layoutWeight(2)
                .onClick(() => {
                  this.bottom_visibility = Visibility.Hidden;
                })
            }
            .width("100%")

            TextPicker({range: this.cities, selected: 0})
          }
        }
        .position({y: "60%"})
      }
      .height("100%")
      .width("100%")
    }
    .height("100%")
    .width("100%")
    .position({x: 0, y:0})
    .onAppear(() => {
      console.log(this.cities + "")
    })
    .visibility(this.bottom_visibility)
  }
}

/**
 * Popup弹出位置：上方
 */
@Component
export struct Popup_top{
  @Link top_visibility: Visibility;
  build(){
    Column(){
      Stack(){
        Text()
          .height("140%")
          .width("100%")
          .backgroundColor(Color.Black)
          .opacity(0.7)
          .position({x:0, y: "-40%"})
          .onClick(() => {
            this.top_visibility = Visibility.Hidden;
          })

        Text("内容")
          .height("60%")
          .width("40%")
          .fontSize(30)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .position({x: "-10%", y: "15%"})


      }
      .height("100%")
      .width("100%")
    }
    .height("12%")
    .width("100%")
    .position({x: 0})
    .visibility(this.top_visibility)
  }
}

/**
 * Popup弹出位置：右方
 */
@Component
export struct Popup_right{
  @Link right_visibility: Visibility;
  @State right_visibility_1: Visibility = Visibility.Hidden;
  build(){
    Column(){
      Stack(){
        Text()
          .height("140%")
          .width("100%")
          .backgroundColor(Color.White)
          .position({x:0, y: "-40%"})

        Row(){
          Button("关闭弹层")
            .type(ButtonType.Normal)
            .height("60%")
            .width("30%")
            .margin({left: "10%"})
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.right_visibility = Visibility.Hidden;
            })

          Button("右侧弹出")
            .type(ButtonType.Normal)
            .height("60%")
            .width("30%")
            .margin({left: "10%"})
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.right_visibility_1 = Visibility.Visible;
            })
        }
        .width("100%")
        .height("20%")
        .position({x: 0, y: 0})



        Column(){
          Text()
            .height("140%")
            .width("100%")
            .backgroundColor(Color.White)
            .position({x:0, y: "-40%"})


          Button("关闭弹层")
            .type(ButtonType.Normal)
            .height("10%")
            .width("30%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .position({x:"10%", y: "6%"})
            .onClick(() => {
              this.right_visibility_1 = Visibility.Hidden;
            })
        }
        .height("100%")
        .width("100%")
        .visibility(this.right_visibility_1)

      }
      .height("100%")
      .width("100%")
    }
    .height("100%")
    .width("100%")
    .position({x: 0})
    .visibility(this.right_visibility)
  }
}