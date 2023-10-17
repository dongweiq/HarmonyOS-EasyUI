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

const textColor:string = "#ffffffff"              //标签的文字颜色
const primaryColor:string = "#ff1989fa"           //主要样式标签颜色
const successColor:string = "#ff07c160"           //成功样式标签颜色
const dangerColor:string = "#ffff4444"            //危险样式标签颜色
const defaultColor:string = "#ff969799"           //默认样式标签颜色
const largeSize:number = 24                       //大尺寸标签
const mediumSize:number = 20                      //中等尺寸标签
const defaultSize:number = 16                     //默认尺寸标签
const round:number = 10                           //圆角度

@Component
export struct Tag {

  private tagText:string = "标签"              //标签文本内容，默认为“标签”
  private tagType:TagType = TagType.default   //标签类型 ，默认为default
  private tagSize:TagSize = TagSize.default   //标签尺寸，默认为default
  private color:string = ""                   //标签颜色 ，不设置的话会使用TagType的default
  private isPlain:boolean = false             //标签是否为空心样式
  private isRound:boolean = false             //标签是否是圆角样式
  private isMark:boolean = false              //标签是否是标记标签
  private textColor:string = "#ffffffff"      //标签文字颜色，默认为白色

  click:()=>void         //点击事件的方法

  build() {
    if(!this.isMark) {
      Column() {
        Text(this.tagText)
          .backgroundColor(this.isPlain ? textColor : this.color === "" ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.color)
          .fontColor(this.isPlain ? this.textColor === textColor ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.textColor : this.textColor)
          .padding({
            top: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
            left: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
            right: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
            bottom: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 2
          })
          .fontSize(this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize)
          .borderRadius(this.isRound ? (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * round : 2)
          .borderWidth(this.isPlain ? 1 : 0)
          .borderColor(this.isPlain ? this.textColor === textColor ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.textColor : this.textColor)
          .onClick(this.click)
      }
    }else{
      Stack() {
        Text(this.tagText)
          .backgroundColor(this.color === "" ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.color)
          .fontColor(this.color === "" ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.color)
          .padding({
            top: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
            left: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
            right: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 8,
            bottom: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 2
          })
          .borderRadius((this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * round)
          Text(this.tagText)
            .backgroundColor(this.color === "" ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.color)
            .fontColor(this.isPlain ? this.tagType === 0 ? defaultColor : this.tagType === 1 ? primaryColor : this.tagType === 2 ? successColor : dangerColor : this.textColor)
            .padding({
              top: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
              left: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 5,
              bottom: (this.tagSize === 0 ? defaultSize : this.tagSize === 1 ? mediumSize : largeSize) / defaultSize * 2
            })
            .position({x:0})
            .onClick(this.click)
      }
    }
  }
}

//定义标签大小
export enum TagSize {
  default,
  medium,
  large
}

//定义标签类型
export enum TagType {
  default,
  primary,
  success,
  danger
}