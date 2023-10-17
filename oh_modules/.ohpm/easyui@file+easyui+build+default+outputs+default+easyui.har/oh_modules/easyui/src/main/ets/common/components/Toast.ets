
// @ts-ignore
import lottie from '@ohos/lottie'

/**
 * Toast文字提示
 */
@Component
export struct Toast_default{
  @Link content: string;
  @Link comp_visibility: Visibility;
  build(){
    Row(){
      Text(this.content)
        .fontColor(Color.White)
        .fontSize(20)
        .lineHeight(20)
        .textAlign(TextAlign.Start)
        .margin(10)
    }
    .align(Alignment.Center)
    .borderRadius(10)
    .width(200)
    .height(80)
    .backgroundColor(Color.Black)
    .opacity(0.7)
    .visibility(this.comp_visibility)
    .onAppear(() => {
      setInterval(() => {
        this.comp_visibility = Visibility.Hidden;
      }, 3000)
    })
  }
}


/**
 * Toast加载提示
 */
@Component
export struct Toast_loading {
  @Link content: string;
  @Link comp_visibility: Visibility;

  private mainRenderingSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private mainCanvasRenderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.mainRenderingSettings)

  private animateName: string = "loading"
  private animatePath: string = "common/data/loading.json"

  onPageHide(): void {
    console.log('onPageHide')
    lottie.destroy()
  }

  build(){
    Column(){
      Column() {
        Canvas(this.mainCanvasRenderingContext)
          .width("60%")
          .height("60%")


        Text("  ")
          .fontSize(30)
          .onAppear(() => {
            setTimeout(() => {
              lottie.loadAnimation({
                container: this.mainCanvasRenderingContext,
                renderer: 'canvas', // canvas 渲染模式
                loop: true,
                autoplay: true,
                name: this.animateName,
                path: this.animatePath, // 路径加载动画只支持entry/src/main/ets 文件夹下的相对路径
              })
            }, 50)
          })

        Text(this.content)
          .fontColor(Color.White)
          .fontSize(20)
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .margin(10)
      }
      .width("40%")
      .height("25%")
      .borderRadius(10)
      .margin({top: "60%"})
      .backgroundColor("#ff4f4e4e")
    }
    .align(Alignment.Center)
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Black)
    .opacity(0.6)
    .visibility(this.comp_visibility)
    .position({y: "-0%"})
    .onAppear(() => {
      setInterval(() => {
        this.comp_visibility = Visibility.Hidden;
      }, 5000)
    })
  }
}


/**
 * Toast成功/失败提示
 */
@Component
export struct Toast_successOrFailed {
  @Link content: string;
  @Link comp_visibility: Visibility;

  @State imgURL: string = "Toast_success.png";

  build(){
    Column(){
      Column() {
        Image($rawfile(this.imgURL))
          .width("50%")
          .margin({top: "10%"})


        Text(this.content)
          .fontColor(Color.White)
          .fontSize(20)
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .margin(10)
      }
      .width("40%")
      .height("25%")
      .borderRadius(10)
      .margin({top: "60%"})
      .backgroundColor("#ff4f4e4e")
    }
    .align(Alignment.Center)
    .width("100%")
    .height("100%")
    .visibility(this.comp_visibility)
    .position({y: "-0%"})
    .onAppear(() => {
      setInterval(() => {
        this.comp_visibility = Visibility.Hidden;
      }, 3000)
    })
  }
}



/**
 * Toast高级用法
 */
@Component
export struct Toast_advance {
  @Link comp_visibility: Visibility;

  @State cur_countDown: number = 5;
  private mainRenderingSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private mainCanvasRenderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.mainRenderingSettings)

  private animateName: string = "loading"
  private animatePath: string = "common/data/loading.json"

  onPageHide(): void {
    console.log('onPageHide')
    lottie.destroy()
  }

  build(){
    Column(){
      Column() {
        Canvas(this.mainCanvasRenderingContext)
          .width("60%")
          .height("60%")

        Text(" ")
          .fontSize(30)
          .onAppear(() => {
            setTimeout(() => {
              lottie.loadAnimation({
                container: this.mainCanvasRenderingContext,
                renderer: 'canvas', // canvas 渲染模式
                loop: true,
                autoplay: true,
                name: this.animateName,
                path: this.animatePath, // 路径加载动画只支持entry/src/main/ets 文件夹下的相对路径
              })
            }, 50)
          })

        Text("倒计时" + this.cur_countDown + "秒")
          .fontColor(Color.White)
          .fontSize(20)
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .margin(10)
          .onAppear(()=>{
            var instance = setInterval(()=>{
              if(this.comp_visibility == Visibility.Visible) {
                this.cur_countDown = 5;
                return;
              }
              else {
                this.cur_countDown = 0;
              }
            }, 500)

            if(this.cur_countDown == 5){
              clearInterval(instance);
              setInterval(()=>{
                if(this.cur_countDown > 0)
                  this.cur_countDown--;
                else {
                  this.comp_visibility = Visibility.Hidden;
                  this.cur_countDown = 5;
                }
              }, 1000)
            }


          })
      }
      .width("40%")
      .height("25%")
      .borderRadius(10)
      .margin({top: "60%"})
      .backgroundColor("#ff4f4e4e")
    }
    .align(Alignment.Center)
    .width("100%")
    .height("100%")
    .visibility(this.comp_visibility)
    .position({y: "-0%"})
  }
}
