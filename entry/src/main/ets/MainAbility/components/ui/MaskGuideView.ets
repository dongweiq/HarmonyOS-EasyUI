//蒙版引导视图组件
@Component
export struct MaskGuideView {
  @State message: string = 'Hello World'
  private setting: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting)
  private context1: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.setting)
  @State touchable: boolean = false
  @State isShow: boolean = true
  private tipMessage: string = "点击此区域，可以进入会员中心界面哦!"
  private selectAreaPositionX: number = 125;
  private selectAreaPositionY: number = 100;
  private selectAreaWidth: number = 100;
  private selectAreaHeight: number = 50;
  @StorageLink("confirm") confirm:boolean = false
  @StorageLink("index") index:number = 1
  @State visible:Visibility = Visibility.Visible


  build() {
    Stack() {
      Column() {

        if (this.isShow) {
          Canvas(this.context)
            .onReady(() => {
              this.context.globalAlpha = 0.6
              this.context.fillStyle = "#ff000000"
              this.context.fillRect(0, 0, 360, 780)
//              this.context.clearRect(this.selectAreaPositionX, this.selectAreaPositionY, this.selectAreaWidth, this.selectAreaHeight)//选中蒙版中想要提示的位置
            })
            .touchable(this.touchable)
        }
      }
      Column() {

        if(this.isShow) {

          if (this.selectAreaPositionY>=0 && this.selectAreaPositionY <= 580) {
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
                x: 90,
                y: this.selectAreaPositionY + this.selectAreaHeight + 20
              })
            Text("我知道啦")
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .position({
                x: 130,
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
          if(this.selectAreaPositionY<=780 && this.selectAreaPositionY > 580){
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
                x: 90,
                y: this.selectAreaPositionY - 60
              })
            Text("我知道啦")
              .fontSize(16)
              .fontColor("#ffd1d7d6")
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .position({
                x: 130,
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