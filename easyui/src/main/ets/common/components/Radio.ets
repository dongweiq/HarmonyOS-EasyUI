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
 * 基础用法
 */
@Component
export struct Radio_default{
  @State name: string[] = [];// 保存所有单选框的名称
  @State checked_init: boolean[] = [];// 初始选中状态
  @State radio_groupName: string = "";// 单选框所属的组别
  @State checked_imgName: string[] = [];// 选中/未选中状态下的图标
  name_num: number = 0;//单选框数量

  func_checked(index: number){
    //点击文本选中当前单选框
    for (let i = 0; i < this.name.length; i++) {
      this.checked_imgName[i] = "Radio_no_checked_1.png";
    }
    this.checked_imgName[index] = "Radio_checked_blue_1.png";

    console.log("console ==== " + this.checked_imgName[index]);
  }

  build() {
    Column(){
      ForEach(this.name, (item: any,index: number) => {
        Column(){
          Row(){
            Stack(){
              Image($rawfile(this.checked_imgName[index]))
                .size({width: 42, height: 42})
                .borderRadius(21)
                .offset({
                  x: -2,
                  y: -2
                })
            }
            .width(40)
            .height(40)
            .borderRadius(20)
            .border({width: 1, color: Color.Gray})
            .onClick(() => {
              this.func_checked(index)
            })

            Text(item)
              .margin({left: 10})
              .fontSize(25)
              .onClick(() => {
                this.func_checked(index)
              })
          }
          .width("100%")
          .align(Alignment.Start)
        }
        .margin({top: 20})
        .height(40)
        .width("100%")
      })
    }
    .onAppear(() => {
      this.name_num = this.name.length;
      for (let i = 0; i < this.name.length; i++) {
        if(this.checked_init[i] == true) {
          for (let j = 0; j < this.name.length; j++) {
              this.checked_imgName[j] = "Radio_no_checked_1.png";
          }
          this.checked_imgName[i] = "Radio_checked_blue_1.png";
        }
        else
          this.checked_imgName[i] = "Radio_no_checked_1.png";
      }
    })
  }
}

/**
 * 禁用状态
 */
@Component
export struct Radio_disabled{
  @State name: string[] = [];// 保存所有单选框的名称
  @State radio_groupName: string = "";// 单选框所属的组别
  @State checked_init: boolean[] = [];// 初始选中状态
  @State checked_imgName: string[] = [];// 选中/未选中状态下的图标
  @State isDisabled: boolean[] = [];// 是否禁用
  @State cur_opacity: number = 1;
  name_num: number = 0;//单选框数量

  func_checked(index: number){
    if(this.isDisabled[index] == true)
      return;
    //点击文本选中当前单选框
    for (let i = 0; i < this.name.length; i++) {
      if(this.isDisabled[i] == false)
        this.checked_imgName[i] = "Radio_no_checked_1.png";
    }
    this.checked_imgName[index] = "Radio_checked_blue_1.png";

    console.log(this.checked_imgName + " ");
  }

  build() {
    Column(){
      ForEach(this.name, (item: any,index: number) => {
        Column(){
          Row(){
            Stack(){
              Image($rawfile(this.checked_imgName[index]))
                .borderRadius(21)
                .size({width: 42, height: 42})
                .offset({
                  x: -2,
                  y: -2
                })
            }
            .width(40)
            .height(40)
            .borderRadius(20)
            .border({width: 1, color: Color.Gray})
            .onClick(() => {
              this.func_checked(index)
            })

            Text(item)
              .fontSize(20)
              .margin({left: 10})
              .onClick(() => {
                this.func_checked(index)
              })
          }
          .width("100%")
          .align(Alignment.Start)
        }
        .opacity(this.cur_opacity)
        .height(40)
        .margin({top: 20})
        .width("100%")
      })
    }
    .onAppear(() => {
      for (let i = 0; i < this.name.length; i++) {
        if(this.isDisabled[i] == true){//禁用状态下初始化
          this.cur_opacity = 0.5;
          if(this.checked_init[i] == true) {
            for (let j = 0; j < this.name.length; j++) {
              if(this.isDisabled[j] == true)
                this.checked_imgName[j] = "Radio_no_checked_2.png";
            }
            this.checked_imgName[i] = "Radio_checked_disabled.png";
          }
          else
            this.checked_imgName[i] = "Radio_no_checked_2.png";
        }
        else {//非禁用状态下初始化
          if(this.checked_init[i] == true) {
            for (let j = 0; j < this.name.length; j++) {
              if(this.isDisabled[j] == false)
                this.checked_imgName[j] = "Radio_no_checked_1.png";
            }
            this.checked_imgName[i] = "Radio_checked_blue_1.png";
          }
          else
            this.checked_imgName[i] = "Radio_no_checked_1.png";
        }
      }
    })
  }
}

/**
 * 自定义颜色
 */
@Component
export struct Radio_color{
  @State name: string[] = [];// 保存所有单选框的名称
  @State checked_init: boolean[] = [];// 初始选中状态
  @State radio_groupName: string = "";// 单选框所属的组别
  @State checked_imgName: string[] = [];// 选中/未选中状态下的图标
  name_num: number = 0;//单选框数量

  func_checked(index: number){
    //点击文本选中当前单选框
    for (let i = 0; i < this.name.length; i++) {
      this.checked_imgName[i] = "Radio_no_checked_1.png";
    }
    this.checked_imgName[index] = "Radio_checked_green.png";

    console.log("console ==== " + this.checked_imgName[index]);
  }

