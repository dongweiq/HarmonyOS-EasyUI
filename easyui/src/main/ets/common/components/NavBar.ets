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


@Component
export struct NavBar {
  private title: string = "标题"          //标题
  private leftText: string = "返回"       //左边按钮文本
  private rightText: string = "按钮"      //右边按钮文本
  private hasLeftArrow: boolean = true   //是否有左箭头
  leftClickEvent: () => void             //左边按钮点击事件
  rightClickEvent: () => void            //右边按钮点击事件
  private rightIcon:string = ""          //右边图标

  @State leftClickBgColor:string = "#ffffffff"  //左边文本点击后背景颜色改变
  @State rightClickBgColor:string = "#ffffffff"  //右边文本点击后背景颜色改变
  @Link leftClicked:boolean
  @Link rightClicked:boolean

  build() {
    Row() {
      Column() {
        Row() {
          if (this.hasLeftArrow) {
            Column() {
              Image($rawfile("NavBar_leftArrow.png"))
                .width(20)
                .height(20)
                .alignSelf(ItemAlign.End)
            }.layoutWeight(1)
          }
          Column() {
            Text(this.leftText)
              .fontColor("#ff2c93fa")
              .alignSelf(ItemAlign.Start)
          }.layoutWeight(1)
        }.height("100%")
      }.layoutWeight(1)
      .height("100%")
      .backgroundColor(this.leftClickBgColor)
      .onClick(()=>{
        this.leftClicked = !this.leftClicked  //左边触发点击，传回父页面
        this.leftClickEvent()
        this.leftClickBgColor = "#ffc3c3c3"
        setTimeout(()=>{
          this.leftClickBgColor = "#ffffffff"
        },100)
      })
      .animation({duration:100})

      Column() {
        Text(this.title)
          .fontSize(18)
          .height("100%")
      }.layoutWeight(4)
      .height("100%")

      Column() {
        Stack(){
          Text(this.rightText)
            .height("100%")
            .fontColor("#ff2c93fa")
            .onClick(()=>{
              this.rightClicked = !this.rightClicked   //右边触发点击，传回父页面
              this.rightClickEvent()
              this.rightClickBgColor = "#ffc3c3c3"
              setTimeout(()=>{
                this.rightClickBgColor = "#ffffffff"
              },100)
            })
          if(this.rightIcon!==""){
            Column(){
              Row(){
                Image($rawfile(this.rightIcon))
                  .height(25)
                  .width(25)
              }.height("100%")
            }.width("100%")
            .backgroundColor("#ffffffff")
          }
        }
      }.layoutWeight(1)
      .height("100%")
      .backgroundColor(this.rightClickBgColor)
      .animation({duration:100})
    }.height(60)
    .width("100%")
    .backgroundColor("#ffffffff")
  }
}