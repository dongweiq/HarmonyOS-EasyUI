

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


import { ImageItem } from '../../beans/ImageItem'

@Component
export struct SwipePuzzle {
  @StorageLink("ImgList") ImgList: ImageItem[] = [];

  //
  aboutToAppear() {
    //    let xMin = this.verifierWidth + this.swipeCircleRadius + this.verifierWidth * this.borderPadding;
    //    let xMax = this.ImgWidth - this.verifierWidth - this.ImgWidth * this.borderPadding;
    //    let yMin = this.swipeCircleRadius + this.verifierHeight * this.borderPadding;
    //    let yMax = this.ImgHeight - this.verifierHeight - this.ImgHeight * this.borderPadding;
    //
    //    this.verifierXBias = Math.round(Math.random() * (xMax - xMin) + xMin);
    //    this.verifierYBias = Math.round(Math.random() * (yMax - yMin) + yMin);
    console.info("+++++++++++++++" + this.verifierXBias + "   " + this.verifierYBias)
  }

  /**
   * 组件宽高
   */
  @State swipeWidth: number = 325;
  @State swipeHeight: number = 100;

  /**
   * 图片相关参数
   */
  @State CurImgUrl_id: number = 1; //当前拼图图片id
  private ImgWidth: number = 280;
  private ImgHeight: number = 220;

  /**
   * 滑块的动态位置
   */
  @State verifierPosLeft: number = 0;
  /**
   * 滑块触摸开始的实际位置 X轴
   */
  @State StartRealXBias: number = 0; //X轴
  /**
   * 滑块触摸开始的实际位置 Y轴
   */
  @State StartRealYBias: number = 0; //Y轴

  //缺口宽高，滑块宽高与缺口宽高一致即可
  /**
   * 缺口宽高，滑块宽高与缺口宽高一致即可
   */
  private verifierWidth: number = 50;
  private verifierHeight: number = 50;
  /**
   * 缺口触摸开始的实际位置 X轴
   */
  @State verifierXBias: number = 0; //X轴
  /**
   * 缺口触摸开始的实际位置 Y轴
   */
  @State verifierYBias: number = 0; //Y轴
  /**
   * //上、右突出的半径
   */
  private swipeCircleRadius: number = 10; //
  /**
   * //边界20%的区域内不会生成缺口
   */
  private borderPadding: number = 0.2;
  /**
   * //时间戳信息
   */
  @State simpleStartTime: number = 0;
  @State simpleEndTime: number = 0;
  /**
   * //偏差阈值，10%以内通过
   */
  private VerifyThreshold: number = 0.1;
  /**
   * 已经滑过区域的颜色
   */
  private simpleSlideColor: string = '#7798DD';
  /**
   * 验证结果的可见性
   */
  @State resultVisibility_true: Visibility = Visibility.Hidden;
  @State resultVisibility_false: Visibility = Visibility.Hidden;
  /**
   * 提示文字的可见性
   */
  @State simpleTextVisibility: Visibility = Visibility.Visible;
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private img: ImageBitmap = null;

