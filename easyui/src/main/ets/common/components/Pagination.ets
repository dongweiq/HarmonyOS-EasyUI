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
export struct Pagination_basic {
  @Link currentPage:number
  private totalPage:number = 5
  private pages:number[] = []

  initPages(){
    if(this.totalPage <1 || this.totalPage >6){
      console.error("页数有误，总页数范围为1-6")
    }else{
      for(let i=0;i<this.totalPage;i++){
        this.pages[i] = i+1;
      }
    }
  }
  aboutToAppear(){
    this.initPages()
  }

  build() {
      Row() {
        if(this.currentPage == 1){
          Button(){
            Text("上一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff949494")
              .margin(5)
          }
          .backgroundColor("#ffc9cac9")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .hitTestBehavior(HitTestMode.None)
        }else{
          Button(){
            Text("上一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .onClick(()=>{
            if(this.currentPage >1){
              this.currentPage = this.currentPage - 1;
            }
          })
        }

        List() {
          ForEach(this.pages, (item,index) => {
            if(this.currentPage == index+1){
              ListItem() {
                Button() {
                  Text("" + item)
                    .height(20)
                    .width(30)
                    .textAlign(TextAlign.Center)
                    .fontColor("#ffffffff")
                    .margin(5)
                }
                .type(ButtonType.Normal)
                .backgroundColor("#ff1f85e5")
                .onClick(()=>{
                  this.currentPage = index+1
                })
              }
            }else {
              ListItem() {
                Button() {
                  Text("" + item)
                    .height(20)
                    .width(30)
                    .textAlign(TextAlign.Center)
                    .fontColor("#ff1f85e5")
                    .margin(5)
                }
                .type(ButtonType.Normal)
                .backgroundColor("#ffffffff")
                .onClick(()=>{
                  this.currentPage = index+1
                })
              }
            }

          })
        }
        .listDirection(Axis.Horizontal)

        if(this.currentPage == this.totalPage){
          Button(){
            Text("下一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff949494")
              .margin(5)
          }
          .backgroundColor("#ffc9cac9")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .hitTestBehavior(HitTestMode.None)

        }else{
          Button(){
            Text("下一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .onClick(()=>{
            if(this.currentPage < this.totalPage){
              this.currentPage = this.currentPage + 1;
            }
          })
        }
      }.height(30)
  }
}


// @Entry
@Component
export struct Pagination_simple {
  @Link currentPage:number
  private totalPage:number = 12

  build() {
      Row(){
        if(this.currentPage == 1){
          Button(){
            Text("上一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff949494")
              .margin(5)
          }
          .backgroundColor("#ffc9cac9")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .hitTestBehavior(HitTestMode.None)
        }else{
          Button(){
            Text("上一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .onClick(()=>{
            if(this.currentPage >1){
              this.currentPage -= 1
            }
          })
        }

        Text(this.currentPage+"/"+this.totalPage)
          .margin({left:20,right:20})

        if(this.currentPage == this.totalPage){
          Button(){
            Text("下一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff949494")
              .margin(5)
          }
          .backgroundColor("#ffc9cac9")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .hitTestBehavior(HitTestMode.None)
        }else{
          Button(){
            Text("下一页")
              .height(20)
              .width(50)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .backgroundColor("#ffffffff")
          .type(ButtonType.Normal)
          .alignSelf(ItemAlign.Start)
          .onClick(()=>{
            if(this.currentPage < this.totalPage ){
              this.currentPage += 1
            }
          })
        }
      }

  }
}

@Component
export struct Pagination_ellipses {
  @Link currentPage:number
  private totalPage:number = 12

  pages(totalPage:number):number[]{
    let pages:number[] = []
      for(let i=0;i<totalPage;i++){
        pages[i] = i+1;
      }
    console.log(pages+"");
    return pages
  }

  aboutToAppear(){
    if(this.totalPage < 0){
      console.error("总页数应该大于等于0")
    }
  }

