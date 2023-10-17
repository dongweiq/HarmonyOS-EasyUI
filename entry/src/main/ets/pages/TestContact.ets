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
import { ContactCard, ContactEdit, ContactList } from 'easyui'
@Entry
@Component
struct TestContact {
  private editable:boolean = true
  @State contactName:string = ""  //基础用法组件属性
  @State contactTel:string = ""   //基础用法组件属性
  @State contactListHeight:number = 0   //基础用法组件属性
  @State contactListName:string = "张三"
  @State@Watch("contactListValue") contactListTel:string = "13000000000"
  @State contactEditHeight:number = 0
  @State contactEditName:string = ""
  @State@Watch("contactEditValue") contactEditTel:string = ""
  @State contactList:{name:string,tel:string}[] = [{name:"张三",tel:"13000000000"},{name:"李四",tel:"13000000000"}]

  @State contactName_1:string = "张三"   //不可编辑组件属性
  @State contactTel_1:string = "13000000000"//不可编辑组件属性
  @State contactListHeight_1:number = 0//不可编辑组件属性

  contactListValue(){
    this.contactName = this.contactListName
    this.contactTel = this.contactListTel
  }

  contactEditValue(){
    this.contactName = this.contactEditName
    this.contactTel = this.contactEditTel
  }


  build() {
    Stack() {
      //不可编辑
      ContactCard({
        editable: false,
        contactListHeight: $contactListHeight_1,
        contactName: $contactName_1,
        contactTel: $contactTel_1
      }).position({y:160})

      //基础用法
      Row() {
        ContactCard({
          editable: this.editable,
          contactListHeight: $contactListHeight,
          contactName: $contactName,
          contactTel: $contactTel
        }).alignSelf(ItemAlign.Start)
      }.height("100%")


      Row() {
        ContactList({
          contactListHeight: $contactListHeight,
          contactListName: $contactName,
          contactListTel: $contactTel,
          contactEditHeight: $contactEditHeight,
          contactList: $contactList,
          contactEditName: $contactEditName,
          contactEditTel: $contactEditTel
        }).alignSelf(ItemAlign.End)
      }
      .height("100%")

      if (this.contactListHeight === 0) {
        Row() {
          ContactCard({
            editable: this.editable,
            contactListHeight: $contactListHeight,
            contactName: $contactListName,
            contactTel: $contactListTel
          }).alignSelf(ItemAlign.Start)
        }.height("100%").opacity(0)
      }

      Row() {
        ContactEdit({
          contactEditHeight: $contactEditHeight,
          contactTel: $contactEditTel,
          contactName: $contactEditName,
          contactListHeight: $contactListHeight,
          contactList: $contactList
        }).alignSelf(ItemAlign.End)
      }.height("100%")
      .visibility((this.contactListHeight !== 0 && this.contactEditHeight !== 0) ? Visibility.Visible : Visibility.Hidden)


    }.width("100%")
    .height("100%")
    .backgroundColor("#ffececec")
  }
}
