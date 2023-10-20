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


import {TextInput_icon} from "easyui"
import {TextInput_label} from "easyui"
import {TextInput_search} from "easyui"
import {TextInput_disabled} from "easyui"

@Entry
@Component
struct TestTextInput {
  build() {
    Column() {
      Text("(1)带图标")
        .fontSize(20)
        .margin({top:20})
      TextInput_icon({iconUrl: "TextInput_user.png", placeholder: "用户名"});
      TextInput_icon({iconUrl: "TextInput_email.png", placeholder: "邮箱"});
      TextInput_icon({iconUrl: "TextInput_password.png", placeholder: "密码"});

      Text("(2)带标签")
        .fontSize(20)
        .margin({top:20})
      TextInput_label({placeholder: "用户名:", labelText: "合法!!"});
      TextInput_label({placeholder: "邮箱:", labelText: "不合法!!"});
      TextInput_label({placeholder: "密码:", labelText: ""});


      Text("(3)搜索框")
        .fontSize(20)
        .margin({top:20})
      TextInput_search({searchIconUrl: "TextInput_search.png", placeholder: "搜索"});
      TextInput_search({searchIconUrl: "TextInput_search.png", placeholder: "搜索", borderRadius_num:20});


      Text("(4)禁用")
        .fontSize(20)
        .margin({top:20})
      TextInput_disabled({iconUrl: "TextInput_user.png", placeholder: "用户名", isEnabled: false });
    }
  }
}