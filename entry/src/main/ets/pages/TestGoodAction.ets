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
import { GoodsAction_big, GoodsAction_mini } from "../common/components/GoodsAction"

@Entry
@Component
struct TestGoodAction {

  build(){
    Column(){
      Text("基础用法")
        .alignSelf(ItemAlign.Start)
      .margin(20)
      Row(){
        GoodsAction_mini({
          icon:"GoodAction_service.png",
          text:"客服",
          isShowPrompt:true,
          url:""        //跳转页面
        })
        GoodsAction_mini({
          icon:"GoodAction_Cart.png",
          text:"购物车",
          isShowPrompt:true
        })
        GoodsAction_big({
          text:"加入购物车",
          isShowPrompt:true
        })
        GoodsAction_big({
          text:"立即购买",
          isPrimary:true,
          isShowPrompt:true,
          promptMessage:"立即购买"
        })

      }.alignSelf(ItemAlign.Start)

      Text("图标提示")
        .alignSelf(ItemAlign.Start)
        .margin({ top:40,left:20,bottom:20 })

      Row(){
        GoodsAction_mini({
          icon:"GoodAction_service.png",
          text:"客服",
          isShowPrompt:true
        })
        GoodsAction_mini({
          icon:"GoodAction_Cart.png",
          text:"购物车",
          showTip:true,
          tipNumber:5,
          isShowPrompt:true
        })
        GoodsAction_mini({
          icon:"GoodAction_shop.png",
          text:"店铺",
          isShowPrompt:true
        })
        GoodsAction_big({
          text:"加入购物车",
          isShowPrompt:true
        })
        GoodsAction_big({
          text:"立即购买",
          isPrimary:true,
          promptMessage:"立即购买",
          url:"pages/TestSlider"
        })

      }.alignSelf(ItemAlign.Start)
    }
    .backgroundColor("#ffe5e5e5")
    .width("100%")
    .height("100%")
  }
}