  build() {
    Row() {
      if (this.currentPage == 1) {
        Button() {
          Text("上一页")
            .height(20)
            .width(50)
            .textAlign(TextAlign.Center)
            .fontColor("#ff949494")
            .margin(5)
        }
        .backgroundColor("#ffc9cac9")
        .type(ButtonType.Normal)
        .alignSelf(ItemAlign.Start)
        .hitTestBehavior(HitTestMode.None)
      } else {
        Button() {
          Text("上一页")
            .height(20)
            .width(50)
            .textAlign(TextAlign.Center)
            .fontColor("#ff1f85e5")
            .margin(5)
        }
        .backgroundColor("#ffffffff")
        .type(ButtonType.Normal)
        .alignSelf(ItemAlign.Start)
        .onClick(() => {
          if (this.currentPage > 1) {
            this.currentPage = this.currentPage - 1;
          }
        })
      }
      //处理只有一页和两页的情况
      if(this.totalPage == 0 || this.totalPage == 1 || this.totalPage == 2){
        List() {
          ForEach(this.pages(this.totalPage), (item,index) => {
            if(this.currentPage == index+1){
              ListItem() {
                Button() {
                  Text("" + item)
                    .height(20)
                    .width(30)
                    .textAlign(TextAlign.Center)
                    .fontColor("#ffffffff")
                    .margin(5)
                }
                .type(ButtonType.Normal)
                .backgroundColor("#ff1f85e5")
                .onClick(()=>{
                  this.currentPage = index+1
                })
              }
            }else {
              ListItem() {
                Button() {
                  Text("" + item)
                    .height(20)
                    .width(30)
                    .textAlign(TextAlign.Center)
                    .fontColor("#ff1f85e5")
                    .margin(5)
                }
                .type(ButtonType.Normal)
                .backgroundColor("#ffffffff")
                .onClick(()=>{
                  this.currentPage = index+1
                })
              }
            }

          })
        }
        .listDirection(Axis.Horizontal)
      }else {

        //出现左省略号
        if (this.currentPage >= 3 && this.totalPage != 3) {
          Button() {
            Text("...")
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(() => {
            this.currentPage -= 2
          })
        }
        //三个页签显示
        if (this.currentPage == 1) {
          Button() {
            Text("" + (this.currentPage))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ffffffff")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ff1f85e5")

          Button() {
            Text("" + (this.currentPage + 1))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage +1
          })

          Button() {
            Text("" + (this.currentPage + 2))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage +2
          })
        } else if (this.currentPage == this.totalPage) {
          Button() {
            Text("" + (this.currentPage - 2))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage - 2
          })

          Button() {
            Text("" + (this.currentPage - 1))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage - 1
          })

          Button() {
            Text("" + (this.currentPage))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ffffffff")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ff1f85e5")
        } else {
          Button() {
            Text("" + (this.currentPage - 1))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage -1
          })

          Button() {
            Text("" + this.currentPage)
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ffffffff")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ff1f85e5")

          Button() {
            Text("" + (this.currentPage + 1))
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(()=>{
            this.currentPage = this.currentPage + 1
          })
        }


        //出现右省略号
        if (this.currentPage <= this.totalPage - 2) {
          Button() {
            Text("...")
              .height(20)
              .width(30)
              .textAlign(TextAlign.Center)
              .fontColor("#ff1f85e5")
              .margin(5)
          }
          .type(ButtonType.Normal)
          .backgroundColor("#ffffffff")
          .onClick(() => {
            if (this)
              this.currentPage += 2
          })
        }
      }
      if (this.currentPage == this.totalPage) {
        Button() {
          Text("下一页")
            .height(20)
            .width(50)
            .textAlign(TextAlign.Center)
            .fontColor("#ff949494")
            .margin(5)
        }
        .backgroundColor("#ffc9cac9")
        .type(ButtonType.Normal)
        .alignSelf(ItemAlign.Start)
        .hitTestBehavior(HitTestMode.None)

      } else {
        Button() {
          Text("下一页")
            .height(20)
            .width(50)
            .textAlign(TextAlign.Center)
            .fontColor("#ff1f85e5")
            .margin(5)
        }
        .backgroundColor("#ffffffff")
        .type(ButtonType.Normal)
        .alignSelf(ItemAlign.Start)
        .onClick(() => {
          if (this.currentPage < this.totalPage) {
            this.currentPage = this.currentPage + 1;
          }
        })
      }
    }.height(30)
  }
}