import prompt from '@system.prompt';

@Component
export struct CountDown{

  // 时、分、秒
  @State hour: number = 0;
  @State min: number = 0;
  @State sec: number = 0;

  //用于控制当前倒计时开始和结束的参数
  @State intervalID: number = 0;

  build(){
    Column(){
      Row(){
        // 时
        Text(this.hour + "")
          .width(50)
          .height(50)
          .fontSize(25)
          .textAlign(TextAlign.Center)
          .border({
            width: 2,
            color: Color.Gray,
            radius: 6
          })
        Column(){
          Text('+')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .margin({bottom:1})
            .onClick(() => {
              ++this.hour;
            })

          Text('-')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .onClick(() => {
              --this.hour;
              if(this.hour < 0){
                this.hour = 0;
              }
            })
        }
        .margin(1)
        .border({
          width: 2,
          color: Color.Gray,
          radius: 6
        })

        Text("时")
          .height(50)
          .margin(5)
          .fontSize(20)

        // 分
        Text(this.min + "")
          .width(50)
          .height(50)
          .fontSize(25)
          .textAlign(TextAlign.Center)
          .border({
            width: 2,
            color: Color.Gray,
            radius: 6
          })


        Column(){
          Text('+')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .margin({bottom:1})
            .onClick(() => {
              ++this.min;
              if(this.min == 60){
                this.min = 0;
              }
            })

          Text('-')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .onClick(() => {
              --this.min;
              if(this.min < 0){
                this.min = 59;
              }
            })
        }
        .margin(1)
        .border({
          width: 2,
          color: Color.Gray,
          radius: 6
        })

        Text("分")
          .height(50)
          .margin(5)
          .fontSize(20)

        // 秒
        Text(this.sec + "")
          .width(50)
          .height(50)
          .fontSize(25)
          .textAlign(TextAlign.Center)
          .border({
            width: 2,
            color: Color.Gray,
            radius: 6
          })

        Column(){
          Text('+')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .margin({bottom:1})
            .onClick(() => {
              ++this.sec;
              if(this.sec == 60){
                this.sec = 0;
              }
            })

          Text('-')
            .width(20)
            .height(25)
            .fontSize(25)
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .backgroundColor(Color.Gray)
            .onClick(() => {
              --this.sec;
              if(this.sec < 0){
                this.sec = 59;
              }
            })
        }
        .margin(1)
        .border({
          width: 2,
          color: Color.Gray,
          radius: 6
        })

        Text("秒")
          .height(50)
          .margin(8)
          .fontSize(20)

      }
      .width('100%')
      .margin({ left: 25, top: 25})

      // 按钮
      Row(){
        Button("Start")
          .width(80)
          .height(40)
          .fontSize(20)
          .margin(10)
          .backgroundColor("#ff704949")
          .type(ButtonType.Capsule)
          .onClick(() => {
            console.log("【开始倒计时】")
            prompt.showToast({
              message: "开始倒计时", // 显示文本
              duration: 1500,              // 显示时长
              bottom: 800                  // 距离底部的距离
            })
            this.intervalID = setInterval(() => {
              if(this.sec > 0)
                --this.sec;
              else{
                if(this.min > 0){
                  --this.min;
                  this.sec = 59;
                }
                else{
                  if(this.hour > 0){
                    --this.hour;
                    this.min = 59;
                    this.sec = 59;
                  }
                  else{
                    clearInterval(this.intervalID)
                    prompt.showToast({
                      message: "倒计时结束", // 显示文本
                      duration: 1500,              // 显示时长
                      bottom: 800                  // 距离底部的距离
                    })
                  }
                }
              }
            }, 1000)
          })

        Button("Reset")
          .width(85)
          .height(40)
          .margin(10)
          .fontSize(20)
          .backgroundColor("#ff704949")
          .type(ButtonType.Capsule)
          .onClick(() => {
            console.log("【重置倒计时】")
            prompt.showToast({
              message: "已重置倒计时", // 显示文本
              duration: 1500,              // 显示时长
              bottom: 800                  // 距离底部的距离
            })
            this.hour = 0;
            this.min = 0;
            this.sec = 0;
          })


        Button("Stop")
          .width(80)
          .height(40)
          .margin(10)
          .fontSize(20)
          .backgroundColor("#ff704949")
          .type(ButtonType.Capsule)
          .onClick(() => {
            console.log("【停止倒计时】")
            prompt.showToast({
              message: "倒计时停止", // 显示文本
              duration: 1500,              // 显示时长
              bottom: 800                  // 距离底部的距离
            })
            clearInterval(this.intervalID)
          })

      }
      .width('100%')
      .margin({ left: 25, top: 25})

    }
    .width('100%')
    .height(200)
  }
}