  build() {
    Column(){
      ForEach(this.name, (item: any,index: number) => {
        Column(){
          Row(){
            Stack(){
              Image($rawfile(this.checked_imgName[index]))
                .size({width: 42, height: 42})
                .borderRadius(21)
                .offset({
                  x: -2,
                  y: -2
                })
            }
            .width(40)
            .height(40)
            .borderRadius(20)
            .border({width: 1, color: Color.Gray})
            .onClick(() => {
              this.func_checked(index)
            })

            Text(item)
              .fontSize(20)
              .margin({left: 10})
              .onClick(() => {
                this.func_checked(index)
              })
          }
          .width("100%")
          .align(Alignment.Start)
        }
        .margin({top: 20})
        .height(30)
        .width("100%")
      })
    }
    .onAppear(() => {
      this.name_num = this.name.length;
      for (let i = 0; i < this.name.length; i++) {
        if(this.checked_init[i] == true) {
          for (let j = 0; j < this.name.length; j++) {
            this.checked_imgName[j] = "Radio_no_checked_1.png";
          }
          this.checked_imgName[i] = "Radio_checked_green.png";
        }
        else
          this.checked_imgName[i] = "Radio_no_checked_1.png";
      }
    })
  }
}

/**
 * 自定义图标
 */
@Component
export struct Radio_icon{
  @State name: string[] = [];// 保存所有单选框的名称
  @State checked_init: boolean[] = [];// 初始选中状态
  @State radio_groupName: string = "";// 单选框所属的组别
  @State checked_imgName: string[] = [];// 选中/未选中状态下的图标
  @State cur_borderWidth: number[] = [];//单选框按钮边框宽度
  name_num: number = 0;//单选框数量

  func_checked(index: number){
    //点击文本选中当前单选框
    for (let i = 0; i < this.name.length; i++) {
      this.cur_borderWidth[i] = 1;
      this.checked_imgName[i] = "Radio_no_checked_1.png";
    }
    this.cur_borderWidth[index] = 0;
    this.checked_imgName[index] = "Radio_checked_blue_2.png";
  }

  build() {
    Column(){
      ForEach(this.name, (item: any,index: number) => {
        Column(){
          Row(){
            Stack(){
              Image($rawfile(this.checked_imgName[index]))
                .size({width: 42, height: 42})
                .borderRadius(21)
            }
            .width(40)
            .height(40)
            .borderRadius(20)
            .border({width: this.cur_borderWidth[index], color: Color.Gray})
            .onClick(() => {
              this.func_checked(index)
            })
            Text(item)
              .fontSize(20)
              .margin({left: 10})
              .onClick(() => {
                this.func_checked(index)
              })
          }
          .width("100%")
          .align(Alignment.Start)
        }
        .height(30)
        .margin({top: 20})
        .width("100%")
      })
    }
    .onAppear(() => {
      this.name_num = this.name.length;
      for (let i = 0; i < this.name.length; i++) {
        if(this.checked_init[i] == true) {
          for (let j = 0; j < this.name.length; j++) {
            this.cur_borderWidth[j] = 1;
            this.checked_imgName[j] = "Radio_no_checked_1.png";
          }
          this.cur_borderWidth[i] = 0;
          this.checked_imgName[i] = "Radio_checked_blue_2.png";
        }
        else
          this.checked_imgName[i] = "Radio_no_checked_1.png";
      }
    })
  }
}

/**
 * radio+cell
 */
@Component
export struct Radio_cell{
  @State name: string[] = [];// 保存所有单选框的名称
  @State checked_init: boolean[] = [];// 初始选中状态
  @State radio_groupName: string = "";// 单选框所属的组别
  @State checked_imgName: string[] = [];// 选中/未选中状态下的图标
  @State curBg: String[] = [];//背景颜色
  name_num: number = 0;//单选框数量

  func_checked(index: number){
    //点击文本选中当前单选框
    for (let i = 0; i < this.name.length; i++) {
      this.checked_imgName[i] = "Radio_no_checked_1.png";
    }
    this.checked_imgName[index] = "Radio_checked_blue_1.png";

    console.log("console ==== " + this.checked_imgName[index]);
  }
  build() {
    Column(){
      ForEach(this.name, (item: any,index: number) => {
        Column(){
          Row() {
            Text(item)
              .fontSize(20)
              .onClick(() => {
                this.func_checked(index)
              })
            Column() {
              Stack() {
                Image($rawfile(this.checked_imgName[index]))
                  .size({ width: 42, height: 42 })
                  .borderRadius(21)
                  .offset({
                    x: -2,
                    y: -2
                  })
              }
              .width(40)
              .height(40)
              .borderRadius(20)
              .border({ width: 1, color: Color.Gray })
              .onClick(() => {
                this.func_checked(index)
              })
            }
            .width("80%")
            .alignItems(HorizontalAlign.End)
          }
          .alignItems(VerticalAlign.Center)
          .height("100%")
          .width("100%")
        }
        .margin({top: 20})
        .height(40)
        .width("100%")
        .backgroundColor("" + this.curBg[index])
        .onClick(() => {
          this.curBg[index] = "#EAEAEA";
          this.func_checked(index);
          setTimeout(() => {
            this.curBg[index] = "#FFFFFF";
          }, 150)
        })
      })
    }
    .onAppear(() => {
      this.name_num = this.name.length;
      for (let i = 0; i < this.name.length; i++) {
        this.curBg[i] = "#FFFFFF";
        if(this.checked_init[i] == true) {
          for (let j = 0; j < this.name.length; j++) {
            this.checked_imgName[j] = "Radio_no_checked_1.png";
          }
          this.checked_imgName[i] = "Radio_checked_blue_1.png";
        }
        else
          this.checked_imgName[i] = "Radio_no_checked_1.png";
      }
    })
  }
}
