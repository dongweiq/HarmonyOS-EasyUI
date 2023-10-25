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


/**
 * SwipeCell基础用法
 */
@Component
export struct SwipeCell_default{
  @State dragStart_x: number = 0;//滑动起始x轴位置坐标
  @State drag_x: number = 0;//滑动过程中实时x轴位置坐标
  @State distance: number = 0;//滑动的距离

  // 自定义拖拽过程中显示的内容
  @Builder Builder() {
    Text("aaa")
      .visibility(Visibility.Hidden)
  }

  build(){
    Row(){
      //左边选择
      Text("选择")
        .fontColor(Color.White)
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .width("100")
        .height("100%")
        .backgroundColor(Color.Red)
        .position({x: -100 + this.distance})
        .onClick(() => {
          this.distance = 0;
        })

      //单元格
      Stack(){
        Text("单元格")
          .fontSize(30)
          .position({x: "3%", y: "25%"})

        Text("内容")
          .fontSize(30)
          .opacity(0.6)
          .position({x: "85%", y: "25%"})
      }
      .backgroundColor(Color.White)
      .height("75")
      .width(480)
      .position({x: 0 + this.distance})
      .onDragStart((event: DragEvent) => {
        console.log("开始滑动。。。");
        this.dragStart_x = event.getX();
        return this.Builder();
      })

      //右边删除
      Text("删除")
        .fontColor(Color.White)
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .width("100")
        .height("100%")
        .backgroundColor(Color.Red)
        .position({x: 480 + this.distance})
        .onClick(() => {
          this.distance = 0;
        })
    }
    .onDragEnter(() => {
      console.log("进入滑动区域。。。");
    })
    .onDragMove((event: DragEvent) => {
      console.log("滑动中。。。");
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance > 100)
        this.distance = 100;
      if(this.distance < -100)
        this.distance = -100;

    })
    .onDragLeave((event: DragEvent) => {
      console.log("离开滑动区域。。。")
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance > 100)
        this.distance = 100;
      if(this.distance < -100)
        this.distance = -100;

    })
    .onDrop((event: DragEvent) => {
      console.log("结束滑动。。。")
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance >= 50)
        this.distance = 100;
      else if(this.distance > 0 && this.distance < 50){
        this.distance = 0;
      }

      if(this.distance <= -50)
        this.distance = -100;
      else if(this.distance < 0 && this.distance > -50){
        this.distance = 0;
      }
    })
    .width("100%")
    .height(75)
  }
}

/**
 * SwipeCell异步删除
 */
@Component
export struct SwipeCell_async{
  @State dragStart_x: number = 0;//滑动起始x轴位置坐标
  @State drag_x: number = 0;//滑动过程中实时x轴位置坐标
  @State distance: number = 0;//滑动的距离

  // 自定义拖拽过程中显示的内容
  @Builder Builder() {
    Text("aaa")
      .visibility(Visibility.Hidden)
  }

  build(){
    Row(){
      //左边选择
      Text("选择")
        .fontColor(Color.White)
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .width("100")
        .height("100%")
        .backgroundColor(Color.Red)
        .position({x: -100 + this.distance})
        .onClick(() => {
          this.distance = 0;
        })

      //单元格
      Stack(){
        Text("单元格")
          .fontSize(30)
          .position({x: "3%", y: "25%"})

        Text("内容")
          .fontSize(30)
          .opacity(0.6)
          .position({x: "85%", y: "25%"})
      }
      .backgroundColor(Color.White)
      .height("75")
      .width(480)
      .position({x: 0 + this.distance})
      .onDragStart((event: DragEvent) => {
        console.log("开始滑动。。。");
        this.dragStart_x = event.getX();
        return this.Builder();
      })

      //右边删除
      Text("删除")
        .fontColor(Color.White)
        .fontSize(30)
        .textAlign(TextAlign.Center)
        .width("100")
        .height("100%")
        .backgroundColor(Color.Red)
        .position({x: 480 + this.distance})
        .onClick(() => {
          AlertDialog.show(
            {
              message: '\n确定要删除么\n',
              autoCancel: false,
              primaryButton: {
                value: '取消',
                action: () => {
                  this.distance = 0;
                },
                fontColor:Color.Black
              },
              secondaryButton: {
                value: '确定',
                action: () => {
                this.distance = 0;
                }
              },
            })
        })
    }
    .onDragEnter(() => {
      console.log("进入滑动区域。。。");
    })
    .onDragMove((event: DragEvent) => {
      console.log("滑动中。。。");
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance > 100)
        this.distance = 100;
      if(this.distance < -100)
        this.distance = -100;

    })
    .onDragLeave((event: DragEvent) => {
      console.log("离开滑动区域。。。")
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance > 100)
        this.distance = 100;
      if(this.distance < -100)
        this.distance = -100;

    })
    .onDrop((event: DragEvent) => {
      console.log("结束滑动。。。")
      this.drag_x = event.getX();
      this.distance = this.drag_x - this.dragStart_x;

      if(this.distance >= 50)
        this.distance = 100;
      else if(this.distance > 0 && this.distance < 50){
        this.distance = 0;
      }

      if(this.distance <= -50)
        this.distance = -100;
      else if(this.distance < 0 && this.distance > -50){
        this.distance = 0;
      }
    })
    .width("100%")
    .height(75)
  }
}