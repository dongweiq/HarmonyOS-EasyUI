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


import {Pagination_basic,Pagination_simple,Pagination_ellipses} from "easyui"

@Entry
@Component
struct TestPagination {
  @State currentPage_1:number = 1
  @State currentPage_2:number = 1
  @State currentPage_3:number = 1
  build() {
    Column(){
      Text("基础用法")
        .alignSelf(ItemAlign.Start)
        .margin({ top:100,left:10,bottom:10 })
      Pagination_basic({
        totalPage:5,
        currentPage:$currentPage_1
      })

      Text("简单模式")
        .alignSelf(ItemAlign.Start)
        .margin({ top:100,left:10,bottom:10 })

      Pagination_simple({
          totalPage:12,
          currentPage:$currentPage_2
      })

      Text("显示省略号")
        .alignSelf(ItemAlign.Start)
        .margin({ top:100,left:10,bottom:10 })

      Pagination_ellipses({
        totalPage:15,
        currentPage:$currentPage_3
      })

    }.width("100%")
    .height("100%")
    .backgroundColor("#ffececec")
  }
}