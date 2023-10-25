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
export struct ImageSwiper {
  private controller: SwiperController = new SwiperController()
  @State play: boolean = true
  @State time: number = 0
  private imageNumber:number = 3
  private imageArray:Array<string> = ["ImageSwiper_test1.jpg","ImageSwiper_test2.jpg","ImageSwiper_test3.jpg"]

  build() {
    Column() {
      Row() {
        Swiper(this.controller) { //图片轮播，设置轮播效果
          //添加轮播图片
          Image($rawfile(this.imageArray[0])).objectFit(ImageFit.Contain)

          Image($rawfile(this.imageArray[1])).objectFit(ImageFit.Contain)

          Image($rawfile(this.imageArray[2])).objectFit(ImageFit.Contain)
        }
        .onTouch(() => { //手动切换轮播后，关闭自动轮播
          this.play = false

          //设置定时器，超过四秒没有触碰则从手动轮播变为自动轮播
          setTimeout(()=>{
            this.play = true
          },4000)
        })
        .autoPlay(this.play)
        .index(0) //设置轮播开始的图片
        .interval(4000) //轮播时间间隔  单位毫秒
        .indicator(true) //轮播指示条
        .loop(true) //是否循环轮播
        .duration(400) //图片切换时间  单位毫秒
        .vertical(false) //垂直轮播效果 默认为false
      }.height('50%')
      .padding(5)

      //设置控制按钮
      Row() {
        Button("上一张")
          .onClick((event) => {
            this.play = false
            this.controller.showPrevious()
            setTimeout(()=>{
              this.play = true
            },4000)
          })
        Button("下一张")
          .onClick(() => {
            this.play = false
            this.controller.showNext()
            setTimeout(()=>{
              this.play = true
            },4000)
          })
        .margin({left:50})
      }
    }.width('100%')
  }

}