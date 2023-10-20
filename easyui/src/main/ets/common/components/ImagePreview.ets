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
export struct ImagePreview {
  @State currentImageIndex:number = 1    //当前图片的索引值
  private showIndicators:boolean = false   //是否展示轮播指示器
  private showIndexPage:boolean = true         //是否展示页码
  private images:string[] = []             //传入的图片数组
  private isLoop:boolean = true            //是否循环播放图片
  private maxZoom:number = 3               //手势缩放的最大缩放比例
  private minZoom:number = 1/3             //手势缩放的最小缩放比例
  private startIndex = 1                  //指定起始索引的位置
  @State scaleX:number = 1            //图片X轴方向缩放大小
  @State scaleY:number = 1            //图片Y轴方向缩放大小
  @State isPinchGesture:boolean = false   //是否处于捏合状态
  @State imageZoomName:string = ""        //需要缩放的图片名
  private swiperController:SwiperController = new SwiperController()
  @Link showImagePreview:boolean
  private asyncClose:boolean = false          //是否启用异步关闭

  //图片放大缩小预览
  @Builder ImageZoom(image:string){
    Column(){
      Row(){
        Image($rawfile(image))
          .objectFit(ImageFit.Auto)
          .width("100%")
          .height("60%")
          .scale({ x: this.scaleX, y: this.scaleY })
          .gesture(
            GestureGroup(GestureMode.Parallel,
              PinchGesture()
                .onActionStart((event: GestureEvent) => {
                  if (event.scale > 1) {
                    this.scaleX = event.scale * 2 * this.scaleX
                    this.scaleY = event.scale * 2 * this.scaleY
                  }
                  if (event.scale < 1) {
                    this.scaleX = event.scale * 0.5 * this.scaleX
                    this.scaleY = event.scale * 0.5 * this.scaleY

                  }
                  if (this.scaleX >= this.maxZoom) {
                    this.scaleX = this.maxZoom
                    this.scaleY = this.maxZoom
                  }
                  if (this.scaleX <= this.minZoom) {
                    this.scaleX = this.minZoom
                    this.scaleY = this.minZoom
                  }
                  console.log("偏移捏合手势==："+ event.offsetX+ event.offsetX)
                }),
              SwipeGesture({ direction: SwipeDirection.Horizontal })
                .onAction((event: GestureEvent)=>{
                  this.isPinchGesture = false
                  this.swiperController.showNext()
                  console.log("偏移滑动手势："+ event.offsetX)
                })
            )
          )
        .animation({ duration: 300 })
      }.height("100%")
    }.width("100%")
    .backgroundColor("#ff000000")
  }

  build() {
    Stack() {
      Row() {
        Column() {
          Swiper(this.swiperController) {
            ForEach(this.images, (item, index) => {
              Image($rawfile(item))
                .objectFit(ImageFit.Auto)
                .width("100%")
                .gesture(
                  PinchGesture()
                    .onActionStart((event: GestureEvent) => {
                      this.isPinchGesture = true
                      this.imageZoomName = item
                      console.log("test+" + this.isPinchGesture + this.imageZoomName)
                    })
                )
            })
          }
          .height("60%")
          .indicator(this.showIndicators)
          .loop(this.isLoop)
          .index(this.startIndex - 1)
          .onChange((index: number) => {
            this.scaleX = 1
            this.scaleY = 1
            this.currentImageIndex = index + 1
          })
        }.width("100%")
      }
      .height("100%")
      .onAppear(() => {
        this.currentImageIndex = this.startIndex
      })

      if (this.isPinchGesture) {
        this.ImageZoom(this.imageZoomName)
      }

      if (this.showIndexPage) {
        Row() {
          Text(`${this.currentImageIndex}/${this.images.length}`)
            .fontColor(Color.White)
            .alignSelf(ItemAlign.Start)
            .fontSize(20)
            .margin({ top: 10 })
        }.height("100%")
      } else {
        Row() {
          Text(`第${this.currentImageIndex}页`)
            .fontColor(Color.White)
            .alignSelf(ItemAlign.Start)
            .fontSize(20)
            .margin({ top: 10 })
        }.height("100%")
      }
      //上部点击区域
      Rect()
        .width("100%")
        .height("20%")
        .alignSelf(ItemAlign.End)
        .position({
          x: 0, y: 0
        })
        .opacity(0)
        .onClick(() => {
          if (!this.asyncClose) {
            this.showImagePreview = false //关闭图片预览组件调用
          } else {
            setTimeout(() => {
              this.showImagePreview = false //关闭图片预览组件调用
            }, 500)
          }
        })
      //下部点击区域
      Rect()
        .width("100%")
        .height("20%")
        .alignSelf(ItemAlign.Start)
        .position({
          x: 0, y: 600
        })
        .onClick(() => {
          if (!this.asyncClose) {
            this.showImagePreview = false //关闭图片预览组件调用
          } else {
            setTimeout(() => {
              this.showImagePreview = false //关闭图片预览组件调用
            }, 500)
          }
        })
    }
    .height("100%")
    .width("100%")
    .backgroundColor("#ff000000")
  }
}