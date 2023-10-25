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


import picker from '@ohos.file.picker';

// @Entry
@Component
export struct Uploader {
  @State image: string[] = [""]
  private imgNumber: number = 1

  async example() {
    try {
      let PhotoSelectOptions = new picker.PhotoSelectOptions(); //图片选择器设置，设置选择的媒体文件类型，如图片视频
      PhotoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
      PhotoSelectOptions.maxSelectNumber = this.imgNumber;
      let photoPicker = new picker.PhotoViewPicker();
      photoPicker.select(PhotoSelectOptions).then((PhotoSelectResult) => {
        this.image = PhotoSelectResult.photoUris
        console.info("image=", this.image)
      }).catch((err) => {
        console.error('PhotoViewPicker.select failed with err: ' + err);
      });
    } catch (err) {
      console.error('PhotoViewPicker failed with err: ' + err);
    }
  }

  build() {
    Column() {
        Image($rawfile("Uploader_photograph.png"))
          .width(40)
          .height(40)
          .onClick(() => {
            console.log("test")
            this.example()
          })
      .alignSelf(ItemAlign.Start)
        Grid() {
          ForEach(this.image, item => {
            GridItem() {
              Image(item)
                .width(80)
                .height(80)
                .margin({right:10})
            }
          })
        }
    }
  }
}