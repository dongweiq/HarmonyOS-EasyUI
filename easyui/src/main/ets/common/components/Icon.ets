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
// @Entry
@Component
export struct Icon {
  private url:string = "icon/basic/arrow-down.png"
  private name:string = ""
  private clickable:boolean = false
  private iconHeight:number = 40
  private iconWidth:number = 40

  click:()=> void
  build() {
    Column(){
      Image($rawfile(this.url))
        .width(this.iconWidth)
        .height(this.iconHeight)
        .hitTestBehavior(this.clickable?HitTestMode.Default:HitTestMode.None)
        .onClick(this.click)
      Text(this.name)
        .textAlign(TextAlign.Center)
    }
  }
}