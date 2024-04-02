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


import { BadgeGroup } from '@isrc/easyui'
@Entry
@Component
struct TestBadge {
  private badgeList:{title:string,info:string}[]=
    [{title:"标题名称",info:""},{title:"标题名称",info:"8"},{title:"标题名称",info:"99"},{title:"标题名称",info:"99+"}]
  build() {
    Column() {
      Text("基础用法")
        .fontColor("#ff6d6d6d")
        .alignSelf(ItemAlign.Start)
        .margin(20)
      Column() {
        Row() {
          BadgeGroup({
            badgeList: this.badgeList
          }).alignSelf(ItemAlign.Center)
        }.height(400)
      }.width("90%")
      .backgroundColor("#ffffffff")
    }.width("100%")
    .height("100%")
    .backgroundColor("#ffe5e5e5")
  }
}