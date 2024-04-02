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


import { AddressList } from '@isrc/easyui'
@Entry
@Component
struct TestAddressList {
  build() {
    Column(){
      Text("基础用法")
        .fontSize(20)
        .fontColor("#ff808080")
        .margin(20)
        .alignSelf(ItemAlign.Start)
      AddressList({
        addressList: [              //地址列表
          { "id":1,"name":"张三","tel":"13000000000","address":"浙江省杭州市西湖区文一路 138 号东方通信大厦7楼501室"}
          ,{ "id":2,"name":"李四","tel":"13100000000","address":"浙江省杭州市拱墅区莫干山路 50号"}
          ,{ "id":3,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道13号"}
          ,{ "id":4,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道14号"}
          ,{ "id":5,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道15号"}
          ,{"id":6,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道16号"}
          ,{"id":7,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道17号"}
          ,{"id":8,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道18号"}
          ,{"id":9,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道19号"}
          ,{"id":10,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道19号"}
          ,{"id":11,"name":"王五","tel":"13200000000","address":"浙江省杭州市滨江区江南大道19号"}
        ],
        outRangeIdArray:[5,6,7]        //超出配送范围的地址id集合
      })

    }.width("100%")
    .height("100%")
    .backgroundColor("#ffeaeaea")
  }
}