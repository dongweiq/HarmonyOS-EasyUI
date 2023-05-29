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
import {Label_topic_default,Label_topic_primary,Label_topic_success,Label_topic_info,Label_topic_warning,Label_topic_danger,
  Label_badge_default,Label_badge_primary,Label_badge_success,Label_badge_info,Label_badge_warning,Label_badge_danger,
  Label_dot_default,Label_dot_primary,Label_dot_success,Label_dot_info,Label_dot_warning,Label_dot_danger,
  Label_outline_topic_default,Label_outline_topic_primary,Label_outline_topic_success,Label_outline_topic_info,
  Label_outline_topic_warning,Label_outline_topic_danger,Label_outline_badge_default,Label_outline_badge_primary,
  Label_outline_badge_success,Label_outline_badge_info,Label_outline_badge_warning,Label_outline_badge_danger,
  Label_outline_dot_default,Label_outline_dot_primary,Label_outline_dot_success,Label_outline_dot_info,
  Label_outline_dot_warning,Label_outline_dot_danger,Label_useInButton_default,Label_useInButton_primary,
  Label_useInButton_success,Label_useInButton_info,Label_useInButton_warning,Label_useInButton_danger,Label_useInButton_primary_1,
  Label_useInButton_success_1,Label_useInButton_info_1,Label_useInButton_warning_1,Label_useInButton_danger_1,
  Label_useInButton_default_2,Label_useInButton_primary_2,Label_useInButton_success_2,Label_useInButton_info_2,Label_useInButton_warning_2,Label_useInButton_danger_2,
  Label_useInButton_primary_3,Label_useInButton_success_3,Label_useInButton_info_3,Label_useInButton_warning_3,Label_useInButton_danger_3} from "../common/components/Label"


@Entry
@Component
struct TestLabel {
  private controller: TabsController = new TabsController();

  @State fontColor: string = 'rgba(0, 0, 0, 0.4)'
  @State selectedFontColor: string = 'rgba(10, 30, 255, 1)'
  @State currentIndex: number = 0

  @Builder TabBuilder(index: number) {
    Column() {
      Text(`第${(index > 2 ? (index - 1) : index) + 1}页`)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(24)
        .margin({top: 2})
    }
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.controller }) {

        TabContent(){
          Flex() {
            TestLabel_1()
          }
          .position({
            x:0,y:20
          })
        }.tabBar(this.TabBuilder(0))
        .backgroundColor(0xF5F5F5)

        TabContent(){
          Flex() {
            TestLabel_2()
          }
          .position({
            x:0,y:20
          })
        }.tabBar(this.TabBuilder(1))
        .backgroundColor(0xF5F5F5)
      }

      .barHeight(40)
      // .backgroundColor(0xF5F5F5)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
  }
}



// @Entry
@Component
struct TestLabel_1 {

