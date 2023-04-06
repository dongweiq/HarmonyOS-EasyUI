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
import { ImageItem } from "../beans/ImageItem"
@Component
export struct ImageCrop{

  @State img: ImageItem = new ImageItem("");

  @State BoxVisibility: Visibility = Visibility.Hidden;
  @State FillVisibility: Visibility = Visibility.Visible;
  @State TextVisibility: Visibility = Visibility.Visible;

  //原图片 宽高
  @State ImgW: number = 350;
  @State ImgH: number = 350;


  //鼠标触摸开始的实际位置 X轴
  @State StartRealXBias: number = 0; //X轴
  //鼠标触摸开始的实际位置 Y轴
  @State StartRealYBias: number = 0; //Y轴

  //鼠标实时位置 X轴
  @State RealXBias: number = 0; //X轴
  //鼠标实时位置 Y轴
  @State RealYBias: number = 0; //Y轴

  //可变裁剪框实时宽高
  @State CropW: number = 0;
  @State CropH: number = 0;

  //可变裁剪框位置参数，作用：为了适配裁剪框反向选取
  @State CropX: number = 0;
  @State CropY: number = 0;

  //参数 ==> 裁剪后的图片自适应居中
  @State autoX: number = 0;
  @State autoY: number = 0;

  //裁剪路径
  @State CropPath: string = "M 0 0 L 0 0 Z";



