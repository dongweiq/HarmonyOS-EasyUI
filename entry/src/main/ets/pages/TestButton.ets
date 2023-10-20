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


import {Button_type_main,Button_type_normal,Button_type_link,
  Button_type_group,Button_size_big_blue,Button_size_big_grey,Button_size_small_blue,
  Button_size_small_grey,Button_size_tiny_blue, Button_size_tiny_grey,
  Button_size_block_blue,Button_size_block_grey,Button_state_withIcon,Button_state_stateSwitching,
  Button_state_multSelect,Button_state_singleSelect,Button_state_loading,Button_state_disable_blue,
  Button_state_disable_grey,Button_color_default,Button_color_main,Button_color_info,
  Button_color_success,Button_color_danger,Button_color_warn } from "easyui"


@Entry
@Component
struct TestButton {

  build() {
    Column() {

      Text("按钮的类型")
        .margin({bottom:10})
        .fontSize(16)
      Flex() {
        /**
         * 主要按钮使用
         */
        Button_type_main({
          buttonName:"主要按钮" //设置按钮名，不设置为默认值
        })
          .position({
            x: 0,
            y: 0
          })


        /**
         * 标准按钮使用
         */
        Button_type_normal()
          .position({
            x: 120,
            y: 0
          })



        /**
         * 链接按钮使用
         */
        Button_type_link()
          .position({
            x: 240,
            y: 0
          })



        /**
         * 按钮组使用
         */
        Button_type_group()
          .position({
            x: 45,
            y: 50
          })
        //          .onTouch(() => {
        //            console.log("点击了按钮组按钮")
        //          })
        //          .hitTestBehavior(HitTestMode.Transparent)
      }

      Text("按钮的尺寸")
        .margin({ bottom:10 })
        .markAnchor({
          x:0,
          y:-100
        })
        .fontSize(16)
      Flex() {
        /**
         * 大尺寸按钮使用
         */
        Button_size_big_blue()
          .position({
            x: 20,
            y: 100
          })
        Button_size_big_grey()
          .position({
            x: 180,
            y: 100
          })

        /**
         * 较小按钮使用
         */
        Button_size_small_blue()
          .position({
            x: 0,
            y: 170
          })
        Button_size_small_grey()
          .position({
            x: 95,
            y: 170
          })
        /**
         * 迷你按钮使用
         */
        Button_size_tiny_blue()
          .position({
            x: 190,
            y: 175
          })
        Button_size_tiny_grey()
          .position({
            x: 265,
            y: 175
          })

        /**
         * 块状按钮使用
         */
        Button_size_block_blue()
          .position({
            x: 0,
            y: 220
          })

        Button_size_block_grey()
          .position({
            x: 0,
            y: 270
          })
      }

      Text("按钮的不同状态")
        .margin({ bottom:10 })
        .fontSize(16)
        .markAnchor({
          x:0,
          y:-320
        })
      Flex() {
        /**
         * 带图标按钮使用
         */
        Button_state_withIcon({
          imgName:"Button_test_1.jpg" //传入rawfile文件夹下的图片名
        })
          .position({
            x: 0,
            y: 320
          })

        /**
         * 状态切换按钮
         */
        Button_state_stateSwitching()
          .position({
            x: 210,
            y: 325
          })

        /**
         * 多选按钮
         */
        Button_state_multSelect()
          .position({
            x: 50,
            y: 380
          })

        /**
         * 单选按钮使用
         */
        Button_state_singleSelect()
          .position({
            x: 0,
            y: 430
          })

        /**
         * 加载按钮使用
         */
        Button_state_loading({
          buttonName:"加载状态"
        })
          .position({
            x: 240,
            y: 430
          })

        /**
         * 禁用操作按钮使用
         */
        Button_state_disable_blue()
          .position({
            x: 30,
            y: 480
          })

        Button_state_disable_grey()
          .position({
            x: 190,
            y: 480
          })
      }

      Text("按钮的颜色")
        .margin({ bottom:10 })
        .fontSize(16)
        .markAnchor({
          x:0,
          y:-530
        })
      Flex() {
        /**
         * 默认按钮使用
         */
        Button_color_default()
          .position({
            x: 0,
            y: 530
          })

        /**
         * 主要按钮使用
         */
        Button_color_main()
          .position({
            x: 70,
            y: 530
          })

        /**
         * 信息按钮使用
         */
        Button_color_info()
          .position({
            x: 140,
            y: 530
          })

        /**
         * 成功按钮使用
         */
        Button_color_success()
          .position({
            x: 210,
            y: 530
          })

        /**
         * 警告按钮使用
         */
        Button_color_warn()
          .position({
            x: 280,
            y: 530
          })

        /**
         * 危险按钮使用
         */
        Button_color_danger()
          .position({
            x: 140,
            y: 580
          })

      }

    }.margin(5)

  }
}


