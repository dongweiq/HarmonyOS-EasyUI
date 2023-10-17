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
import { SwipePuzzle } from 'easyui'
import { SimpleSwipe } from 'easyui'
import { RotatePuzzle } from 'easyui'
import { ImageItem } from 'easyui'
@Entry
@Component
struct TestSwipeCaptcha {
  //图片源
  @StorageLink("ImgList") ImgList: ImageItem[] = [];
  build() {
    Row(){
      Column() {
        SimpleSwipe()
        SwipePuzzle()
        RotatePuzzle()
      }
    }
    .onAppear(() => {
      this.ImgList = [
        new ImageItem('SwipeCaptcha_test1.jpg'),
        new ImageItem('SwipeCaptcha_test2.jpg'),
        new ImageItem('SwipeCaptcha_test3.jpg'),
        new ImageItem('SwipeCaptcha_test4.jpg'),
        new ImageItem('SwipeCaptcha_test5.jpg'),
        new ImageItem('SwipeCaptcha_test6.jpg'),
        new ImageItem('SwipeCaptcha_test7.jpg'),
        new ImageItem('SwipeCaptcha_test8.jpg')
      ];
      console.log("【swipePuzzle】ImgList.length = " + this.ImgList.length);
    })
  }
}