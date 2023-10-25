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


import { search_advance, search_default, search_listen } from 'easyui'

@Entry
@Component
struct TextSearch{
  build(){
      Column({space: 20}){
        Text("search基础用法")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10, top: 10})
          .align(Alignment.Start)
        search_default({searchIconUrl: "TextInput_search.png", placeholder: "请输入搜索关键词"})

        Text("search监听相应事件")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        search_listen({searchIconUrl: "TextInput_search.png", placeholder: "请输入搜索关键词"})

        Text("search高级用法")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        search_advance({searchIconUrl: "TextInput_search.png", placeholder: "请输入搜索关键词", borderRadius_num: 20})
      }
      .backgroundColor("#ffdddddd")
      .height("100%")
      .width("100%")
  }
}