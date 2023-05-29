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
/**
 * 折叠组件
 */
@Component
export struct Collapse {
  private isCollapse:boolean = true;
  @State collapseBorderHeight:number = 0;

  build(){
    Column(){
        Row() {
          Button("显示折叠内容")
            .type(ButtonType.Normal)
            .borderRadius(5)
            .backgroundColor("#ffe5e5e5")
            .fontColor(Color.Black)
            .onClick(()=>{
              this.isCollapse = !this.isCollapse
              if(this.isCollapse){
                this.collapseBorderHeight = 0
              }else{
                this.collapseBorderHeight = 80
              }
            })
          Button("显示折叠内容")
            .backgroundColor("#ffffffff")
            .borderRadius(5)
            .type(ButtonType.Normal)
            .fontColor("#ff145ccd")
            .margin({ left: 5 })
            .onClick(()=>{
              this.isCollapse = !this.isCollapse
              if(this.isCollapse){
                this.collapseBorderHeight = 0
              }else{
                this.collapseBorderHeight = 80
              }
            })
        }
        .alignSelf(ItemAlign.Start)
        .margin({bottom:5})
      Column(){
        Text("被折叠元素内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
        Text("多个触发元素可以指向同一个折叠内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
      }
      .width("100%")
      .height(this.collapseBorderHeight)
      .backgroundColor("#ff0080ff")
      .animation({
        duration:200
      })
      .alignItems(HorizontalAlign.Start)

    }
    // .borderWidth(1)
    .margin(10)
  }
}

/**
 * 折叠分组
 */
@Component
export struct Collapse_group{
  @State isCollapse_1:boolean = true;
  @State isCollapse_2:boolean = true;
  @State isCollapse_3:boolean = true;
  @State collapseBorderHeight_1:number = 0;
  @State collapseBorderHeight_2:number = 0;
  @State collapseBorderHeight_3:number = 0;

  build(){
    Column(){
        Button("折叠1")
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(Color.White)
          .fontColor("#ff145ccd")
          .onClick(()=>{
            this.isCollapse_1 = !this.isCollapse_1
            if(this.isCollapse_1){
              this.collapseBorderHeight_1 = 0
            }else{
              this.collapseBorderHeight_1 = 80
              this.isCollapse_2 = true
              this.isCollapse_3 = true
              this.collapseBorderHeight_2 = 0
              this.collapseBorderHeight_3 = 0
            }
          })
        Column(){
          Text("被折叠元素内容。")
            .fontColor(Color.White)
            .fontSize(14)
            .margin({top:10,bottom:5,left:10})
          Text("多个触发元素可以指向同一个折叠内容。")
            .fontColor(Color.White)
            .fontSize(14)
            .margin({top:10,bottom:5,left:10})
        }
        .width("100%")
        .height(this.collapseBorderHeight_1)
        .backgroundColor("#ff0080ff")
        .animation({
          duration:200
        })
        .alignItems(HorizontalAlign.Start)


      Button("折叠2")
        .type(ButtonType.Normal)
        .borderRadius(5)
        .backgroundColor(Color.White)
        .fontColor("#ff145ccd")
        .onClick(()=>{
          this.isCollapse_2 = !this.isCollapse_2
          if(this.isCollapse_2){
            this.collapseBorderHeight_2 = 0
          }else{
            this.collapseBorderHeight_2 = 80
            this.isCollapse_1 = true
            this.isCollapse_3 = true
            this.collapseBorderHeight_1 = 0
            this.collapseBorderHeight_3 = 0
          }
        })
      Column(){
        Text("被折叠元素内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
        Text("多个触发元素可以指向同一个折叠内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
      }
      .width("100%")
      .height(this.collapseBorderHeight_2)
      .backgroundColor("#ff38b03f")
      .animation({
        duration:200
      })
      .alignItems(HorizontalAlign.Start)

      Button("折叠3")
        .type(ButtonType.Normal)
        .borderRadius(5)
        .backgroundColor(Color.White)
        .fontColor("#ff145ccd")
        .onClick(()=>{
          this.isCollapse_3 = !this.isCollapse_3
          if(this.isCollapse_3){
            this.collapseBorderHeight_3 = 0
          }else{
            this.collapseBorderHeight_3 = 80
            this.isCollapse_1 = true
            this.isCollapse_2 = true
            this.collapseBorderHeight_1 = 0
            this.collapseBorderHeight_2 = 0
          }
        })
      Column(){
        Text("被折叠元素内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
        Text("多个触发元素可以指向同一个折叠内容。")
          .fontColor(Color.White)
          .fontSize(14)
          .margin({top:10,bottom:5,left:10})
      }
      .width("100%")
      .height(this.collapseBorderHeight_3)
      .backgroundColor("#ffea644a")
      .animation({
        duration:200
      })
      .alignItems(HorizontalAlign.Start)
    }
    // .borderWidth(1)
    .alignItems(HorizontalAlign.Start)
    .margin(10)
  }
}

/**
 * 结合面板组使用
 */
@Component
export struct Collapse_panel {
  @State isCollapse_1: boolean = true;
  @State isCollapse_2: boolean = true;
  @State isCollapse_3: boolean = true;
  @State collapseBorderHeight_1: number = 0;
  @State collapseBorderHeight_2: number = 0;
  @State collapseBorderHeight_3: number = 0;

  build() {
    Column() {

      Column() {
        Text("折叠面板1")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .padding({ left: 10, top: 5, bottom: 5 })
          .backgroundColor("#ffeae8e8")

          .onClick(() => {
            this.isCollapse_1 = !this.isCollapse_1
            if (this.isCollapse_1) {
              this.collapseBorderHeight_1 = 0
            } else {
              this.collapseBorderHeight_1 = 60
              this.isCollapse_2 = true
              this.isCollapse_3 = true
              this.collapseBorderHeight_2 = 0
              this.collapseBorderHeight_3 = 0
            }
          })
        Column() {
          Text("被折叠元素内容1。")
            .fontSize(14)
            .margin({ top: 10, bottom: 5, left: 10 })
            .alignSelf(ItemAlign.Start)
        }
        .width("100%")
        .height(this.collapseBorderHeight_1)
        .backgroundColor("#ffffffff")
        .animation({
          duration: 200
        })
      }
      .shadow({
        radius: 5,
        color: "#ff000000",
        offsetX:-5,
        offsetY:5
      })
      .borderWidth(1)
      .borderRadius(5)
      .margin({bottom:10})


      Column() {
        Text("折叠面板2")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .padding({ left: 10, top: 5, bottom: 5 })
          .backgroundColor("#ffeae8e8")

          .onClick(() => {
            this.isCollapse_2 = !this.isCollapse_2
            if (this.isCollapse_2) {
              this.collapseBorderHeight_2 = 0
            } else {
              this.collapseBorderHeight_2= 60
              this.isCollapse_1 = true
              this.isCollapse_3 = true
              this.collapseBorderHeight_1 = 0
              this.collapseBorderHeight_3 = 0
            }
          })
        Column() {
          Text("被折叠元素内容2。")
            .fontSize(14)
            .margin({ top: 10, bottom: 5, left: 10 })
            .alignSelf(ItemAlign.Start)
        }
        .width("100%")
        .height(this.collapseBorderHeight_2)
        .backgroundColor("#ffffffff")
        .animation({
          duration: 200
        })
      }
      .shadow({
        radius: 5,
        color:"#ff000000",
        offsetX:-5,
        offsetY:5
      })
      .borderWidth(1)
      .borderRadius(5)
      .margin({bottom:10})

      Column() {
        Text("折叠面板3")
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .padding({ left: 10, top: 5, bottom: 5 })
          .backgroundColor("#ffeae8e8")

          .onClick(() => {
            this.isCollapse_3 = !this.isCollapse_3
            if (this.isCollapse_3) {
              this.collapseBorderHeight_3 = 0
            } else {
              this.collapseBorderHeight_3= 60
              this.isCollapse_1 = true
              this.isCollapse_2 = true
              this.collapseBorderHeight_1 = 0
              this.collapseBorderHeight_2 = 0
            }
          })
        Column() {
          Text("被折叠元素内容3。")
            .fontSize(14)
            .margin({ top: 10, bottom: 5, left: 10 })
            .alignSelf(ItemAlign.Start)
        }
        .width("100%")
        .height(this.collapseBorderHeight_3)
        .backgroundColor("#ffffffff")
        .animation({
          duration: 200
        })
      }
      .shadow({
        radius: 5,
        color:"#ff000000",
        offsetX:-5,
        offsetY:5
      })
      .borderWidth(1)
      .borderRadius(5)
      .margin({bottom:10})
    }
    .margin(10)
  }
}