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


import { Tag, TagSize, TagType } from 'easyui'
@Entry
@Component
struct TestTag {

  click(){
    console.log("这是点击事件测试的方法")
  }
  build() {
    Column() {
      //基础用法
      Text("基础用法")
        .margin(20)
      .alignSelf(ItemAlign.Start)
      Row() {
        Tag()
          .margin({right:10})
        Tag({
          tagType:TagType.danger    //设置标签类型为danger
        })
          .margin({right:10})
        Tag({
          tagType:TagType.primary   //设置标签类型为primary
        })
          .margin({right:10})
        Tag({
          tagType:TagType.success   //设置标签类型为success
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
      //空心样式
      Text("空心样式")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      Row() {
        Tag({
          isPlain:true            //设置标签是否为空心样式
        })
          .margin({right:10})
        Tag({
          isPlain:true,
          isRound:true,           //设置标签是否为圆角
          tagType:TagType.danger  //设置标签类型为danger
        })
          .margin({right:10})
        Tag({
          isPlain:true,
          isRound:true,
          tagType:TagType.primary
        })
          .margin({right:10})
        Tag({
          isPlain:true,
          tagType:TagType.success
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
      //圆角样式
      Text("圆角样式")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      Row() {
        Tag({
          isRound:true
        })
          .margin({right:10})
        Tag({
          isRound:true,
          tagType:TagType.danger
        })
          .margin({right:10})
        Tag({
          isRound:true,
          tagType:TagType.primary
        })
          .margin({right:10})
        Tag({
          isRound:true,
          tagType:TagType.success
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
     // 标记样式
      Text("标记样式")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      Row() {
        Tag({
          isMark:true             //设置标签是否是标记样式
        })
          .margin({right:10})
        Tag({
          isMark:true,
          tagType:TagType.danger
        })
          .margin({right:10})
        Tag({
          isMark:true,
          tagType:TagType.primary
        })
          .margin({right:10})
        Tag({
          isMark:true,
          tagType:TagType.success
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
      //自定义颜色
      Text("自定义颜色")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      Row() {
        Tag({
          color: "#fff2826a"        //设置标签的颜色
        })
          .margin({right:10})
        Tag({
          isPlain:true,
          textColor: "#fff2826a",   //设置标签的文字颜色
        })
          .margin({right:10})
        Tag({
          color: "#ff7232dd"
        })
          .margin({right:10})
        Tag({
          isPlain:true,
          textColor: "#ff7232dd",
        })
          .margin({right:10})
        Tag({
          color:"#ffffe1e1",
          textColor: "#ffad0000",
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
      //自定义颜色
      Text("标签大小")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      Row() {
        Tag({
          color: "#ffff4444"     //标签大小默认为default
        })
          .margin({right:10})
        Tag({
          color: "#ffff4444",     //设置标签颜色
          tagSize:TagSize.medium  //设置标签大小为中等
        })
          .margin({right:10})
        Tag({
          color: "#ffff4444",
          tagSize:TagSize.large,
          click:this.click     //设置点击事件的方法
        })
          .margin({right:10})
      }
      .margin({left:20,bottom:20})
      .alignSelf(ItemAlign.Start)
    }.width("100%")

  }
}