  build(){

    Column(){
      Row(){
        Stack(){
          //原图片
          Image($rawfile(this.img.name))
            .width(this.ImgW)
            .height(this.ImgH)

          //可调节裁剪框
          Flex(){
            Rect()
              .width(this.ImgW)
              .height(this.ImgH)
              .opacity(0)
              .clip(new Path({
                commands: "M " + vp2px(this.CropX) + " " +vp2px(this.CropY) +
                          " L " + vp2px(this.RealXBias) + " " + vp2px(this.CropX) +
                          " L " + vp2px(this.RealXBias) + " " + vp2px(this.RealYBias) +
                          " L " + vp2px(this.CropX) + " "+ vp2px(this.RealYBias) + " Z"
              }))
          }
          .position({
            x: this.CropX,
            y: this.CropY
          })
          .border({
            width: 3,
            color: Color.White,
            style: BorderStyle.Dashed
          })
          .visibility(this.BoxVisibility)
          .width(this.CropW+5)
          .height(this.CropH+5)


          //上方填充方块
          Flex()
            .width(this.ImgW)
            .height(this.ImgH)
            .backgroundColor(Color.Black)
            .opacity(0.3)
            .clip(
              new Path({
                commands: "M 0 0" +
                          " L " + vp2px(this.ImgW) + " 0" +
                          " L " + vp2px(this.ImgW) + " " + vp2px(this.CropY) +
                          " L " + "0 "+ vp2px(this.CropY) + " Z"
              })
            )
            .visibility(this.FillVisibility)

          //左方填充方块
          Flex()
            .width(this.ImgW)
            .height(this.ImgH)
            .backgroundColor(Color.Black)
            .opacity(0.3)
            .clip(
              new Path({
                commands: "M 0 " +vp2px(this.CropY) +
                          " L " + vp2px(this.CropX - 5) + " " + vp2px(this.CropY) +
                          " L " + vp2px(this.CropX - 5) + " " + vp2px(this.ImgH) +
                          " L " + "0 "+ vp2px(this.ImgH) + " Z"
              })
            )
            .visibility(this.FillVisibility)

          //下方填充方块
          Flex()
            .width(this.ImgW)
            .height(this.ImgH)
            .backgroundColor(Color.Black)
            .opacity(0.3)
            .clip(
              new Path({
                commands: "M " + vp2px(this.CropX - 5) + " " +vp2px(this.CropY + this.CropH + 5) +
                          " L " + vp2px(this.CropX + this.CropW) + " " + vp2px(this.CropY + this.CropH + 5) +
                          " L " + vp2px(this.CropX + this.CropW) + " " + vp2px(this.ImgH) +
                          " L " + vp2px(this.CropX - 5) + " "+ vp2px(this.ImgH) + " Z"
              })
            )
            .visibility(this.FillVisibility)

          //右方填充方块
          Flex()
            .width(this.ImgW)
            .height(this.ImgH)
            .backgroundColor(Color.Black)
            .opacity(0.3)
            .clip(
              new Path({
                commands: "M " + vp2px(this.CropX + this.CropW) + " " +vp2px(this.CropY) +
                          " L " + vp2px(this.ImgW) + " " + vp2px(this.CropY) +
                          " L " + vp2px(this.ImgW) + " " + vp2px(this.ImgH) +
                          " L " + vp2px(this.CropX + this.CropW) + " "+ vp2px(this.ImgH) + " Z"
              })
            )
            .visibility(this.FillVisibility)

          Text("拖动选择裁剪区域")
            .fontSize(25)
            .fontColor(Color.White)
            .visibility(this.TextVisibility)



          //裁剪后的图片
          Image($rawfile(this.img.name))
            .width(this.ImgW)
            .height(this.ImgH)
            .onDragStart((event: DragEvent, extraParams: String) =>{
              this.TextVisibility = Visibility.Hidden;
              this.BoxVisibility = Visibility.Visible;

              this.StartRealXBias = event.getX();
              this.StartRealYBias = event.getY() - 35;

              console.log("【+" + this.StartRealXBias + ", " + this.StartRealYBias +"】, 开始移动......")

            })
            .clip(new Path({ commands: this.CropPath }))
            .position({
              x: this.autoX,
              y: this.autoY
            })

        }
        .height('100%')
        .width('100%')
      }
      .height(this.ImgH)
      .onDragMove((event: DragEvent, extraParams: String) => {
        console.log("asasasas")
        this.RealXBias = event.getX();
        this.RealYBias = event.getY() - 35;

        if(this.RealXBias - this.StartRealXBias < 0 && this.RealYBias - this.StartRealYBias < 0){
          this.CropX = this.RealXBias;
          this.CropY = this.RealYBias;
        }
        else if(this.RealXBias - this.StartRealXBias < 0){
          this.CropX = this.RealXBias;
          this.CropY = this.StartRealYBias;
        }
        else if(this.RealYBias - this.StartRealYBias < 0){
          this.CropX = this.StartRealXBias;
          this.CropY = this.RealYBias;
        }
        else{
          this.CropX = this.StartRealXBias;
          this.CropY = this.StartRealYBias;
        }

        this.CropW = Math.abs(this.RealXBias - this.StartRealXBias);
        this.CropH = Math.abs(this.RealYBias - this.StartRealYBias);
      })
      .onDrop((event: DragEvent, extraParams: String) => {
        this.CropW = Math.abs(this.RealXBias - this.StartRealXBias);
        this.CropH = Math.abs(this.RealYBias - this.StartRealYBias);
        console.log("CropW = " + this.CropW + "   CropH = " + this.CropH);
      })

      Row(){
        //裁剪按钮
        Button("Crop")
          .width(100)
          .height(50)
          .fontSize(25)
          .backgroundColor("#ff704949")
          .type(ButtonType.Capsule)
          .onClick(() => {
            //裁剪
            this.BoxVisibility = Visibility.Hidden;
            this.FillVisibility = Visibility.Hidden;
            this.CropPath = "M " + vp2px(this.StartRealXBias + 5) +" " + vp2px(this.StartRealYBias + 5) +
                            " L"  + vp2px(this.RealXBias) + " " + vp2px(this.StartRealYBias + 5) +
                            " L"  + vp2px(this.RealXBias) + " " + vp2px(this.RealYBias) +
                            " L"  + vp2px(this.StartRealXBias + 5) + " " + vp2px(this.RealYBias) + "Z";
            //裁剪后的图片自适应居中
            this.autoX = - ( this.CropX + this.CropW * 0.5 - this.ImgW * 0.5 );
            this.autoY = - ( this.CropY + this.CropH * 0.5 - this.ImgH * 0.5 ) + 400;
          })

      }
      .width('100%')
      .height('10%')
      .margin({top: 20})
      .justifyContent(FlexAlign.Center)

    }
    .height('95%')
    .width('100%')
    .margin({top: 30})

  }
}