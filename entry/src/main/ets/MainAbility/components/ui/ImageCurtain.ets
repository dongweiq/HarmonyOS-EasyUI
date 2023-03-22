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

//图片窗帘组件
@Component
export struct ImageCurtain{
//  private settings: RenderingContextSettings = new RenderingContextSettings(true)
//  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  //  private image:ImageBitmap = new Image('../common/images/snipper.png')
  //设置图片的宽高
  private ImgHeight: number = 600
  private ImgWidth: number = 340
  //图片的宽度随鼠标变化
  @State ImgRealWidth: number = 340

  //鼠标的坐标
  @State mouseXBias: number = 0
  @State mouseYBias: number = 0
  @State opacity: number = 0
  //图片的起始坐标
  private ImgStartXBias: number = 10
  private ImgStartYBias: number = 10
  private imgName: string = "ImageCurtain_sniper.png"

  build() {
    Stack() {
      Column() {
        Image($rawfile(this.imgName))
          .alt("https://img.bizhizu.com/up/dd/c9/46/ddc9462603f9ab7ecb44d88275aacb3c.jpg")
          .objectFit(ImageFit.Fill)
          .height(this.ImgHeight)
          .width(this.ImgRealWidth)
          .position({
            x: this.ImgStartXBias,
            y: this.ImgStartYBias
          })
            //利用裁剪模拟窗帘上下边缘卷曲效果
          .clip(new Path({
            commands: "M0 0 L" + vp2px(this.ImgRealWidth / 10) + " 0 " + "C" + vp2px(this.ImgRealWidth / 10) + " 0 " + vp2px(this.ImgRealWidth / 10 * 2) + " " +
            vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 3) + " 0 " + "L" + vp2px(this.ImgRealWidth / 10 * 3) + " 0 L" +
            vp2px(this.ImgRealWidth / 10 * 4) + " 0 C" + vp2px(this.ImgRealWidth / 10 * 4) + " 0 " + vp2px(this.ImgRealWidth / 10 * 5) + " " + vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " +
            vp2px(this.ImgRealWidth / 10 * 6) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 6) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 7) + " 0 C" + vp2px(this.ImgRealWidth / 10 * 7) + " 0 " +
            vp2px(this.ImgRealWidth / 10 * 8) + " " + vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 9) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 9) + " 0 L" +
            vp2px(this.ImgRealWidth) + " 0 L" + vp2px(this.ImgRealWidth) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 9) + " " + vp2px(this.ImgHeight) + " C" +
            vp2px(this.ImgRealWidth / 10 * 9) + " " + vp2px(this.ImgHeight) + " " + vp2px(this.ImgRealWidth / 10 * 8) + " " + vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " +
            vp2px(this.ImgRealWidth / 10 * 7) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 7) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 6) + " " +
            vp2px(this.ImgHeight) + " C" + vp2px(this.ImgRealWidth / 10 * 6) + " " + vp2px(this.ImgHeight) + " " + vp2px(this.ImgRealWidth / 10 * 5) + " " +
            vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 4) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 4) + " " +
            vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 3) + " " + vp2px(this.ImgHeight) + " C" + vp2px(this.ImgRealWidth / 10 * 3) + " " + vp2px(this.ImgHeight) + " " +
            vp2px(this.ImgRealWidth / 10 * 2) + " " + vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 1) + " " + vp2px(this.ImgHeight) + " L" +
            vp2px(this.ImgRealWidth / 10 * 1) + " " + vp2px(this.ImgHeight) + " L0" + " " + vp2px(this.ImgHeight) + " Z"
          }))
      }
      .width('100%')
      .height('100%')

      Column() {
        Row()
          .height(this.ImgHeight)
          .width(this.ImgRealWidth)
            //          .margin({ top: 10 })
            //拖拽回调，开始监听拖拽行为
            //          .onDragStart((event: DragEvent) => {
            //            console.info("dragstart")
            //          })
          .position({
            x: this.ImgStartXBias,
            y: this.ImgStartYBias
          })
            //遮罩的透明度 计算
          .opacity(this.opacity)
            //利用颜色渐变模拟窗帘折叠效果
          .linearGradient({
            angle: 90,
            direction: GradientDirection.Left,
            //            colors: [["#ff030303", 0.0], ["#ff7a7878", 0.1 * (this.time / 1)],["#ffffffff", 0.2], ["#ff030303", 0.3],
            //            ["#ff030303", 0.4],["#ff7a7878", (0.5 - 0.1 * (this.time / 1))],["#ffffffff", 0.6],["#ff7a7878", (0.7 - 0.1 * (this.time / 1))],
            //            ["#ffffffff", 0.0],["#ff7a7878", (0.8 - 0.1 * (this.time / 1))],["#ff000000", 1.0],]
            colors: [["#ff030303", 0.0], ["#ff7a7878", 0.11 * 0.5], ["#ffffffff", 0.22 * 0.5], ["#ff7a7878", 0.33 * 0.5],
            ["#ff030303", 0.44 * 0.5],
            ["#ff030303", 0.55 * 0.5], ["#ff7a7878", 0.66 * 0.5], ["#ffffffff", 0.77 * 0.5], ["#ff7a7878", 0.88 * 0.5],
            ["#ff000000", 1.0 * 0.5],
            ["#ff030303", 0.5], ["#ff7a7878", 0.11 * 0.5 + 0.5], ["#ffffffff", 0.22 * 0.5 + 0.5], ["#ff7a7878", 0.33 * 0.5 + 0.5],
            ["#ff030303", 0.44 * 0.5 + 0.5],
            ["#ff030303", 0.55 * 0.5 + 0.5], ["#ff7a7878", 0.66 * 0.5 + 0.5], ["#ffffffff", 0.77 * 0.5 + 0.5], ["#ff7a7878", 0.88 * 0.5 + 0.5],
            ["#ff000000", 1.0],
            ]
          })
            //利用裁剪给遮罩添加模拟窗帘上下边缘卷曲效果
          .clip(new Path({
            commands: "M0 0 L" + vp2px(this.ImgRealWidth / 10) + " 0 " + "C" + vp2px(this.ImgRealWidth / 10) + " 0 " + vp2px(this.ImgRealWidth / 10 * 2) + " " +
            vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 3) + " 0 " + "L" + vp2px(this.ImgRealWidth / 10 * 3) + " 0 L" +
            vp2px(this.ImgRealWidth / 10 * 4) + " 0 C" + vp2px(this.ImgRealWidth / 10 * 4) + " 0 " + vp2px(this.ImgRealWidth / 10 * 5) + " " + vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " +
            vp2px(this.ImgRealWidth / 10 * 6) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 6) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 7) + " 0 C" + vp2px(this.ImgRealWidth / 10 * 7) + " 0 " +
            vp2px(this.ImgRealWidth / 10 * 8) + " " + vp2px((1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 9) + " 0 L" + vp2px(this.ImgRealWidth / 10 * 9) + " 0 L" +
            vp2px(this.ImgRealWidth) + " 0 L" + vp2px(this.ImgRealWidth) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 9) + " " + vp2px(this.ImgHeight) + " C" +
            vp2px(this.ImgRealWidth / 10 * 9) + " " + vp2px(this.ImgHeight) + " " + vp2px(this.ImgRealWidth / 10 * 8) + " " + vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " +
            vp2px(this.ImgRealWidth / 10 * 7) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 7) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 6) + " " +
            vp2px(this.ImgHeight) + " C" + vp2px(this.ImgRealWidth / 10 * 6) + " " + vp2px(this.ImgHeight) + " " + vp2px(this.ImgRealWidth / 10 * 5) + " " +
            vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 4) + " " + vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 4) + " " +
            vp2px(this.ImgHeight) + " L" + vp2px(this.ImgRealWidth / 10 * 3) + " " + vp2px(this.ImgHeight) + " C" + vp2px(this.ImgRealWidth / 10 * 3) + " " + vp2px(this.ImgHeight) + " " +
            vp2px(this.ImgRealWidth / 10 * 2) + " " + vp2px(this.ImgHeight - (1 - this.ImgRealWidth / this.ImgWidth) * 40) + " " + vp2px(this.ImgRealWidth / 10 * 1) + " " + vp2px(this.ImgHeight) + " L" +
            vp2px(this.ImgRealWidth / 10 * 1) + " " + vp2px(this.ImgHeight) + " L0" + " " + vp2px(this.ImgHeight) + " Z"
          }))
      }
      .width('100%')
      .height('100%')

      if(this.ImgRealWidth >= 50) {
        Button() {
          Text("《")
            .fontSize(16-(1-this.ImgRealWidth/this.ImgWidth)*8)
            .fontColor("#ff28664c")
        }
        .width(20-(1-this.ImgRealWidth/this.ImgWidth)*5)
        .height(100)
        .backgroundColor("#ffbabec3")
        .borderWidth(1)
        .borderRadius(5)
        .borderColor("#ffc4bebe")
        .borderStyle(BorderStyle.Solid)
        .shadow({ radius: 5, color: "#ff9fd7bf" })
        .position({
          x: this.ImgRealWidth - 20 * (this.ImgRealWidth / this.ImgWidth) / 4,
          y: this.ImgHeight / 2 - 50
        })

        .onTouch((event: TouchEvent) => {
          //遮罩的透明度属性opacity 用一个公式模拟计算
          this.opacity = (1 - this.ImgRealWidth / this.ImgWidth) * (0.5 + this.ImgRealWidth / this.ImgWidth)
          //触摸判断
          if (event.type === TouchType.Down) {
          }
          if (event.type === TouchType.Up) {

          }
          if (event.type === TouchType.Move) {
            //将touch的坐标值赋给鼠标X变量
            this.mouseXBias = event.touches[0].screenX
            //如果坐标没有超过图片的左边，并且鼠标X值不超过屏幕右侧，才改变图片的宽度
            if (this.mouseXBias > this.ImgStartXBias + 10 && this.mouseXBias <= this.ImgWidth + this.ImgStartXBias) {
              //鼠标X位置减去坐标起始X位置为图片的宽度
              this.ImgRealWidth = this.mouseXBias - this.ImgStartXBias
            }
          }
        })
      }else {
        Button() {
          Text("》")
            .fontSize(10-(this.ImgRealWidth/this.ImgWidth)*16)
            .fontColor("#ff7a5a2c")
            .padding({ left: 6 })
        }
        .width(20-(1-this.ImgRealWidth/this.ImgWidth)*5)
        .height(100)
        .backgroundColor("#ffbabec3")
        .borderWidth(1)
        .borderRadius(5)
        .borderColor("#ffc4bebe")
        .borderStyle(BorderStyle.Solid)
        .shadow({ radius: 5, color: "#ff9fd7bf" })
        .position({
          x: this.ImgRealWidth - 20 * (this.ImgRealWidth / this.ImgWidth) / 4,
          y: this.ImgHeight / 2 - 50
        })

        .onTouch((event: TouchEvent) => {
          //遮罩的透明度属性opacity 用一个公式模拟计算
          this.opacity = (1 - this.ImgRealWidth / this.ImgWidth) * (0.5 + this.ImgRealWidth / this.ImgWidth)
          //触摸判断
          if (event.type === TouchType.Down) {
          }
          if (event.type === TouchType.Up) {
          }
          if (event.type === TouchType.Move) {
            //将touch的坐标值赋给鼠标X变量
            this.mouseXBias = event.touches[0].screenX
            //如果坐标没有超过图片的左边，并且鼠标X值不超过屏幕右侧，才改变图片的宽度
            if (this.mouseXBias > this.ImgStartXBias + 10 && this.mouseXBias <= this.ImgWidth + this.ImgStartXBias) {
              //鼠标X位置减去坐标起始X位置为图片的宽度
              this.ImgRealWidth = this.mouseXBias - this.ImgStartXBias
            }
          }
        })
      }
    }
  }
}
