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
import { ImageCurtain } from '../common/components/ImageCurtain'
@Entry
@Component
struct TestImageCurtain {
  build() {
      Column() {
        ImageCurtain({ //修改图片测试
          imgName: "imageCurtain_test1.jpg",
          ImgHeight:740,  //窗帘图片高度
          ImgWidth:460,   //窗帘图片宽度
          ImgStartXBias:0, //窗帘图片起始位置x坐标
          ImgStartYBias:10  //窗帘图片起始位置y坐标
        })
      }
  }
}