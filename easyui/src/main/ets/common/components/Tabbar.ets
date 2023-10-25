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
 * Tabbar基础用法
 */
@Component
export struct Tabbar_default{
  //图标数组，并设置默认值
  @State tabIcon_up: string[] = ["Tabbar_index_default_gray.png", "Tabbar_search_default_gray.png", "Tabbar_group_default_gray.png", "Tabbar_setting_default_gray.png"];
  @State tabIcon_cur: string[] = ["Tabbar_index_default_gray.png", "Tabbar_search_default_gray.png", "Tabbar_group_default_gray.png", "Tabbar_setting_default_gray.png"];
  @State tabIcon_down: string[] = ["Tabbar_index_default_blue.png", "Tabbar_search_default_blue.png", "Tabbar_group_default_blue.png", "Tabbar_setting_default_blue.png"];

  //标签文本数组，并设置默认值；
  @State tabText: string[] = ["标签", "标签", "标签", "标签"];

  //右上角的红点标签，0==没有，1==红点， 2~n==新消息数
  @State tabRed: number[] = [0, 1, 5, 20];
  @State tabRed_text: string[] = ["", "", "5", "20"];
  @State tabRed_w: number[] = [0, 10, 20, 30];//红点标签宽度
  @State tabRed_h: number[] = [0, 10, 20, 20];//红点标签宽度

  //单个标签在占整行(10)的权重，默认值为2.5
  @State layoutweight: number = 2.5;

  build(){
    Row(){
      ForEach(this.tabIcon_cur, (item: any, index: number) => {
        Column(){
          Row(){//单个图标
            Stack(){
              Image($rawfile(item))
                .height("90%")

              Text(this.tabRed_text[index])
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
                .width(this.tabRed_w[index])
                .height(this.tabRed_h[index])
                .borderRadius(20)
                .backgroundColor(Color.Red)
                .position({
                  x: "25%",
                  y: 0
                })
                .onAppear(() => {
                  console.log("==== " + this.tabRed[index]);
                  if(this.tabRed[index] == 0) {
                    this.tabRed_w[index] = 0;
                    this.tabRed_text[index] = "";
                  }
                  else if(this.tabRed[index] == 1){
                    this.tabRed_w[index] = 10;
                    this.tabRed_h[index] = 10;
                    this.tabRed_text[index] = "";
                  }
                  else if(this.tabRed[index] > 1 && this.tabRed[index] < 10){
                    this.tabRed_w[index] = 20;
                    this.tabRed_h[index] = 20;
                    this.tabRed_text[index] = this.tabRed[index] + "";
                  }
                  else {
                    this.tabRed_w[index] = 30;
                    this.tabRed_h[index] = 20;
                    this.tabRed_text[index] = this.tabRed[index] + "";
                  }

                  console.log("==== " + this.tabRed_w + "  " + this.tabRed_h + " ====")
                })
            }

          }
          .height("60%")

          Row(){
            Text(this.tabText[index])
              .fontSize(20)
          }
          .height("40%")
        }
        .onClick(() => {
          for (let i = 0; i < this.tabIcon_cur.length; i++) {
            if(i == index)
              this.tabIcon_cur[i] = this.tabIcon_down[i];
            else{
              this.tabIcon_cur[i] = this.tabIcon_up[i];
            }
          }
        })
        .height("100%")
        .layoutWeight(this.layoutweight)
      })
    }
    .onAppear(() => {
      this.layoutweight = 10.0 / this.tabIcon_up.length;
      console.log("[" + this.layoutweight + "]");
      for (let i = 0; i < this.tabIcon_cur.length; i++) {
        if(i == 0)
          this.tabIcon_cur[i] = this.tabIcon_down[i];
        else{
          this.tabIcon_cur[i] = this.tabIcon_up[i];
        }
      }
    })
    .width("100%")
    .height("100%")
  }
}