  build() {
    Column() {

      /**
       * 颜色主题
       */
      Text("颜色主题")
        .fontSize(16)
        .margin({ bottom: 10 })
      Flex() {
        Label_topic_default()
          .position({
            x: 10,
            y: 0
          })
        Label_topic_primary()
          .position({
            x: 92,
            y: 0
          })
        Label_topic_success()
          .position({
            x: 175,
            y: 0
          })
        Label_topic_info()
          .position({
            x: 260,
            y: 0
          })

        Label_topic_warning()
          .position({
            x: 80,
            y: 40
          })

        Label_topic_danger()
          .position({
            x: 170,
            y: 40
          })
      }
      /**
       * 作为徽标
       */
      Text("作为徽标")
        .fontSize(16)
        .margin({ bottom: 10 })
        .markAnchor({
          x: 0,
          y: -80
        })

      Flex() {
        Label_badge_default()
          .position({
            x: 10,
            y: 80
          })
        Label_badge_primary()
          .position({
            x: 92,
            y: 80
          })
        Label_badge_success()
          .position({
            x: 175,
            y: 80
          })
        Label_badge_info()
          .position({
            x: 260,
            y: 80
          })

        Label_badge_warning()
          .position({
            x: 80,
            y: 120
          })

        Label_badge_danger()
          .position({
            x: 170,
            y: 120
          })
      }

      /**
       * 小圆点徽标
       */
      Text("小圆点徽标")
        .fontSize(16)
        .margin({ bottom: 10 })
        .markAnchor({
          x: 0,
          y: -160
        })
      Flex() {
        Label_dot_default()
          .position({
            x: 50,
            y: 160
          })
        Label_dot_primary()
          .position({
            x: 90,
            y: 160
          })
        Label_dot_success()
          .position({
            x: 130,
            y: 160
          })
        Label_dot_info()
          .position({
            x: 170,
            y: 160
          })
        Label_dot_warning()
          .position({
            x: 210,
            y: 160
          })
        Label_dot_danger()
          .position({
            x: 250,
            y: 160
          })
      }

      /**
       * 轮廓外观
       */
      Text("轮廓外观")
        .fontSize(16)
        .margin({ bottom: 10 })
        .markAnchor({
          x: 0,
          y: -190
        })
      Flex() {
        Label_outline_topic_default()
          .position({
            x: 10,
            y: 190
          })
        Label_outline_topic_primary()
          .position({
            x: 92,
            y: 190
          })
        Label_outline_topic_success()
          .position({
            x: 175,
            y: 190
          })
        Label_outline_topic_info()
          .position({
            x: 260,
            y: 190
          })

        Label_outline_topic_warning()
          .position({
            x: 80,
            y: 230
          })

        Label_outline_topic_danger()
          .position({
            x: 170,
            y: 230
          })


        Label_outline_badge_default()
          .position({
            x: 10,
            y: 270
          })
        Label_outline_badge_primary()
          .position({
            x: 92,
            y: 270
          })
        Label_outline_badge_success()
          .position({
            x: 175,
            y: 270
          })
        Label_outline_badge_info()
          .position({
            x: 260,
            y: 270
          })

        Label_outline_badge_warning()
          .position({
            x: 80,
            y: 310
          })

        Label_outline_badge_danger()
          .position({
            x: 170,
            y: 310
          })


        Label_outline_dot_default()
          .position({
            x: 50,
            y: 350
          })
        Label_outline_dot_primary()
          .position({
            x: 90,
            y: 350
          })
        Label_outline_dot_success()
          .position({
            x: 130,
            y: 350
          })
        Label_outline_dot_info()
          .position({
            x: 170,
            y: 350
          })
        Label_outline_dot_warning()
          .position({
            x: 210,
            y: 350
          })
        Label_outline_dot_danger()
          .position({
            x: 250,
            y: 350
          })

        }
      }.margin(10)
    }
}

// @Entry
@Component
struct TestLabel_2 {
  build() {
    Column() {
      /**
       * 按钮中的徽标使用
       */
      Text("按钮中的徽标使用")
        .fontSize(16)
        .margin({ bottom: 10 })
        .markAnchor({
          x: 0,
          y: 0
        })
      Flex() {
          Label_useInButton_default()
            .position({
              x: 40,
              y: 0
            })
          Label_useInButton_primary()
            .position({
              x: 170,
              y: 0
            })
          Label_useInButton_success()
            .position({
              x: 40,
              y: 42
            })
          Label_useInButton_info()
            .position({
              x: 170,
              y: 42
            })
          Label_useInButton_warning()
            .position({
              x: 40,
              y: 84
            })
          Label_useInButton_danger()
            .position({
              x: 170,
              y: 84
            })


          Label_useInButton_primary_1()
            .position({
              x: 0,
              y: 150
            })
          Label_useInButton_success_1()
            .position({
              x: 115,
              y: 150
            })
          Label_useInButton_info_1()
            .position({
              x: 230,
              y: 150
            })

          Label_useInButton_warning_1()
            .position({
              x: 50,
              y: 190
            })

          Label_useInButton_danger_1()
            .position({
              x: 170,
              y: 190
            })


        Label_useInButton_default_2()
          .position({
            x:30,
            y:250
          })

        Label_useInButton_primary_2()
          .position({
            x:120,
            y:250
          })

        Label_useInButton_success_2()
          .position({
            x:230,
            y:250
          })

        Label_useInButton_info_2()
          .position({
            x:10,
            y:290
          })

        Label_useInButton_warning_2()
          .position({
            x:120,
            y:290
          })

        Label_useInButton_danger_2()
          .position({
            x:230,
            y:290
          })

        Label_useInButton_primary_3()
          .position({
            x: 40,
            y: 350
          })
        Label_useInButton_success_3()
          .position({
            x: 125,
            y: 350
          })
        Label_useInButton_info_3()
          .position({
            x: 210,
            y: 350
          })
        Label_useInButton_warning_3()
          .position({
            x: 80,
            y: 390
          })
        Label_useInButton_danger_3()
          .position({
            x: 170,
            y: 390
          })
      }
      }.margin(10)
    }
}