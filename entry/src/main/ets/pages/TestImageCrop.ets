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
import { ImageItem } from '../common/components/beans/ImageItem';
import { ImageCrop } from "../common/components/ImageCrop"
@Entry
@Component
struct TestImageCrop {

  @StorageLink("Img") Img: ImageItem = new ImageItem("")

  build() {
    Column({ space: 5 }) {
      ImageCrop({
        img : new ImageItem('ImageCrop_dog.jpg')
      }); //引入ImageCrop组件
    }
    .width('100%')
    .height('100%')
    .borderRadius(18)
  }
}