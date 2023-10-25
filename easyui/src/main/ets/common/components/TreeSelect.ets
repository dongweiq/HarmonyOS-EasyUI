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
export struct TreeSelect {
  @State selectedProvinceNumber:number = -1;
  @State selectedCitiesNumber:number = 0;
  @Link result:string
  private data = [{
    "label":"北京",
    "children":[{
      "label":"北京"}]
  }]

  private provinces:string[] = []
  @State cities:string[] = []
  private disable:string[] = [];

  showAllCities():string[]{
    this.selectedCitiesNumber = 0
    let result:string[] = []
    this.data.forEach(element=>{
        element.children.forEach(city=>{
            result.push(city.label)
        })
    })
    return result
  }

  showAllProvinces():string[]{
    let result:string[] = []

    this.data.forEach(element=>{
      if(element.label){
            result.push(element.label)
      }
    })
    return result
  }
  //查询相应省份的城市
  showAllCitiesForProvince(province:string):string[]{
    this.selectedCitiesNumber = 0
    let result:string[] = []
    this.data.forEach(element=>{
      if(element.label == province){
        element.children.forEach(city=>{
            result.push(city.label)
        })
      }
    })
    return result

  }

  aboutToAppear(){
    this.provinces = this.showAllProvinces()
    this.cities = this.showAllCities()
  }
  build() {
    Row(){
      //左边的省份
        Column() {
          if (this.selectedProvinceNumber == -1) {
            Row() {
              Flex() {
                Text()
                  .height(40)
                  .width(3)
                  .backgroundColor("#aaff0000")
                  .alignSelf(ItemAlign.Start)
              }.layoutWeight(1)
              .backgroundColor("#ffffffff")

              Flex() {
                Text("所有城市")
                  .fontWeight(FontWeight.Bold)
                  .alignSelf(ItemAlign.Start)
                  .margin({ left: 0, top: 10, bottom: 10 })
              }
              .backgroundColor("#ffffffff")
              .layoutWeight(5)
            }
            .layoutWeight(1)
          } else {
            Row() {
              Flex() {
                Text()
                  .height(40)
                  .width(3)
                  .backgroundColor("#ffdbdbdb")
                  .alignSelf(ItemAlign.Start)
              }.layoutWeight(1)

              Flex() {
                Text("所有城市")
                  .alignSelf(ItemAlign.Start)
                  .margin({ left: 0, top: 10, bottom: 10 })
              }
              .layoutWeight(5)
            }
            .layoutWeight(1)
            .onClick(()=>{
              this.selectedProvinceNumber = -1
              this.cities = this.showAllCities()
            })
          }

          Scroll(){
            Column(){
              ForEach(this.provinces,(item,index)=>{

                if (this.selectedProvinceNumber == index) {
                  Row() {
                    Flex() {
                      Text()
                        .height(40)
                        .width(3)
                        .backgroundColor("#aaff0000")
                        .alignSelf(ItemAlign.Start)
                    }.layoutWeight(1)
                    .backgroundColor("#ffffffff")

                    Flex() {
                      Text(item+"")
                        .fontWeight(FontWeight.Bold)
                        .alignSelf(ItemAlign.Start)
                        .margin({ left: 0, top: 10, bottom: 10 })
                    }
                    .backgroundColor("#ffffffff")
                    .layoutWeight(5)
                  }
                } else {
                  Row() {
                    Flex() {
                      Text()
                        .height(40)
                        .width(3)
                        .backgroundColor("#ffdbdbdb")
                        .alignSelf(ItemAlign.Start)
                    }.layoutWeight(1)

                    Flex() {
                      Text(item+"")
                        .fontColor(this.disable.includes(item)?"#ffa0a0a0":Color.Black)
                        .alignSelf(ItemAlign.Start)
                        .margin({ left: 0, top: 10, bottom: 10 })
                    }
                    .layoutWeight(5)
                  }.hitTestBehavior(this.disable.includes(item)?HitTestMode.None:HitTestMode.Default)
                  .onClick(()=>{
                    this.selectedProvinceNumber = index
                    //查询相应省份的城市
                    this.cities = this.showAllCitiesForProvince(this.provinces[index]);
                  })
                }
              }, item => item)
            }

          }
          .scrollBar(BarState.Auto)
          .layoutWeight(5)
          .align(Alignment.TopStart)

        }
        .alignSelf(ItemAlign.Start)
        .layoutWeight(5)
        .backgroundColor("#ffdbdbdb")
        .height("30%")
      //中间的间隔
      Column()
      .layoutWeight(1)
      .backgroundColor("#ffe9e9e9")
      .height("30%")

      //右边对应的城市
      Column() {
        Scroll(){
          Column(){
            ForEach(this.cities,(item,index)=>{
              Row() {
                  if (this.selectedCitiesNumber == index) {
                    Flex() {
                      Text(item+"")
                        .fontWeight(FontWeight.Bold)
                        .fontColor("#ffff0000")
                        .alignSelf(ItemAlign.Start)
                        .margin({ left: 10, top: 10, bottom: 10 })
                    }
                    .backgroundColor("#ffffffff")
                    .layoutWeight(5)
                    Flex() {
                      Text("√")
                        .fontSize(10)
                        .fontColor("#ffffffff")
                        .textAlign(TextAlign.Center)
                        .height(12)
                        .width(12)
                        .borderRadius(10)
                        .backgroundColor("#ffff0000")
                        .alignSelf(ItemAlign.Start)
                    }.layoutWeight(1)
                    .backgroundColor("#ffffffff")
                  }else{
                    Flex() {
                      Text(item+"")
                        .fontColor(this.disable.includes(item)?"#ffa0a0a0":Color.Black)
                        .fontWeight(FontWeight.Bold)
                        .alignSelf(ItemAlign.Start)
                        .margin({ left: 10, top: 10, bottom: 10 })
                    }
                    .backgroundColor("#ffffffff")
                    .layoutWeight(5)
                  }
                }.hitTestBehavior(this.disable.includes(item)?HitTestMode.None:HitTestMode.Default)
              .onClick(()=>{
                this.selectedCitiesNumber = index
                this.result = this.cities[index]
              })

            }, item => item)
          }
        }
        .scrollBar(BarState.Auto)
        .align(Alignment.TopStart)

      }
      .alignSelf(ItemAlign.Start)
      .height("30%")
      .layoutWeight(10)
      .backgroundColor("#ffffffff")

    }
    .width("95%")
    .shadow({
      radius:10,
      color:"#ff000000",
      offsetX:5,
      offsetY:5
    })
    .margin(10)
  }
}