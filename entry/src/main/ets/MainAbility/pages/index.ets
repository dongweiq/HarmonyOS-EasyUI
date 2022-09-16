//滑动验证测试组件导入
import { swipePuzzle } from '../components/ui/SwipeCaptcha/swipePuzzle'
import { simpleSwipe } from '../components/ui/SwipeCaptcha/simpleSwipe'
import { rotatePuzzle } from '../components/ui/SwipeCaptcha/rotatePuzzle'
import { ImageItem } from '../components/beans/ImageItem'

//图片窗帘组件导入
import {ImageCurtain} from "../components/ui/ImageCurtain"

@Entry
@Component
struct Index {

  @StorageLink("ImgList") ImgList: ImageItem[] = [];

  build() {
    Row() {
      Column() {


        //滑动验证码测试
//        Column() {
//          simpleSwipe()
//          swipePuzzle()
//          rotatePuzzle()
//        }
//        .onAppear(()=>{
//          this.ImgList = [
//            new ImageItem('test1.jpg'),
//            new ImageItem('test2.jpg'),
//            new ImageItem('test3.jpg'),
//            new ImageItem('test4.jpg'),
//            new ImageItem('test5.jpg'),
//            new ImageItem('test6.jpg'),
//            new ImageItem('test7.jpg'),
//            new ImageItem('test8.jpg')
//          ];
//          console.log("【swipePuzzle】ImgList.length = " + this.ImgList.length);
//        })
        //测试成功

        //图片窗帘组件测试
//        imageCurtain()    //默认情况测试
//        imageCurtain({    //修改图片测试
//          imgName:"ImageCurtain_test1.jpg"
//        })
        //测试成功



      }
    }
  }
}