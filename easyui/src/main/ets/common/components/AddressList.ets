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


import promptAction from '@ohos.promptAction'
type Address = {
  id:number,
  name:string,
  tel:string,
  address:string
}
@Component
export struct AddressList {
  private addressList: Address[] = []       //地址列表
  private outRangeIdArray: number[] = []    //超出配送范围的地址id集合
  @State isSelectedId: number = 1   //被选中的地址
  //展示提示弹窗
  showTips(message: string) {
    promptAction.showToast({
      message: message,
      duration: 1000,
      bottom: 400
    })
  }

  build() {
    Column() {
      Column() {
        List() {
          ForEach(this.addressList, (item: Address, index) => {
            ListItem() {
              if (!this.outRangeIdArray.includes(item.id)) {
                if (this.isSelectedId === item.id) {
                  address({
                    address: item,
                    isSelectedId: $isSelectedId,
                    isSelected: true
                  })
                } else {
                  address({
                    address: item,
                    isSelectedId: $isSelectedId,
                    isSelected: false
                  })
                }
              }
            }
          })
        }
        Text("以下地址超出配送范围")
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20, top: 5, bottom: 5 })
          .fontColor("#ff737373")
        List() {
          ForEach(this.addressList, (item: Address) => {
            ListItem() {
              if (this.outRangeIdArray.includes(item.id)) {
                Column() {
                  addressEnable({
                    address: item
                  })
                }.width("100%")
              }
            }
          })
        }.height(100)
      }.height(400).backgroundColor("#ffababab")

      Column() {
        Button("新增地址")
          .type(ButtonType.Normal)
          .fontSize(24)
          .backgroundColor("#ff0000")
          .width("100%")
          .height(70)
          .onClick(() => {
            this.showTips("新增地址")
          })
      }.position({ x: 0, y: 630 })
    }
  }
}

@Component
struct address{

  private address:Address             //地址
  @State bgColor:string = "#ffffffff"
  private clickColor:string = "#ffbebebe"
  @Link isSelectedId:number            //被选中的id
  @State isSelected:boolean = false    //是否被选中
  //展示提示弹窗
  showTips(message:string){
    promptAction.showToast({
      message:message,
      duration:1000,
      bottom:400
    })
  }

  build(){
    Row(){
      Row() {
        Column() {
          if(this.isSelected){
            Image($rawfile("AddressList_selected.png")).width(20).height(20)
          }else{
            Circle().width(16).height(16).fill("#ffffffff").strokeWidth(1).stroke("#ffbababa")
          }

        }.layoutWeight(1)
        Column() {
          Row() {
            Text("" + this.address.name + ", " + this.address.tel)
              .fontSize(18)
          }.alignSelf(ItemAlign.Start).margin({ bottom: 5 })

          Row() {
            Text("" + this.address.address)
              .fontColor("#ff6d6d6d")
          }.alignSelf(ItemAlign.Start)
        }.layoutWeight(8)
      }.layoutWeight(9)
      .onClick(() => {
        this.bgColor = this.clickColor
        this.isSelectedId = this.address.id
        setTimeout(()=>{
          this.bgColor = "#ffffffff"
        },100)
      })
      .margin({bottom:10,top:10})
      Column(){
        Image($rawfile("AddressList_edit.png")).width(30).height(25)

      }.layoutWeight(1)
      .onClick(()=>{
        this.showTips("编辑地址")
        this.bgColor = this.clickColor
        setTimeout(()=>{
          this.bgColor = "#ffffffff"
        },100)
      })
    }.backgroundColor(this.bgColor)
    .animation({duration:100})
  }
}

@Component
struct addressEnable{
  private bgColor:string = "#ffffffff"
  private address:Address
  build(){
    Row(){
      Row() {
        Column() {
          Row() {
            Text("" + this.address.name + ", " + this.address.tel)
              .fontSize(20)
              .fontColor("#ffaeaeae")
          }.alignSelf(ItemAlign.Start).margin({ bottom: 5 })

          Row() {
            Text("" + this.address.address)
              .fontColor("#ffaeaeae")
          }.alignSelf(ItemAlign.Start)
        }.layoutWeight(8)
        .margin({left:20})
      }.layoutWeight(9)
      .margin({bottom:10,top:10})
      Column(){
        Image($rawfile("AddressList_edit.png")).width(30).height(25)
      }.layoutWeight(1)
    }.backgroundColor(this.bgColor)
    .animation({duration:100})
  }
}