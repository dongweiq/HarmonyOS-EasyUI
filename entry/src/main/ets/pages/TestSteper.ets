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


import { steper } from 'easyui'
@Entry
@Component
struct TestStepper {
  build() {
    Column(){
      Text("基础用法")
        .alignSelf(ItemAlign.Start)
        .margin({bottom:20,top:20})
      steper()
        .alignSelf(ItemAlign.Start)
      Text("禁用状态")
        .alignSelf(ItemAlign.Start)
        .margin({bottom:20,top:20})
      steper({
        disabled:true
      })
        .alignSelf(ItemAlign.Start)
      Text("异步变更")
        .alignSelf(ItemAlign.Start)
        .margin({bottom:20,top:20})
      steper({
        currentValue:10,
        asyncChange:true
      })
        .alignSelf(ItemAlign.Start)
      Text("高级用法")
        .alignSelf(ItemAlign.Start)
        .margin({bottom:20,top:20})
      steper({
        min:4,    //默认值为1
        max:12,   //默认值为100
        currentValue:9,
        step:2    //步长，默认值为1
      })
        .alignSelf(ItemAlign.Start)

    }
    .padding(10)
    .width("100%")
    .height("100%")
  }
}