  build() {

    Stack({ alignContent: Alignment.Center }) {
      Column() {
        /*拼图区域*/
        Row() {
          Stack() {
            //拼图图片
            Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
              .height(220)
              .padding({ bottom: 4 })
              .onAppear(() => {
                /*随机生成缺口位置*/

                // 1.上下左右边框一定距离内不能生成缺口
                // 2.缺口不与滑块重叠，且不越界
                this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;
                this.CurImgUrl_id = Math.round(Math.random() * (8 - 1))
                this.img = new ImageBitmap("/common/images/" + this.ImgList[this.CurImgUrl_id].name);
                this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;

                let xMin = this.verifierWidth + this.swipeCircleRadius + this.verifierWidth * this.borderPadding;
                let xMax = this.ImgWidth - this.verifierWidth - this.ImgWidth * this.borderPadding;
                let yMin = this.swipeCircleRadius + this.verifierHeight * this.borderPadding;
                let yMax = this.ImgHeight - this.verifierHeight - this.ImgHeight * this.borderPadding;
                // x-y范围内的随机整数表示为Math.round(Math.random()*(y-x)+x)
                this.verifierXBias = Math.round(Math.random() * (xMax - xMin) + xMin);
                this.verifierYBias = Math.round(Math.random() * (yMax - yMin) + yMin);
                console.info("+++++++++++++++" + this.verifierXBias + "   " + this.verifierYBias)

                console.log("【swipePuzzle】当前图片文件名为：" + this.ImgList[this.CurImgUrl_id].name);

                console.log("【swipePuzzle】 ImgList.length = " + this.ImgList.length);
                console.log("【swipePuzzle】verifierXBias = " + this.verifierXBias + "\tverifierYBias = " + this.verifierYBias + "\tCurImgUrl_id = " + this.CurImgUrl_id);
              })

            Stack() {
              //缺口顶部
              Text()
                .borderRadius(this.swipeCircleRadius)
                .width(this.swipeCircleRadius * 2)
                .height(this.swipeCircleRadius * 2)
                .offset({
                  x: 0,
                  y: -0.5 * this.verifierWidth +4
                })
                .verifierStyle()

              //缺口右部
              Text()
                .borderRadius(this.swipeCircleRadius)
                .width(this.swipeCircleRadius * 2)
                .height(this.swipeCircleRadius * 2)
                .offset({
                  x: 0.5 * this.verifierWidth-4,
                  y: 0
                })
                .verifierStyle()

              //缺口方块
              Text()
                .width(this.verifierWidth)
                .height(this.verifierHeight)
                .borderRadius(2)
                .verifierStyle()
            }
            .width(this.verifierWidth)
            .height(this.verifierHeight)
            .position({
              x: this.verifierXBias,
              y: this.verifierYBias
            })

            Stack() {
              //拼图滑块顶部
//              Flex()
//                .backgroundImage($rawfile(this.ImgList[this.CurImgUrl_id].name), ImageRepeat.NoRepeat)
//                .width(2 * this.swipeCircleRadius)
//                .height(2 * this.swipeCircleRadius)
//                  //                .backgroundImagePosition(Alignment.Center)
//                .backgroundImageSize(ImageSize.Auto)
//                .borderRadius(this.swipeCircleRadius)
//                .offset({
//                  x: 0,
//                  y: -0.5 * this.verifierWidth
//                })
//                .backgroundImagePosition({
//                  x: -this.verifierXBias,
//                  y: -this.verifierYBias + 0.5 * this.swipeCircleRadius
//                })
//                .borderWidth(2)
//                .borderColor(Color.Blue)
              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
                .width(280)
                .height(220)
                  //              .clip(new Path({commands: "M"+vp2px(100)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(130)+" L"+vp2px(100)+" "+vp2px(130)+" Z"}))
                .clip(new Path({
                  commands: "M" + vp2px(this.verifierXBias+this.verifierWidth/2-this.swipeCircleRadius) + " " + vp2px(this.verifierYBias) + " S" + vp2px(this.verifierXBias + this.verifierWidth/2) + " " + vp2px(this.verifierYBias-this.swipeCircleRadius-5) + " " + vp2px(this.verifierXBias + this.verifierWidth/2+this.swipeCircleRadius) + " " + vp2px(this.verifierYBias) +" Z"
                }))
                .position({
                  x: -this.verifierXBias ,
                  y: -this.verifierYBias
                })

              //拼图滑块右部
//              Flex()
//                .backgroundImage($rawfile(this.ImgList[this.CurImgUrl_id].name), ImageRepeat.NoRepeat)
//                .width(2 * this.swipeCircleRadius)
//                .height(2 * this.swipeCircleRadius)
//                .backgroundImagePosition(Alignment.Center)
//                .backgroundImageSize(ImageSize.Auto)
//                .borderRadius(this.swipeCircleRadius)
//                .offset({
//                  x: 0.5 * this.verifierWidth,
//                  y: 0
//                })
//                .backgroundImagePosition({
//                  x: -this.verifierYBias - 0.5 * this.swipeCircleRadius,
//                  y: -this.verifierXBias
//                })


              //              Flex()
              //                .backgroundImage($rawfile(this.ImgList[this.CurImgUrl_id].name), ImageRepeat.NoRepeat)
//              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
//                //                .backgroundImageSize(ImageSize.Auto)
//                .width(this.verifierWidth)
//                .height(this.verifierHeight)
//                .clip(new Path({
//                  commands: "M" + vp2px(this.verifierXBias) + " " + vp2px(this.verifierYBias) + " L" + vp2px(this.verifierXBias + this.verifierWidth) + " " + vp2px(this.verifierYBias) + " L" + vp2px(this.verifierXBias + this.verifierWidth) + " " + vp2px(this.verifierYBias + this.verifierHeight) + " L" + vp2px(this.verifierXBias) + " " + vp2px(this.verifierYBias + this.verifierHeight) + " Z"
//                }))
//                  //                .clip()
//                .zIndex(10)

                  //                .backgroundImagePosition({
                  //                  x: -this.verifierXBias,
                  //                  y: -this.verifierYBias
                  //                })
//                .borderWidth(2)
//                .borderColor(Color.Yellow)
              //右半圆图片匹配
              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
                .width(280)
                .height(220)
                  //              .clip(new Path({commands: "M"+vp2px(100)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(130)+" L"+vp2px(100)+" "+vp2px(130)+" Z"}))
                .clip(new Path({
                  commands: "M" + vp2px(this.verifierXBias+this.verifierWidth) + " " + vp2px(this.verifierYBias+this.verifierHeight/2-this.swipeCircleRadius) + " S" + vp2px(this.verifierXBias + this.verifierWidth+this.swipeCircleRadius+5) + " " + vp2px(this.verifierYBias+this.verifierHeight/2) + " " + vp2px(this.verifierXBias + this.verifierWidth) + " " + vp2px(this.verifierYBias + this.verifierHeight/2+this.swipeCircleRadius) +" Z"
                }))
                .position({
                  x: -this.verifierXBias ,
                  y: -this.verifierYBias
                })
              //              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
              //                .width(300)
              //                .height(200)
              //                .clip(new Path({commands: "M"+vp2px(200)+" "+vp2px(80)+" L"+vp2px(250)+" "+vp2px(80)+" L"+vp2px(250)+" "+vp2px(130)+" L"+vp2px(200)+" "+vp2px(130)+" Z"}))
              //                .position({
              //                  x:0,
              //                  y:0
              //                })
              //                .borderWidth(2)
              //              .borderColor("#aabbcc")

              //              .zIndex(15)
              /**
               * 方块图片匹配
               */
              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
                .width(280)
                .height(220)
                  //              .clip(new Path({commands: "M"+vp2px(100)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(130)+" L"+vp2px(100)+" "+vp2px(130)+" Z"}))
                .clip(new Path({
                  commands: "M" + vp2px(this.verifierXBias-1) + " " + vp2px(this.verifierYBias+3) +
                  " L" + vp2px(this.verifierXBias + this.verifierWidth+1) + " " + vp2px(this.verifierYBias+3) +
                  " L" + vp2px(this.verifierXBias + this.verifierWidth+1) + " " + vp2px(this.verifierYBias + this.verifierHeight+3) +
                  " L" + vp2px(this.verifierXBias-1) + " " + vp2px(this.verifierYBias + this.verifierHeight+3) + " Z"
                }))
                .position({
                  x: -this.verifierXBias ,
                  y: -this.verifierYBias -3
                })
            }
            .width(this.verifierWidth)
            .height(this.verifierHeight)
            .position({
              x: this.verifierPosLeft,
              y: this.verifierYBias
            })
            //            .borderWidth(5)
            .borderColor(Color.Black)


            //            Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
            //              .width(280)
            //              .height(220)
            ////              .clip(new Path({commands: "M"+vp2px(100)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(80)+" L"+vp2px(150)+" "+vp2px(130)+" L"+vp2px(100)+" "+vp2px(130)+" Z"}))
            //              .clip(new Path({commands: "M"+vp2px(this.verifierXBias)+" "+vp2px(this.verifierYBias)+" L"+vp2px(this.verifierXBias+this.verifierWidth)+" "+vp2px(this.verifierYBias)+" L"+vp2px(this.verifierXBias+this.verifierWidth)+" "+vp2px(this.verifierYBias+this.verifierHeight)+" L"+vp2px(this.verifierXBias)+" "+vp2px(this.verifierYBias+this.verifierHeight)+" Z"}))
            //              .position({
            //                x:-this.verifierXBias+this.verifierPosLeft,
            //                y:0
            //              })
            //图像匹配测试
//            Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
//              .width(280)
//              .height(220)
//                //                            .clip(new Path({commands: "M"+vp2px(200)+" "+vp2px(80)+" L"+vp2px(250)+" "+vp2px(80)+" L"+vp2px(250)+" "+vp2px(130)+" L"+vp2px(200)+" "+vp2px(130)+" Z"}))
//              .position({
//                x: 0,
//                y: 0
//              })
//              .opacity(0.3)

            //验证结果
            Text('验证成功！用时' + (this.simpleEndTime - this.simpleStartTime) / 1000 + 's')
              .width(280)
              .fontSize(15)
              .fontColor(Color.White)
              .backgroundColor('#008000')
              .textAlign(TextAlign.Center)
              .visibility(this.resultVisibility_true)
              .position({
                y: 0
              })
            Text('验证失败！')
              .width(280)
              .fontSize(15)
              .fontColor(Color.White)
              .backgroundColor('#FE0000')
              .textAlign(TextAlign.Center)
              .visibility(this.resultVisibility_false)
              .position({
                y: 0
              })

            //刷新按钮
            Image($r("app.media.refreshicon"))
              .width(40)
              .height(40)
              .offset({
                x: 120,
                y: 90
              })
              .onClick(() => {
                //重新生成缺口
                this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;
                this.CurImgUrl_id = Math.round(Math.random() * (8 - 1))
                this.img = new ImageBitmap("/common/images/" + this.ImgList[this.CurImgUrl_id].name);
                console.log("=============【swipePuzzle】生成函数====")
                this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;

                let xMin = this.verifierWidth + this.swipeCircleRadius + this.verifierWidth * this.borderPadding;
                let xMax = this.ImgWidth - this.verifierWidth - this.ImgWidth * this.borderPadding;
                let yMin = this.swipeCircleRadius + this.verifierHeight * this.borderPadding;
                let yMax = this.ImgHeight - this.verifierHeight - this.ImgHeight * this.borderPadding;
                // x-y范围内的随机整数表示为Math.round(Math.random()*(y-x)+x)
                this.verifierXBias = Math.round(Math.random() * (xMax - xMin) + xMin);
                this.verifierYBias = Math.round(Math.random() * (yMax - yMin) + yMin);
                console.log("【swipePuzzle】verifierXBias = " + this.verifierXBias + "\tverifierYBias = " + this.verifierYBias + "\tCurImgUrl_id = " + this.CurImgUrl_id);
              })
          }
        }
        .width(280)

        /*滑轨*/
        Row() {
          Column() {
            Stack({ alignContent: Alignment.Start }) {

              /*滑块*/
              Button({ type: ButtonType.Normal }) {
                Image($r("app.media.swipeicon"))
                  .width(20)
              }
              .swipeBtn()
              .touchable(true)
              //事件1：滑动开始，需按住滑块170ms以上才能触发该事件。【**这个设定会导致滑块滑动边界不好控制，目前没有解决思路**】
              .onDragStart((event: DragEvent, extraParams: String) => {
                //获取的当前时间会转换成距离某个时间有多少毫秒，即返回number类型
                this.simpleStartTime = Date.now();
                //获取当前真实位置
                this.StartRealXBias = event.getX();
                this.StartRealYBias = event.getY();
                //控制台输出，方便调试
                console.log("【swipePuzzle】滑块初始真实位置：[" + this.StartRealXBias + ", " + this.StartRealYBias + "] \t开始滑动时的时间：" + this.simpleStartTime);
              })
              .position({ //当该参数被修改时，滑块位置也动态修改
                x: this.verifierPosLeft
              })
              //使滑块显示在最上层
              .zIndex(10)

              /*已经划过的区域*/
              Text()
                .height('50')
                .width(this.verifierPosLeft + this.verifierWidth / 2)
                .borderRadius(5)
                .backgroundColor(this.simpleSlideColor)
                .zIndex(5)

              /*滑轨提示文字*/
              Text($r("app.string.SwipeTxt"))
                .swipeText()
                .visibility(this.simpleTextVisibility)

              //验证结果
              Text('验证成功,用时' + (this.simpleEndTime - this.simpleStartTime) / 1000 + 's')
                .swipeText()
                .fontColor(Color.White)
                .zIndex(6)
                .visibility(this.resultVisibility_true)
              Text('验证失败！')
                .swipeText()
                .fontColor(Color.White)
                .visibility(this.resultVisibility_false)
                .zIndex(6)

            }
            .width(280) //滑轨宽度
          }
          .width("100%")
        }
        .swipeRoad()
        //事件2：进入滑动区域
        .onDragEnter((event: DragEvent, extraParams: string) => {
          console.log('【swipePuzzle】onDragEnter');
        })
        //事件3：在滑动区域内滑动
        .onDragMove((event: DragEvent, extraParams: String) => {
          let curX = event.getX();
          console.log("【swipePuzzle】Moving...")
          // 改变滑块位置且确保不越界
          if (curX <= this.StartRealXBias) {
            this.verifierPosLeft = 0;
          }
          else if (curX >= 320) {
            this.verifierPosLeft = 320;
          }
          else {
              (curX - this.StartRealXBias) > 320 ? this.verifierPosLeft = 320 : this.verifierPosLeft = (curX - this.StartRealXBias);
          }
          console.log("【swipePuzzle】curX = " + curX + "\tStartRealXBias = " + this.StartRealXBias + "\tverifierPosLeft = " + this.verifierPosLeft)
        })
        //事件4：离开滑动区域
        .onDragLeave((event: DragEvent, extraParams: string) => {
          this.verifierPosLeft = 0
        })
        //事件5：结束滑动
        .onDrop((event: DragEvent, extraParams: string) => {
          //获取滑动结束时间,以计算验证用时
          this.simpleEndTime = Date.now();

          //检查滑块位置进行验证并显示验证结果
          if (this.verifierPosLeft >= this.verifierXBias - this.verifierXBias * this.VerifyThreshold &&
          this.verifierPosLeft <= this.verifierXBias + this.verifierXBias * this.VerifyThreshold) {
            //验证成功
            this.simpleSlideColor = '#008000';
            this.simpleTextVisibility = Visibility.Hidden;
            this.resultVisibility_true = Visibility.Visible;
          }
          else {
            //验证失败
            this.simpleSlideColor = '#fe0000';
            this.simpleTextVisibility = Visibility.Hidden;
            this.resultVisibility_false = Visibility.Visible;
          }

          //重置页面
          setTimeout(() => {
            this.simpleSlideColor = '#7798DD'
            this.simpleTextVisibility = Visibility.Visible;
            this.resultVisibility_false = Visibility.Hidden;
            this.resultVisibility_true = Visibility.Hidden;
            this.verifierPosLeft = 0;

            // 上下左右边框一定距离内不能生成缺口
            // 缺口不与滑块重叠，且不越界

            this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;
            this.CurImgUrl_id = Math.round(Math.random() * (8 - 1) + 1)
            this.img = new ImageBitmap("/common/images/" + this.ImgList[this.CurImgUrl_id].name);
            console.log("=============【swipePuzzle】生成函数====")
            this.swipeCircleRadius = this.swipeCircleRadius * this.verifierWidth / 50;

            let xMin = this.verifierWidth + this.swipeCircleRadius + this.verifierWidth * this.borderPadding;
            let xMax = this.ImgWidth - this.verifierWidth - this.ImgWidth * this.borderPadding;
            let yMin = this.swipeCircleRadius + this.verifierHeight * this.borderPadding;
            let yMax = this.ImgHeight - this.verifierHeight - this.ImgHeight * this.borderPadding;
            // x-y范围内的随机整数表示为Math.round(Math.random()*(y-x)+x)
            this.verifierXBias = Math.round(Math.random() * (xMax - xMin) + xMin);
            this.verifierYBias = Math.round(Math.random() * (yMax - yMin) + yMin);
            console.log("【swipePuzzle】 verifierXBias = " + this.verifierXBias + "\tverifierYBias = " + this.verifierYBias + "\tCurImgUrl_id = " + this.CurImgUrl_id);


          }, 1500)
        })
      }

    }
    .swipeStack()
  }
}

//使用@Extend装饰器，可简化代码，方便组件样式的复用
@Extend(Row) function swipeRoad () { //滑轨 样式
  .height('50')
  .width(280)
  .borderRadius(5)
  .border({ width: 1, color: Color.Blue })
}

@Extend(Text) function swipeText () { //滑轨提示文字 样式
  .width("100%")
  .height(50)
  .fontSize(20)
  .textAlign(TextAlign.Center)
}

@Extend(Button) function swipeBtn () { //滑块 样式
  .width(50)
  .height('100%')
  .borderRadius(5)
}

@Extend(Stack) function swipeStack () {
  .height(300)
  .width(320)
  .border({ width: 1, color: Color.Grey })
  .borderRadius(8)
  .shadow({ radius: 30, color: '#888888', offsetX: 10, offsetY: 10 })
}

@Extend(Text) function verifierStyle () { //缺口样式
  .backgroundColor("#292929")
  .border({ width: 1 })
  .borderColor("#ff000000")
}