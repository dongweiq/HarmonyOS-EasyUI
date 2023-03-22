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

//卡片视图组件
//暴露组件的属性
export class CardViewAttribute{
  //卡片的默认名字
  private static DEFAULT_NAME = "小M"
  //卡片的默认头像
  private static DEFAULT_ICON = "icon.png"
  //卡片的默认图片
  private static DEFAULT_CARDIMGAE = "img_1.png"


  //卡片视图的名字
  name?:string
  //卡片视图的头像
  icon?:string
  //卡片视图的图片
  CardImage?:string

  //属性检查，设为默认属性
  static checkAttribute(attribute:CardViewAttribute){
    if(attribute == undefined){
      attribute = new CardViewAttribute()
    }

    attribute.name = Precondition.check(attribute.name,CardViewAttribute.DEFAULT_NAME)
    attribute.icon = Precondition.check(attribute.icon,CardViewAttribute.DEFAULT_ICON)
    attribute.CardImage = Precondition.check(attribute.CardImage,CardViewAttribute.DEFAULT_CARDIMGAE)

    return attribute
  }

}
//属性检查类
class Precondition{
  public static check(target: any,defaultValue: any):any{
    return undefined == target ? defaultValue : target;
  }
}

@Component
export struct CardView {

  /**
   * 对卡片的属性进行设置
   * @param name:
   */
  attribute:CardViewAttribute;

  aboutToAppear(){
    if(this.attribute == undefined){
      console.error("请设置卡片视图组件的属性attribute")
    }
    this.attribute = CardViewAttribute.checkAttribute(this.attribute)

  }

  build() {
    Row() {
      Column() {
        //        Image($rawfile("img.png"))
        Row() {
          Row({ space: 10}) {
            Image($rawfile(this.attribute.icon))
              .height(50)
              .borderWidth(1)
              .borderStyle(BorderStyle.Solid)
              .borderColor("#ffc3c3c3")
              .borderRadius(5)
              .alignSelf(ItemAlign.Center)
            Column({ space: 5 }) {
              Text(this.attribute.name)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              //                              .textAlign(TextAlign.Start)
              //                Text("发表于 2022-7-14 10:53")
              //                .fontSize(16)
              Row() {
                Text("发表于  ")
                  .fontSize(16)
                Text(""+new Date().getFullYear()+"-"+(new Date().getMonth() + 1).toString()+"-"+new Date().getUTCDate().toString()+"  "+
                (new Date().getHours()+8).toString()+":"+new Date().getMinutes() )  //时间
                  .fontSize(15)
                  .baselineOffset(TextAlign.Start)
              }
            }.width("75%")

            //              .alignItems(ItemAlign.Start)
            .alignItems(HorizontalAlign.Start)
            .padding({bottom:15})
          }
          .padding({ left: 10, top: 15 })

        }.layoutWeight(1)

        Row() {
          Image($rawfile(this.attribute.CardImage))

          //            .objectFit(ImageFit.Contain)
        }.layoutWeight(5)
        .padding({ top: 15, bottom: 15 })

        Row() {
          Text("Like")
            .fontSize(18)
            .layoutWeight(3)
            .padding({ left: 20 })
          Text("Comment")
            .fontSize(18)
            .layoutWeight(3)
            .textAlign(TextAlign.End)
          //            .padding({left:20})
          Text("Read more")
            .fontSize(18)
            .layoutWeight(5)
            .textAlign(TextAlign.End)
            .padding({ right: 20 })

        }.layoutWeight(1)

      }
      .backgroundColor("#ffffffff")
      .width('100%')
      .borderWidth(2)
      .borderColor("#ffc3c3c3")
      .borderRadius(10)
      .borderStyle(BorderStyle.Solid)
      .shadow({
        radius:10,
        color:"#ffd6d4d4",
        offsetX:-10,
        offsetY:10
      })


    }
    .height(350)
    .margin(20)
  }
}