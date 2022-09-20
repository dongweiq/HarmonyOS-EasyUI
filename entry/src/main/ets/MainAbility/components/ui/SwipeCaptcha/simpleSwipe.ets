
@Component
export struct SimpleSwipe{
  //组件宽高
  @State simpleWidth: number = 325;
  @State simpleHeight: number = 100;

  //滑块的动态位置
  @State simpleBlockPosLeft: number = 0;

  //触摸开始的实际位置
  @State simpleStartRealXBias: number = 0;//X轴
  @State simpleStartRealYBias: number = 0;//Y轴

  //滑块宽高
  @State simpleBlockWidth: number = 50;
  @State simpleBlockHeight: number = 50;

  //时间戳信息
  @State simpleStartTime: number = 0;
  @State simpleEndTime: number = 0;

  //偏差阈值，进度超过80%通过
  @State simpleVerifyThreshold: number = 0.8;

  //已经滑过区域的颜色
  @State simpleSlideColor: string = '#7798DD';

  //验证结果的可见性
  @State resultVisibility_true: Visibility = Visibility.Hidden;
  @State resultVisibility_false: Visibility = Visibility.Hidden;

  //提示文字的可见性
  @State simpleTextVisibility: Visibility = Visibility.Visible;

  build(){
    /*滑轨*/
    Stack({alignContent: Alignment.Center}){
        Row() {
          Column(){
            Stack({alignContent: Alignment.Start}){
              /*滑块*/
              Button({ type: ButtonType.Normal}) {
                Image($r("app.media.swipeicon"))
                  .width(20)
              }
              .swipeBtn()
              .touchable(true)
              //事件1：滑动开始，需按住滑块170ms以上才能触发该事件。【**这个设定会导致滑块滑动边界不好控制，目前没有解决思路**】
              .onDragStart((event: DragEvent, extraParams: String) => {
                this.simpleStartTime = Date.now();//获取的当前时间会转换成距离某个时间有多少毫秒，即返回number类型
                //获取当前真实位置
                this.simpleStartRealXBias = event.getX();
                this.simpleStartRealYBias = event.getY();
                //控制台输出信息，方便调试
                console.log("【simpleSwipe】滑块初始真实位置：[" + this.simpleStartRealXBias + ", "+ this.simpleStartRealYBias + "] \t【simpleSwipe】 开始滑动时的时间：" + this.simpleStartTime);
              })
              .position({
                x: this.simpleBlockPosLeft,//当该参数被修改时，滑块位置也动态修改
              })
              .zIndex(10)//使滑块显示在最上层

              /*已经划过的区域*/
              Text()
                .height('50')
                .width(this.simpleBlockPosLeft + this.simpleBlockWidth / 2)
                .borderRadius(5)
                .backgroundColor(this.simpleSlideColor)
                .zIndex(5)

              /*滑轨提示文字*/
              Text($r("app.string.SwipeTxt"))
                .swipeText()
                .visibility(this.simpleTextVisibility)

              //验证结果
              Text('验证成功,用时'+ (this.simpleEndTime - this.simpleStartTime) / 1000 +'s')
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
            .width(280)//滑轨宽度
          }
          .width("100%")
        }
        .swipeRoad()
        //事件2：进入滑动区域
        .onDragEnter((event: DragEvent, extraParams: string) => {
          console.log('【simpleSwipe】onDragEnter');
        })
        //事件3：在滑动区域内滑动
        .onDragMove((event: DragEvent, extraParams: String) => {
          let curX = event.getX();
          console.log("【simpleSwipe】Moving...")
          // 改变滑块位置且确保不越界
          if(curX <= this.simpleStartRealXBias ){
            this.simpleBlockPosLeft = 0;
          }
          else if(curX >= 320){
            this.simpleBlockPosLeft = 320;
          }
          else{
            (curX - this.simpleStartRealXBias) > 320 ? this.simpleBlockPosLeft = 320 : this.simpleBlockPosLeft = (curX - this.simpleStartRealXBias);
          }
          console.log("【simpleSwipe】curX = " + curX + "\t simpleStartRealXBias = " + this.simpleStartRealXBias + "\t simpleBlockPosLeft = " + this.simpleBlockPosLeft)
        })
        //事件4：离开滑动区域
        .onDragLeave((event: DragEvent, extraParams: string) => {
          this.simpleBlockPosLeft = 0
        })
        //事件5：结束滑动
        .onDrop((event: DragEvent, extraParams: string) => {
          //获取滑动结束时间,以计算验证用时
          this.simpleEndTime = Date.now();

          //检查滑块位置进行验证并显示验证结果
          if(this.simpleBlockPosLeft >= (this.simpleWidth - this.simpleBlockWidth) * this.simpleVerifyThreshold){
            //验证成功
            this.simpleSlideColor = '#008000';
            this.simpleTextVisibility = Visibility.Hidden;
            this.resultVisibility_true = Visibility.Visible;
          }
          else{
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
            this.simpleBlockPosLeft = 0;
          }, 1500)
        })

      }
      .swipeStack()
  }
}

//使用@Extend装饰器，可简化代码，方便组件样式的复用

@Extend(Row) function swipeRoad(){//滑轨 样式
  .height('50')
  .width(280)
  .borderRadius(5)
  .border({ width: 1, color: Color.Blue })
}

@Extend(Text) function swipeText(){//滑轨提示文字 样式
  .width("100%")
  .height(50)
  .fontSize(20)
  .textAlign(TextAlign.Center)
}

@Extend(Button) function swipeBtn(){//滑块 样式
  .width(50)
  .height('100%')
  .borderRadius(5)
}

@Extend(Stack) function swipeStack(){
  .height('100')
  .width(320)
  .border({ width: 1, color: Color.Grey })
  .borderRadius(8)
  .shadow({ radius: 30, color: '#888888', offsetX: 10, offsetY: 10 })
}
