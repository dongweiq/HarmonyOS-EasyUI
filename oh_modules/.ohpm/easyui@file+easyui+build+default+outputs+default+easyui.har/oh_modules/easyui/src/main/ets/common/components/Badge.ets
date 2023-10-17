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
@Component
export struct BadgeGroup {
  private badgeList: {
    title: string,
    info: string
  }[] //徽标列表
  @State selected: boolean = false
  @State selectedIndex: number = 0

  build() {
    Column() {
      ForEach(this.badgeList, (item: {
        title: string,
        info: string
      }, index) => {
        if (this.selectedIndex === index) {
          BadgeItem({
            title: item.title,
            info: item.info,
            selected: true,
            index: index,
            selectIndex: $selectedIndex
          })
        } else {
          BadgeItem({
            title: item.title,
            info: item.info,
            selected: false,
            index: index,
            selectIndex: $selectedIndex
          })
        }
      })
    }
  }
}

@Component
struct BadgeItem {
  private title: string = "标签名称"
  private info: string = "1"
  private selected: boolean
  private index: number = 0
  @Link selectIndex: number

  build() {
    Row() {
      if (this.selected) {
        Column() {
          Rect()
            .width(2)
            .height("100%")
            .fill("#ff0000")
        }
      }
      Column() {
        if (this.info === "") {
          Text(this.title)
            .fontSize(18)
        } else {
          Badge({
            value: this.info,
            position: BadgePosition.RightTop,
            style: { color: 0xFFFFFF, fontSize: 12, badgeSize: 14, badgeColor: Color.Red }
          }) {
            Text(this.title)
              .fontSize(18)
          }
        }
      }.width("100%")
    }
    .height(80)
    .width(120)
    .backgroundColor(this.selected ? "#ffffffff" : "#ffdedede")
    .borderWidth(0.5)
    .borderColor("#ffe7e7e7")
    .onClick(() => {
      this.selectIndex = this.index
    })
  }
}