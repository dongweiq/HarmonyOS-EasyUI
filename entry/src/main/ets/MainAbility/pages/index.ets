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

//滑动验证测试组件导入
import { SwipePuzzle } from '../common/components/ui/SwipeCaptcha/swipePuzzle'
import { SimpleSwipe } from '../common/components/ui/SwipeCaptcha/simpleSwipe'
import { RotatePuzzle } from '../common/components/ui/SwipeCaptcha/rotatePuzzle'
import { ImageItem } from '../common/components/beans/ImageItem'

//图片窗帘组件导入
import {ImageCurtain} from "../common/components/ui/ImageCurtain"

//倒计时组件导入
import { CountDown } from "../common/components/util/CountDown"

//图片缩放组件导入
import { ImageZoom } from "../common/components/ui/ImageZoom"

//图片裁剪组件导入
import { ImageCrop } from "../common/components/ui/ImageCrop"

//日历组件导入
import {  CustomCalendar } from "../common/components/table/CustomCalendar"

//动画搜索框组件导入
import { SearchView } from "../common/components/ui/SearchView"

//图片按钮组件导入
import { ImageButton } from "../common/components/ui/ImageButton"
import prompt from '@ohos.prompt';

//蒙版引导视图组件引入
import { MaskGuideView } from "../common/components/ui/MaskGuideView"

//图片轮播组件导入
import { ImageSwiper } from "../common/components/ui/ImageSwiper"

//加载组件导入
//import { Loading } from "../components/ui/Loading"

//标签组件导入
import { LabelView } from "../common/components/ui/LabelView"


import { CardView } from "../common/components/ui/CardView"

@Entry
@Component
struct Index {

  //图片源
  @StorageLink("ImgList") ImgList: ImageItem[] = [];

  //日历组件对话框
  dialogController: CustomDialogController = new CustomDialogController({
    builder:  CustomCalendar({confirmSelectedDay:$selectedDay}),
    cancel:()=>{
      console.info('退出选择日期')
    },
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset:{dx:0,dy:-20}
  })

  @State selectedDay:string=''  // 点击选中的时间

  build() {
    Row() {
      Column() {


        //滑动验证码测试
//                Column() {
//                    //滑动验证子组件
//                    SimpleSwipe()
//                    //滑动拼图验证子组件
//                    SwipePuzzle()
//                    //旋转拼图验证子组件
//                    RotatePuzzle()
//                }
//                .onAppear(()=>{
//                  this.ImgList = [
//                    new ImageItem('SwipeCaptcha_test1.jpg'),
//                    new ImageItem('SwipeCaptcha_test2.jpg'),
//                    new ImageItem('SwipeCaptcha_test3.jpg'),
//                    new ImageItem('SwipeCaptcha_test4.jpg'),
//                    new ImageItem('SwipeCaptcha_test5.jpg'),
//                    new ImageItem('SwipeCaptcha_test6.jpg'),
//                    new ImageItem('SwipeCaptcha_test7.jpg'),
//                    new ImageItem('SwipeCaptcha_test8.jpg')
//                  ];
//                  console.log("【swipePuzzle】ImgList.length = " + this.ImgList.length);
//                })
        //测试成功

        //图片窗帘组件测试
        //        ImageCurtain()    //默认情况测试
        //        ImageCurtain({    //修改图片测试
        //          imgName:"imageCurtain_test1.jpg"
        //        })
        //测试成功

        //倒计时测试
        //          Column({space: 5}){
        //            CountDown();//倒计时组件
        //          }
        //          .margin(10)
        //          .width('95%')
        //          .backgroundColor("#ffe5c2c2")
        //测试成功
        //图片缩放组件测试
//                Column({space: 5}){
//                  ImageZoom();//引入imageZoom组件
//                }
//                .width('100%')
//                .height('100%')
//                .borderRadius(10)
//                .onAppear(() => {
//                  this.Img = new ImageItem("ImageZoom_dog.jpg");
//                })
        //测试成功

        //图片裁剪组件测试
//                Column({space: 5}){
//                  ImageCrop({
//                    img: new ImageItem("ImageCrop_dog.jpg")
//                  });//引入ImageCrop组件
//                }
//                .width('100%')
//                .height('100%')
//                .borderRadius(10)
        //测试成功

        //日历组件测试
//                Column() {
//                  Button('显示日历弹框')
//                    .onClick(() => {
//                      this.dialogController.open()
//                    }).backgroundColor(0x317aff)
//                  Text(this.selectedDay)
//                    .fontSize(30)
//                    .width('100%')
//                    .textAlign(TextAlign.Center)
//                }
//                .width('100%')
//                .margin({ top: 5 })
        //测试成功

        //动画搜索框组件测试
        //        SearchView();
        //测试成功

        //图片按钮组件测试
        //        ImageButton()//默认属性测试

        //        ImageButton({ //设置属性测试
        //          imageName:"ImageButton_test1.png", //添加图片
        //          buttonWidth:100,     //设置按钮
        //          buttonHeight:40,     //设置按钮高
        //          buttonRadius:20,     //设置按钮的角度
        //////          text:"点击下载",        //设置按钮的文本,默认为空
        ////          fontColor:"#ff86e5b4", //设置字体颜色
        ////          fontSize:16,           //设置字体大小
        //          clickListener:()=>{    //自定义点击事件监听方法
        //            prompt.showToast({
        //              message:"点击图像按钮",
        //              duration:1500
        //            })
        //          }
        //        })
        //测试成功

        //蒙版引导视图组件测试

//                MaskGuideView({//使用蒙版
//                  tipMessage: "第一步：点击此按钮，即可跳转到页面1中",//设置引导提示语
//                  selectAreaPositionX: 30,//设置高亮区域的x坐标
//                  selectAreaPositionY: 20,//设置高亮区域的y坐标
//                  selectAreaWidth: 80,//设置高亮区域宽度
//                  selectAreaHeight: 40,//设置高亮区域高度
//                })
//                Button("页面1")//演示蒙版使用
//                  .width(80)
//                  .height(40)
//                  .position({
//                    x: 30,
//                    y: 20
//                  })

        //测试成功

        //图片轮播组件测试
        //                ImageSwiper()
        //        测试成功

        //加载组件测试
        //        Loading()
        //测试失败，报错

        //LabelView组件测试
        //        //Button组件
        //        Stack(){
        //          Button("Button")
        //            .width(300)
        //            .height(60)
        //            .fontSize(25)
        //            .type(ButtonType.Normal)
        //
        //          LabelView({viewW: 300, viewH: 60, labelTitle: "HD", labelLoc: 1, distance: 20, labelW: 30})
        //
        //          Rect()
        //            .width(300)
        //            .height(60)
        //            .opacity(0)
        //            .onClick(() => {
        //              prompt.showToast({
        //                message: "click button", // 显示文本
        //                duration: 1500,              // 显示时长
        //                bottom: 800                  // 距离底部的距离
        //              })
        //            })
        //
        //        }
        //        .width("95%")
        //        .height(80)
        //        .margin({top: 20})
        //        .border({width: 5, color: Color.Gray, radius: 15})
        //        .backgroundColor(Color.White)
        //        .shadow({
        //          radius: 15,
        //          color: Color.Gray,
        //          offsetX: 15,
        //          offsetY: 15
        //        })
        //测试成功

//
//
//        CardView({
//          attribute:{
//            name: "aaa",
//            icon: "CardView_test1.png",
//            CardImage: "CardView_test1.png"
//          }
//        })


      }
    }
  }
}