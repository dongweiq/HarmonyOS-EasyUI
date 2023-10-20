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
import display from '@ohos.display';
//蒙版引导视图组件
@Component
export struct MaskGuideView {
  @State message: string = 'Hello World'
  private setting: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting)
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting)
  @State touchable_MaskGuideView: boolean = false
  @State isShow: boolean = true
  private tipMessage: string = "点击此区域，可以进入会员中心界面哦!"
  private selectAreaPositionX: number = 125;
  private selectAreaPositionY: number = 100;
  private selectAreaWidth: number = 100;
  private selectAreaHeight: number = 50;
  @StorageLink("confirm") confirm:boolean = false
  @StorageLink("index") index:number = 1
  @State visible:Visibility = Visibility.Visible

  private screenWidth:number = 300
  private screenHeight:number = 630

  aboutToAppear(){
    if(this.screenWidth == 0 && this.screenHeight == 0){        //如果是在previewer中运行，设为固定值
      this.screenWidth = display.getDefaultDisplaySync().width   //获取设备屏幕宽度
      this.screenHeight = display.getDefaultDisplaySync().height  //获取设备屏幕高度
    }
  }

  build() {
    Stack() {
      Column() {

        if (this.isShow) {
          Canvas(this.context)
            .onReady(() => {
              this.context.globalAlpha = 0.6
              this.context.fillStyle = "#ff000000"
              this.context.fillRect(0, 0, this.screenWidth, this.screenHeight)
            })
            .touchable(this.touchable_MaskGuideView)
        }
      }
      Column() {

        if(this.isShow) {

          if (this.selectAreaPositionY>=0 && this.selectAreaPositionY <= this.screenHeight/2) {
            Text()
              .width(this.selectAreaWidth+2)
              .height(this.selectAreaHeight+2)
              .position({
                x:this.selectAreaPositionX-1,
                y:this.selectAreaPositionY-1
              })

              .borderStyle(BorderStyle.Solid)
              .borderWidth(2)
              .borderRadius(18)
              .borderColor("#ffffffff")
            Text(this.tipMessage)
              .width(180)
              .maxLines(3)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .textAlign(TextAlign.Center)
              .position({
                x: 60,
                y: this.selectAreaPositionY + this.selectAreaHeight + 20
              })
            Text("我知道啦")
              .width(100)
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .position({
                x: 100,
                y: this.selectAreaPositionY + this.selectAreaHeight + 80
              })
              .borderStyle(BorderStyle.Solid)
              .borderWidth(3)
              .borderRadius(25)
              .borderColor("#ffd1d7d6")
              .padding({ left: 10, right: 10, bottom: 5, top: 5 })
              .onClick(() => {
                this.isShow = false
                this.confirm = true
                this.index++
              })
          }
          if(this.selectAreaPositionY<=this.screenHeight && this.selectAreaPositionY > this.screenHeight/2){
            Text()
              .width(this.selectAreaWidth)
              .height(this.selectAreaHeight)
              .position({
                x:this.selectAreaPositionX,
                y:this.selectAreaPositionY
              })
              .borderStyle(BorderStyle.Solid)
              .borderWidth(2)
              .borderColor("#ff797373")
            Text(this.tipMessage)
              .width(180)
              .maxLines(3)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .textAlign(TextAlign.Center)
              .position({
                x: 60,
                y: this.selectAreaPositionY - 60
              })
            Text("我知道啦")
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .position({
                x: 100,
                y: this.selectAreaPositionY - 100
              })
              .borderStyle(BorderStyle.Solid)
              .borderWidth(3)
              .borderRadius(25)
              .borderColor("#ffd1d7d6")
              .padding({ left: 10, right: 10, bottom: 5, top: 5 })
              .onClick(() => {
                this.isShow = false
                this.confirm = true
                this.index++
              })
          }
        }
      }.width('100%')
      .height('100%')
    }
    .visibility(this.visible)
  }

}