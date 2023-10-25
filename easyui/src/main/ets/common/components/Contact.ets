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

@Component
export struct ContactCard {
  @Link contactName:string
  @Link contactTel:string
  private editable:boolean = true
  private arr:number[] = [1,2,3,4,5,6,7,8,9]
  @State bgColor:string = "#ffffffff"
  @Link contactListHeight:number
  // @Link
  build() {
    Column() {
      if(this.editable){
        Column(){
          Text("基础用法")
            .alignSelf(ItemAlign.Start)
            .margin(20)
            .fontColor("#ff5b5b5b")
        }.width("100%")
      }else{
        Column(){
          Text("不可编辑")
            .alignSelf(ItemAlign.Start)
            .margin(20)
            .fontColor("#ff5b5b5b")
        }.width("100%")
      }
      Column() {
        Row() {
          if (this.contactName === "") {
            Column() {
              Image($rawfile("Contact_add.png"))
                .height(50)
                .width(50)
            }.layoutWeight(2)
            .margin({ top: 10, bottom: 10 })

            Column() {
              Text("添加联系人")
                .fontSize(18)
                .alignSelf(ItemAlign.Start)
            }.layoutWeight(8)
          } else {
            Column() {
              Image($rawfile("Contact_user.png")).width(25).height(25)
            }.layoutWeight(1)
            .margin({ left: 10 })

            Column() {
              Text("姓名: " + this.contactName)
                .alignSelf(ItemAlign.Start)
                .fontSize(18)
              Text("电话: " + this.contactTel)
                .alignSelf(ItemAlign.Start)
                .fontSize(18)
            }.layoutWeight(8)
            .margin({ top: 15, bottom: 15 })
          }

          if (this.editable) {
            Column() {
              Image($rawfile("Contact_rightArrow.png")).width(25)
            }.layoutWeight(1)
          } else {
            Column() {
            }.layoutWeight(1)
          }
        }
        .width("100%")

        if (this.editable) {
          Flex({ justifyContent: FlexAlign.SpaceAround, direction: FlexDirection.Row }) {
            ForEach(this.arr, () => {
              Rect().layoutWeight(1).height(3).fill("#ff0080ff")
                .margin({ right: 3, left: 3 })
              Rect().layoutWeight(1).height(3).fill("#ffff3030")
            })
          }
        } else {
          Flex({ justifyContent: FlexAlign.SpaceAround, direction: FlexDirection.Row }) {
            ForEach(this.arr, () => {
              Rect().layoutWeight(1).height(2).fill("#ff2793ff")
                .margin({ right: 3, left: 3 })
              Rect().layoutWeight(1).height(2).fill("#ffff4747")
            })
          }
        }

      }.backgroundColor(this.bgColor)
      .onClick(() => {
        this.bgColor = "#ffcdcdcd"
        this.contactListHeight = 760
        setTimeout(() => {
          this.bgColor = "#ffffffff"
        }, 150)
      })
      .enabled(this.editable)
      .animation({ duration: 150 })
    }
  }

}

@Component
export struct ContactList {
  @Link contactList:{name:string,tel:string}[]
  @State selectedIndex:number = 0
  @State bgColor:string = "#ffffffff"
  @Link contactListHeight:number
  @Link contactListName:string
  @Link contactListTel:string
  @Link contactEditHeight:number
  @Link contactEditName:string
  @Link contactEditTel:string
  build() {
    Row() {
      Column() {
        List() {
          ForEach(this.contactList, (item: {
            name: string,
            tel: string
          }, index) => {
            ListItem() {
              Row() {
                Column() {
                  if (this.selectedIndex === index) {
                    Image($rawfile("AddressList_selected.png")).width(20).height(20)
                  } else {
                    Circle()
                      .fill("#ffffffff")
                      .stroke("#ff9f9f9f")
                      .strokeWidth(1)
                      .width(16)
                      .height(16)
                  }
                }.layoutWeight(1)

                Column() {
                  Text(item.name + "，" + item.tel)
                    .alignSelf(ItemAlign.Start)
                }.layoutWeight(8)

                Column() {
                  Image($rawfile("AddressList_edit.png")).height(20).width(25)
                }.layoutWeight(1)
              }
            }.backgroundColor(this.selectedIndex === index ? this.bgColor : "#ffffffff")
            .padding({ top: 15, bottom: 15 })
            .onClick(() => {
              //改变选中的对象
              this.selectedIndex = index
              this.bgColor = "#ffe5e5e5"
              //关闭contactList
              this.contactListHeight = 0
              //将值传回给父组件
              this.contactListName = item.name
              this.contactListTel = item.tel
              setTimeout(() => {
                this.bgColor = "#ffffffff"
              }, 150)
            })
            .animation({ duration: 150 })
          })
        }.layoutWeight(12)

        Column() {
          Button("新建联系人")
            .width("100%")
            .height("100%")
            .fontSize(20)
            .type(ButtonType.Normal)
            .backgroundColor("#ff0000")
            .onClick(()=>{
              //展示contactEdit页面
              this.contactEditHeight = 760
              //清空contactEdit页面的name值和Tel值
              this.contactEditName = ""
              this.contactEditTel = ""
            })
            .animation({duration:300})
        }.layoutWeight(1)
      }.backgroundColor("#ffe5e5e5")
      .alignSelf(ItemAlign.End)
    }.height(this.contactListHeight)
    .animation({duration:300})
  }
}

@Component
export struct ContactEdit {
  private name:string = ""
  private tel:string = ""
  @Link contactName:string
  @Link contactTel:string
  @State namePlaceholderFontColor:string = "#ffa4a4a4"
  @Link contactEditHeight:number
  @Link contactListHeight:number
  @Link contactList:{name:string,tel:string}[]
  @State telFontColor:string = "#ff000000"

  //展示提示弹窗
  showTips(message:string){
    promptAction.showToast({
      message:message,
      duration:1000,
      bottom:400
    })
  }

  build() {
    Row() {
      Column() {
        Column() {

          Column() {
            Row() {
              Text("姓名").margin({ right: 10 })
              TextInput({ placeholder: "请填写姓名", text: this.contactName })
                .backgroundColor("#ffffff")
                .onChange((value) => {
                  this.name = value
                })
            }.margin({ left: 10, top: 10, bottom: 5 })

            Divider().width("95%")
            Row() {
              Text("电话").margin({ right: 10 })
              TextInput({ placeholder: "请填写电话", text: this.contactTel })
                .backgroundColor("#ffffff")
                .fontColor(this.telFontColor)
                .onChange((value) => {
                  this.telFontColor = "#ff000000"
                  this.tel = value
                })
            }.margin({ left: 10, top: 5, bottom: 10 })
          }.backgroundColor("#ffffffff")

          Button("保存")
            .onClick((event: ClickEvent) => {
              //将文本输入框中的值赋值
              this.contactName = this.name
              this.contactTel = this.tel
              if(this.contactTel.length==11&& /^\d+$/.test(this.contactTel)){
                //关闭编辑页面
                this.contactEditHeight = 0
                //关闭联系人列表页面
                this.contactListHeight = 0
                //将该联系人加入到联系人列表中
                this.contactList.push({name:this.contactName,tel:this.contactTel})
              }else{
                this.showTips("请填写正确的电话")
                this.telFontColor = "#ffff0000"
              }
            })
            .margin({ top: 30 })
            .width("90%")
            .type(ButtonType.Normal)
            .backgroundColor("#ffff0000")
        }
      }.backgroundColor("#ffe5e5e5")
      .width("100%")
      .height("100%")
    }.height(this.contactEditHeight)
    .animation({duration:300})
  }
}