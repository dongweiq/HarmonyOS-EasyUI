/*
 * Copyright (c) 2021 Institute of Software, Chinese Academy of Sciences.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Component
export struct SimpleSwipe{
  //组件宽高
  @State simpleWidth: number = 325;
  @State simpleHeight: number = 100;

  //滑轨宽度
  @State simpleRoadWidth: number = 280;

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

  // 自定义拖拽过程中显示的内容
  @Builder Builder() {
    Button({ type: ButtonType.Normal}) {
      Image($rawfile("SwipeCaptcha_swipeicon.png"))
        .width(20)
    }
    .visibility(Visibility.Hidden)
    .swipeBtn()
    .touchable(true)
    .position({
      x: this.simpleBlockPosLeft,//当该参数被修改时，滑块位置也动态修改
    })
    .zIndex(10)
  }

  build(){
    /*滑轨*/
    Stack({alignContent: Alignment.Center}){
        Row() {
          Column(){
            Stack({alignContent: Alignment.Start}){
              /*滑块*/
              Button({ type: ButtonType.Normal}) {
                Image($rawfile("SwipeCaptcha_swipeicon.png"))
                  .width(20)
              }
              .swipeBtn()
              .touchable(true)
              //事件1：滑动开始，需按住滑块170ms以上才能触发该事件。
              .onDragStart((event: DragEvent, extraParams: String) => {
                this.simpleStartTime = Date.now();//获取的当前时间会转换成距离某个时间有多少毫秒，即返回number类型
                //获取当前真实位置
                this.simpleStartRealXBias = event.getX();
                this.simpleStartRealYBias = event.getY();
                //控制台输出信息，方便调试
                console.log("【simpleSwipe】滑块初始真实位置：[" + this.simpleStartRealXBias + ", "+ this.simpleStartRealYBias + "] \t【simpleSwipe】 开始滑动时的时间：" + this.simpleStartTime);
                return this.Builder();
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
              Text("滑动完成验证")
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
          else if(curX >= this.simpleRoadWidth - this.simpleBlockWidth){
            this.simpleBlockPosLeft = this.simpleRoadWidth - this.simpleBlockWidth;
          }
          else{
            (curX - this.simpleStartRealXBias) > this.simpleRoadWidth - this.simpleBlockWidth ? this.simpleBlockPosLeft = this.simpleRoadWidth - this.simpleBlockWidth : this.simpleBlockPosLeft = (curX - this.simpleStartRealXBias);
          }
          if(this.simpleBlockPosLeft > this.simpleRoadWidth - this.simpleBlockWidth)
            this.simpleBlockPosLeft = this.simpleRoadWidth - this.simpleBlockWidth;
          console.log("【simpleSwipe】curX = " + curX + "\t simpleStartRealXBias = " + this.simpleStartRealXBias + "\t simpleBlockPosLeft = " + this.simpleBlockPosLeft)
        })
        //事件4：离开滑动区域
        .onDragLeave((event: DragEvent, extraParams: string) => {
          console.log("【simpleSwipe】Leave!")
          this.simpleBlockPosLeft = 0
        })
        //事件5：结束滑动
        .onDrop((event: DragEvent, extraParams: string) => {
          console.log("【simpleSwipe】Drop！")
          //获取滑动结束时间,以计算验证用时
          this.simpleEndTime = Date.now();

          //检查滑块位置进行验证并显示验证结果
          if(this.simpleBlockPosLeft >= (this.simpleRoadWidth - this.simpleBlockWidth) * this.simpleVerifyThreshold){
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
  .height(50)
  .borderRadius(5)
}

@Extend(Stack) function swipeStack(){
  .height('100')
  .width(320)
  .border({ width: 1, color: Color.Grey })
  .borderRadius(8)
  .shadow({ radius: 30, color: '#888888', offsetX: 10, offsetY: 10 })
}
