
import { ImageItem } from '../../beans/ImageItem'
//import { MiniCanvas, Paint, ICanvas } from '@ohos/mini_canvas'

@Component
export struct RotatePuzzle{

  @StorageLink("ImgList") ImgList: ImageItem[] = [];

  //组件宽高
  @State swipeWidth: number = 325;
  @State swipeHeight: number = 100;

  //图片相关参数
  @State CurImgUrl_id: number = 1;//当前拼图图片id
  @State rotateImgWidth: number = 280;
  @State rotateImgHeight: number = 220;

  //滑块的动态位置
  @State rotateBlockPosLeft: number = 0;
  //滑块触摸开始的实际位置
  @State rotateStartRealXBias: number = 0;//X轴
  //滑块的宽度
  @State rotateBlockWidth: number = 50;
  //旋转块的参数
  @State rotateVerifieeRadius: number = 80;//旋转区域半径
  @State rotateStartAgl: number = 0;//记录初始角度
  @State rotateVerifieeAgl: number = 0;//验证区域顺时针旋转角度
  @State rotateMinAngle: number = 30;
  @State rotateMaxAngle: number = 330;

  //时间戳信息
  @State simpleStartTime: number = 0;
  @State simpleEndTime: number = 0;
  //偏差阈值，角度偏差在8度以内
  @State rotateVerifyThreshold: number = 8;
  //已经滑过区域的颜色
  @State simpleSlideColor: string = '#7798DD';
  //验证结果的可见性
  @State resultVisibility_true: Visibility = Visibility.Hidden;
  @State resultVisibility_false: Visibility = Visibility.Hidden;
  //提示文字的可见性
  @State simpleTextVisibility: Visibility = Visibility.Visible;

  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)

  build(){

    Stack({alignContent: Alignment.Center}){
      Column(){
        /*拼图区域*/
        Row(){
          Stack(){
            //拼图图片
            Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
              .height(220)
              .padding({bottom:4})
              .onAppear(() =>{
                let minAgl = this.rotateMinAngle;
                let maxAgl = this.rotateMaxAngle;
                this.rotateVerifieeAgl = Math.round(Math.random() * (maxAgl - minAgl) + minAgl);
                this.CurImgUrl_id = Math.round(Math.random() * (8 - 1) + 1);

                console.log("【rotatePuzzle】ImgList.length = " + this.ImgList.length);
                console.log("【rotatePuzzle】angel = " + this.rotateVerifieeAgl + "\tCurImgUrl_id = " + this.CurImgUrl_id);
              })


            //旋转区域
            Stack(){
              Image($rawfile(this.ImgList[this.CurImgUrl_id].name))
                .height(220)
                .width(280)
                .padding({bottom:4})
                .zIndex(1)
                .mask(
                  new Circle({width:this.rotateVerifieeRadius * 2, height:this.rotateVerifieeRadius * 2})
                    .offset({
                      x:this.rotateImgWidth * 0.5 -this.rotateVerifieeRadius,
                      y:this.rotateImgHeight * 0.5 -this.rotateVerifieeRadius
                    })
                    .fill(Color.White)
                )
            }
            .rotate({
              x: 0,
              y: 0,
              z: 5,
              angle: this.rotateVerifieeAgl,
            })

//            Flex()
//              .size({width: 2 * this.rotateVerifieeRadius, height: 2 * this.rotateVerifieeRadius})
//              .borderRadius(this.rotateVerifieeRadius)
//              .backgroundImage($rawfile(this.ImgList[this.CurImgUrl_id].name))
//              .backgroundImageSize(ImageSize.Cover)
//              .rotate({x: 0, y: 0, z: 5, angle: this.rotateVerifieeAgl, centerX: 80, centerY: 80})



            //验证结果
            Text('验证成功！用时' + (this.simpleEndTime - this.simpleStartTime) / 1000 + 's')
              .width(280)
              .fontSize(15)
              .fontColor(Color.White)
              .backgroundColor('#008000')
              .textAlign(TextAlign.Center)
              .visibility(this.resultVisibility_true)
              .position({
                y:0
              })

            Text('验证失败！')
              .width(280)
              .fontSize(15)
              .fontColor(Color.White)
              .backgroundColor('#FE0000')
              .textAlign(TextAlign.Center)
              .visibility(this.resultVisibility_false)
              .position({
                y:0
              })

            //刷新按钮
            Image($r("app.media.refreshicon"))
              .width(40)
              .height(40)
              .offset({
                x:120,
                y:90
              })
              .onClick(() => {
                this.CurImgUrl_id = Math.round(Math.random() * (8 - 1) + 1);
                let minAgl = this.rotateMinAngle;
                let maxAgl = this.rotateMaxAngle;
                this.rotateVerifieeAgl = Math.round(Math.random() * (maxAgl - minAgl) + minAgl);
              })
          }
        }
        .width(280)

        /*滑轨*/
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
                //获取的当前时间会转换成距离某个时间有多少毫秒，即返回number类型
                this.simpleStartTime = Date.now();
                //获取当前真实位置
                this.rotateStartRealXBias = event.getX();
                this.rotateStartAgl = this.rotateVerifieeAgl;
                //控制台输出，方便调试
                console.log("【rotatePuzzle】滑块初始真实位置：[" + this.rotateStartRealXBias + "]  开始滑动时的时间：" + this.simpleStartTime + "\trotateStartAgl = " +this.rotateStartAgl);
              })
              .position({//当该参数被修改时，滑块位置也动态修改
                x: this.rotateBlockPosLeft
              })
              //使滑块显示在最上层
              .zIndex(10)

              /*已经划过的区域*/
              Text()
                .height('50')
                .width(this.rotateBlockPosLeft + this.rotateBlockWidth / 2)
                .borderRadius(5)
                .backgroundColor(this.simpleSlideColor)
                .zIndex(5)

              /*滑轨提示文字*/
              Text('滑动完成验证')
                .swipeText()
                .visibility(this.simpleTextVisibility)

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
          console.log('【rotatePuzzle】onDragEnter');
        })
        //事件3：在滑动区域内滑动
        .onDragMove((event: DragEvent, extraParams: String) => {
          let curX = event.getX();
          console.log("【rotatePuzzle】Moving...")
          // 改变滑块位置且确保不越界
          if(curX <= this.rotateStartRealXBias ){
            this.rotateBlockPosLeft = 0;
            this.rotateVerifieeAgl = this.rotateStartAgl;
          }
          else if(curX >= 320){
            this.rotateBlockPosLeft = 320;
          }
          else{
            (curX - this.rotateStartRealXBias) > 320 ? this.rotateBlockPosLeft = 320 : this.rotateBlockPosLeft = (curX - this.rotateStartRealXBias);
            this.rotateVerifieeAgl = this.rotateStartAgl - 360 * (this.rotateBlockPosLeft / (this.rotateImgWidth - this.rotateBlockWidth))
          }
          console.log("【rotatePuzzle】 curX = " + curX + "\trotateStartRealXBias = " + this.rotateStartRealXBias + "\trotateBlockPosLeft = " + this.rotateBlockPosLeft + "\t rotateStartAgl = " +this.rotateStartAgl + "\trotateVerifieeAgl = " + this.rotateVerifieeAgl)
        })
        //事件4：离开滑动区域
        .onDragLeave((event: DragEvent, extraParams: string) => {
          this.rotateBlockPosLeft = 0
        })
        //事件5：结束滑动
        .onDrop((event: DragEvent, extraParams: string) => {
          //获取滑动结束时间,以计算验证用时
          this.simpleEndTime = Date.now();

          //检查滑块位置进行验证并显示验证结果
          if(this.rotateVerifieeAgl >= -this.rotateVerifyThreshold && this.rotateVerifieeAgl <= this.rotateVerifyThreshold){
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
            this.rotateBlockPosLeft = 0;

            let minAgl = this.rotateMinAngle;
            let maxAgl = this.rotateMaxAngle;
            this.rotateVerifieeAgl = Math.round(Math.random() * (maxAgl - minAgl) + minAgl);
            this.CurImgUrl_id = Math.round(Math.random() * (8 - 1) + 1)
            console.log("【rotatePuzzle】 angel = " + this.rotateVerifieeAgl + "\tCurImgUrl_id = " + this.CurImgUrl_id);
          }, 1500)
        })
      }

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
  .height(300)
  .width(320)
  .border({ width: 1, color: Color.Grey })
  .borderRadius(8)
  .shadow({ radius: 30, color: '#888888', offsetX: 10, offsetY: 10 })
}

@Extend(Text) function verifierStyle(){
  .backgroundColor("#292929")
  .border({width: 1})
  .borderColor("#ff000000")
}