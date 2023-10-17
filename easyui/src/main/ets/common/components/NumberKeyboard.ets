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
export struct NumberKeyboard_default {

  @Link result:string
  @Link isPop:boolean
  private Number: String[] = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', '删除']

  build() {
    Column(){
      Column(){
        Button("完成")
          .fontColor("#ff0081ff")
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .alignSelf(ItemAlign.End)
          .onClick(()=>{
            this.isPop = false
          })
      }.width("100%")
      .backgroundColor("#ffffffff")
      .height(30)
      .borderWidth(0.2)
      .borderColor("#fff1f1f1")
      Grid() {
          ForEach(this.Number, (element: string) => {
            if(element!='.'&&element!='删除'){
              GridItem() {
                Button() {
                  Text(element)
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
                .borderWidth(0.5)
                .borderColor("#ffececec")
                .type(ButtonType.Normal)
                .backgroundColor("#ffffffff")

                .onClick(() => {
                  console.log("Input:", element)
                  this.result = element
                })
              }
            }else{
              GridItem() {
                Button() {
                  Text(element)
                    .fontSize(20)
                    .fontWeight(FontWeight.Bold)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
                .borderWidth(0.5)
                .borderColor("#ffececec")
                .type(ButtonType.Normal)
                .backgroundColor("#ffd9d9d9")
                .onClick(() => {
                  if(element == "删除"){
                    this.result = "delete"
                  }else{
                    this.result= element
                  }
                })
              }
            }
          }, element => element)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .width('100%')
      .backgroundColor("#ffffffff")
      .height(300)
    }
    .height(this.isPop==true?330:0)
    .animation({
      duration:250
    })
  }
}

// @Entry
@Component
export struct NumberKeyboard_custom {

  @Link result:string
  @Link isPop:boolean
  private Number: String[] = [ '1', '2', '3', '删除',  '4', '5', '6', '7', '8', '9', '完成','0', '.']

  build() {
    Column(){
      Grid() {
        ForEach(this.Number, (element: string) => {
          if(element=='删除'){
            GridItem() {
              Button() {
                Text(element)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
              .borderWidth(0.5)
              .borderColor("#ffececec")
              .type(ButtonType.Normal)
              .backgroundColor("#ffd9d9d9")
              .onClick(() => {
                  this.result = "delete"
              })
            }.rowStart(1)
            .rowEnd(2)
          }else if(element=='完成'){
            GridItem() {
              Button() {
                Text(element)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
              .borderWidth(0.5)
              .borderColor("#ffececec")
              .type(ButtonType.Normal)
              .backgroundColor("#ff0a7ef1")
              .onClick(()=>{
                this.isPop = false
              })
            }.rowStart(3)
            .rowEnd(4)
          } else if(element=='0') {
            GridItem() {
              Button() {
                Text(element)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
              .borderWidth(0.5)
              .borderColor("#ffececec")
              .type(ButtonType.Normal)
              .backgroundColor("#ffffffff")
              .onClick(() => {
                this.result = element
              })
            }.columnStart(1)
            .columnEnd(2)
          }else
           {
            GridItem() {
              Button() {
                Text(element)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
              .borderWidth(0.5)
              .borderColor("#ffececec")
              .type(ButtonType.Normal)
              .backgroundColor("#ffffffff")
              .onClick(() => {
                this.result = element
              })
            }
          }
        }, element => element)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .width('100%')
      .backgroundColor("#ffffffff")
    }
    .height(this.isPop==true?300:0)
    .animation({
      duration:250
    })
  }
}