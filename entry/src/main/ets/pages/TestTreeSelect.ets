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


import { TreeSelect } from 'easyui'
import promptAction from '@ohos.promptAction'

@Entry
@Component
struct TestTreeSelect {
  @State@Watch("showResult") result:string = ""

  showResult(){
    promptAction.showToast({
      message:"选中值："+this.result,
      duration:2000,
      bottom:300
    })
  }

  build() {
    Column(){
      TreeSelect({
        result:$result,
        // 传入测试数据
        data:[{
          "label":"浙江",
          "children":[{
            "label":"杭州"},
            {"label":"温州"},
            {"label":"宁波"},
            {"label":"义乌"}]
        },{
          "label":"江苏",
          "children":[{
            "label":"南京"},
            {"label":"无锡"},
            {"label":"徐州"},
            {"label":"苏州"}]
        },{
          "label":"福建",
          "children":[{
            "label":"福州"},
            {"label":"厦门"},
            {"label":"莆田"},
            {"label":"三明"}]
        },{
          "label":"北京",
          "children":[{
            "label":"北京"}]
        }],
        disable:["福建","宁波"]  //禁止点击的省份和城市
      })

      //再次测试
      // TreeSelect({
      //   result:$result,
      //   data:areaInfo
      // })
    }
  }
}