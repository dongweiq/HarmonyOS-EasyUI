
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


@Component
export struct SearchView {
  @State isVisible:boolean=true
  @State flag:boolean=true
  @State inputWidth:string='5%'

  switchToInput(){
    this.isVisible=false
    animateTo({
      duration: 1300,
      tempo: 1,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {}
    }, () => {
      this.inputWidth='90%'
    })
    console.log('1'+this.isVisible)
  }
  switchToImage(){
    if(this.isVisible===false) {
      animateTo({
        duration: 1300,
        tempo: 1,
        iterations: 1,
        playMode: PlayMode.Normal,
        onFinish: () => {
        }
      }, () => {
        this.inputWidth = '0%'
      })
      setTimeout(() => {
        this.isVisible = true
      }, 1300)
      console.log('2')
    }
  }

  build() {
    Column() {
      Column() {
        Image($rawfile("SearchView_search.png"))
          .width(50)
          .height(50)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
          .onClick(() => this.switchToInput())
        TextInput({ placeholder: "search.." })
          .width(this.inputWidth)
          .backgroundColor(Color.White)
          .visibility(this.isVisible ? Visibility.Hidden : Visibility.Visible)
          .enterKeyType(EnterKeyType.Search)
      }
      .width('100%')
      .height(50)
      .backgroundColor('#33ff99')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .onClick(() => this.switchToImage())
  }
}