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
export struct AddressEdit {
  @State result:string = "选择省/市/区"
  @State showResult:string = "选择省/市/区"
  @State areaSelectHeight:string = "0%"
  @State showAreaSelect:boolean = false
  @State maskOpacity:number = 0.6
  @State@Watch("closeAreaSelect") cancel:boolean = false
  @State@Watch("handleResult")confirm:boolean = false
  @State nameText:string = ""
  @State phoneText:string = ""
  @State detailInfoText:string = ""
  @State codeText:string = ""
  @State isShowCloseImg_name:boolean = false
  @State isShowCloseImg_phone:boolean = false
  @State isShowCloseImg_detailInfo:boolean = false
  @State isShowCloseImg_code:boolean = false

  private defaultPlaceholderColor:string = "#ff858585"
  private warnPlaceholderColor:string = "#ffff0000"
  private blackFontColor:string = "#ff000000"
  @State phoneNumberFontColor:string = this.blackFontColor
  @State nameFontColor:string = this.defaultPlaceholderColor
  @State phoneFontColor:string = this.defaultPlaceholderColor
  @State detailInfoFontColor:string = this.defaultPlaceholderColor
  //处理点击确定事件
  handleResult() {
    let arr = []
    arr = this.result.split("/")
    if (arr.includes("请选择") || arr.includes("")) {
      this.showTips("请选择地区")
      console.log("error")
    } else {
      this.showResult = this.result
      console.log("success")
      this.closeAreaSelect()
    }
  }

  //关闭地区选择面板
  closeAreaSelect(){
    setTimeout(()=>{
      this.showAreaSelect = false
    },350)
    this.maskOpacity = 0
    this.areaSelectHeight = "0%"
  }

  //展示提示弹窗
  showTips(message:string){
    promptAction.showToast({
      message:message,
      duration:1000,
      bottom:400
    })
  }

  //验证手机号是否正确
  isRightPhone(phone:string):boolean{
    if(phone == "" || phone.length>11){
      return false;
    }
    let reg = /^1[3|4|5|7|8][0-9]{9}/;
    if(reg.test(phone)){
      return true;//手机号码正确
    }
    return false;
  }

  aboutToAppear(){
    console.log("test+"+this.isRightPhone("1807040668"))
  }

  build() {
    Stack() {
      Column() {
        Column() {
          Row() {
            Column() {
              Text("姓名")
                .alignSelf(ItemAlign.Start)
                .margin(10)
            }.layoutWeight(3)

            Column() {
              Row() {
                TextInput({text:this.nameText, placeholder: "收货人姓名" })
                  .placeholderColor(this.nameFontColor)
                  .alignSelf(ItemAlign.Start)
                  .margin({ right: 10 })
                  .backgroundColor("#ffffffff")
                  .width("88%")
                  .onChange((value:string)=>{
                    this.nameText = value
                  })
                  .onEditChange((isEditing:boolean)=>{
                    this.nameFontColor = this.defaultPlaceholderColor
                    if(isEditing && this.nameText !=""){
                      this.isShowCloseImg_name = true
                    }else{
                      this.isShowCloseImg_name = false
                    }
                  })

                Image($rawfile("AddressEdit_close.png")).width(18).height(18).visibility(this.isShowCloseImg_name?Visibility.Visible:Visibility.Hidden)
                  .onClick(()=>{
                    this.nameText = ""
                    this.isShowCloseImg_name = false
                  })
              }
            }.layoutWeight(7)
          }.width("100%")
          .layoutWeight(1)

          Divider().width("98%").height(1).alignSelf(ItemAlign.End)

          Row() {
            Column() {
              Text("电话")
                .alignSelf(ItemAlign.Start)
                .margin(10)
            }.layoutWeight(3)

            Column() {
              Row() {
                TextInput({ text: this.phoneText, placeholder: "收货人手机号" })
                  .backgroundColor("#ffffffff")
                  .placeholderColor(this.phoneFontColor)
                  .fontColor(this.phoneNumberFontColor)
                  .alignSelf(ItemAlign.Start)
                  .margin({ right: 10 })
                  .width("88%")
                  .onChange((value:string)=>{
                    this.phoneText = value
                  })
                  .onEditChange((isEditing:boolean)=>{
                    this.phoneFontColor = this.defaultPlaceholderColor
                    this.phoneNumberFontColor = this.blackFontColor
                    if(isEditing && this.phoneText !=""){
                      this.isShowCloseImg_phone = true
                    }else{
                      this.isShowCloseImg_phone = false
                    }
                  })

                Image($rawfile("AddressEdit_close.png")).width(18).height(18).visibility(this.isShowCloseImg_phone?Visibility.Visible:Visibility.Hidden)
                  .onClick(()=>{
                    this.phoneText = ""
                    this.isShowCloseImg_phone = false
                  })
              }
            }.layoutWeight(7)
          }.width("100%")
          .layoutWeight(1)

          Divider().width("98%").height(1).alignSelf(ItemAlign.End)

          Row() {
            Column() {
              Text("地区")
                .alignSelf(ItemAlign.Start)
                .margin(10)
            }.layoutWeight(3)

            Column() {
              Text(this.showResult)
                .fontColor(this.showResult=="选择省/市/区"?"#ff84888b":Color.Black)
                .margin({ left: 15 })
                .alignSelf(ItemAlign.Start)
                .onClick(() => {
                  this.showAreaSelect = true
                  this.areaSelectHeight = "100%"
                  this.maskOpacity = 0.6
                })
            }.layoutWeight(7)
          }.width("100%")
          .layoutWeight(1)

          Divider().width("98%").height(1).alignSelf(ItemAlign.End)

          Row() {
            Column() {
              Text("详细地址")
                .alignSelf(ItemAlign.Start)
                .margin(10)
            }.layoutWeight(3)

            Column() {
              Row() {
                TextInput({ text: this.detailInfoText, placeholder: "街道门牌、楼层房间号等信息" })
                  .placeholderColor(this.detailInfoFontColor)
                  .backgroundColor("#ffffffff")
                  .alignSelf(ItemAlign.Start)
                  .margin({ right: 10 })
                  .width("88%")
                  .onChange((value: string) => {
                    this.detailInfoText = value
                  })
                  .onEditChange((isEditing: boolean) => {
                    this.detailInfoFontColor = this.defaultPlaceholderColor
                    if (isEditing && this.detailInfoText != "") {
                      this.isShowCloseImg_detailInfo = true
                    } else {
                      this.isShowCloseImg_detailInfo = false
                    }
                  })

                Image($rawfile("AddressEdit_close.png"))
                  .width(18)
                  .height(18)
                  .visibility(this.isShowCloseImg_detailInfo ? Visibility.Visible : Visibility.Hidden)
                  .onClick(() => {
                    this.detailInfoText = ""
                    this.isShowCloseImg_detailInfo = false
                  })
              }
            }.layoutWeight(7)
          }.width("100%")
          .layoutWeight(1)

          Divider().width("98%").height(1).alignSelf(ItemAlign.End)

          Row() {
            Column() {
              Text("邮政编码")
                .alignSelf(ItemAlign.Start)
                .margin(10)
            }.layoutWeight(3)

            Column() {
              Row() {
                TextInput({ text: this.codeText, placeholder: "邮政编码" })
                  .backgroundColor("#ffffffff")
                  .alignSelf(ItemAlign.Start)
                  .margin({ right: 10 })
                  .width("88%")
                  .onChange((value: string) => {
                    this.codeText = value
                  })
                  .onEditChange((isEditing: boolean) => {
                    if (isEditing && this.codeText != "") {
                      this.isShowCloseImg_code = true
                    } else {
                      this.isShowCloseImg_code = false
                    }
                  })

                Image($rawfile("AddressEdit_close.png"))
                  .width(18)
                  .height(18)
                  .visibility(this.isShowCloseImg_code ? Visibility.Visible : Visibility.Hidden)
                  .onClick(() => {
                    this.codeText = ""
                    this.isShowCloseImg_code = false
                  })
              }
            }.layoutWeight(7)
          }.width("100%")
          .layoutWeight(1)

          Divider().width("98%").height(1).alignSelf(ItemAlign.End)

          Row() {
            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Row() {
                Text("设为默认收获地址")
                  .margin(10)
              }.height("100%")

              Row() {
                Toggle({ type: ToggleType.Switch, isOn: false })
                  .margin(10)
                  .width(100)
                  .height("50%")
              }.height("100%")

            }
          }.width("100%")
          .layoutWeight(1)
        }.layoutWeight(5)
        .backgroundColor("#ffffffff")
        .borderWidth(0.5)
        .borderColor("#ffbebebe")

        //保存 删除
        Row() {
          Flex({
            direction: FlexDirection.Column,
            justifyContent: FlexAlign.SpaceAround,
            alignItems: ItemAlign.Center
          }) {
            Row() {
              Button("保存")
                .type(ButtonType.Normal)
                .backgroundColor("#ffff0000")
                .borderWidth(1)
                .borderColor("#ffff0000")
                .width("90%")
                .onClick(()=>{
                  if(this.nameText == ""){
                    this.nameFontColor = this.warnPlaceholderColor
                    this.showTips("请填写姓名")
                  }else if(!this.isRightPhone(this.phoneText)){
                    this.phoneFontColor = this.warnPlaceholderColor
                    this.showTips("请填写正确的手机号")
                    this.phoneNumberFontColor = this.warnPlaceholderColor
                  }else if(this.showResult == "选择省/市/区"){
                    this.showTips("请选择地区")
                    console.log(this.showResult)
                  }else if(this.detailInfoText == ""){
                    this.showTips("请填写详细地址")
                    this.detailInfoFontColor = this.warnPlaceholderColor
                  }else{
                    this.showTips("保存")
                  }
                })
            }.layoutWeight(1)

            Row() {
              Button("删除")
                .fontColor("#ff000000")
                .borderWidth(1)
                .borderColor("#ffbebebe")
                .type(ButtonType.Normal)
                .backgroundColor("#ffffffff")
                .width("90%")
                .alignSelf(ItemAlign.Center)
                .onClick(() => {
                  AlertDialog.show(
                    {
                      message: '\n确定要删除么\n',
                      primaryButton: {
                        value: '取消',
                        action: () => {
                          console.info('Callback when the first button is clicked')
                        },
                        fontColor:Color.Black
                      },
                      secondaryButton: {
                        value: '确定',
                        action: () => {
                          console.info('Callback when the second button is clicked')
                        }
                      },
                      cancel: () => {
                        console.info('Closed callbacks')
                      }
                    })
                })
            }.layoutWeight(1)
          }.width("100%")
        }.layoutWeight(2)
        .margin({ top: 40 })
        //底部空余
        Row().layoutWeight(3)

      }.width("100%")


      //展示弹出框
      Row().width("100%").height("100%").backgroundColor("#ff000000").opacity(this.maskOpacity)
        .animation({
          duration:300
        })
        .visibility(this.showAreaSelect?Visibility.Visible:Visibility.Hidden)

      Column() {
        Row().width("100%").height("55%").opacity(0)
          .onClick(()=>{
            setTimeout(()=>{
              this.showAreaSelect = false
            },350)
            this.maskOpacity = 0
            this.areaSelectHeight = "0%"
          })
        Row() {
          Area_placeholder({
            result: $result,
            title: "",
            areaSelectHeight:$areaSelectHeight,
            showAreaSelect:$showAreaSelect,
            cancel:$cancel,
            confirm:$confirm
          }).alignSelf(ItemAlign.End)
        }.height("45%")
      }.height("100%")
      .visibility(this.showAreaSelect?Visibility.Visible:Visibility.Hidden)

    }
  }
}

//地址选择器
@Component
struct Area_placeholder {

  @Link result:string
  @State provinces: string[] = []
  @State cities:string[] = []
  @State district:string[] = []
  @State selectedProvince:number = 0
  @State selectedCity:number = 0
  @State selectedDistrict:number = 0
  private title:string = "标题"
  private dataInfo = new ObtainInfo()
  @Link areaSelectHeight:string
  @Link showAreaSelect:boolean
  @Link cancel:boolean
  @Link confirm:boolean

  aboutToAppear(){
    this.provinces = this.dataInfo.allProvince()
    this.provinces.splice(0,0,"请选择")
  }

  provinceChange(index:number){
    this.selectedProvince = index
    this.selectedCity = 0
    this.selectedDistrict = 0
    this.district = [""]
    if(this.selectedProvince != 0){
      this.cities = this.dataInfo.allCity(this.provinces[index])
      this.cities.splice(0,0,"请选择")
    }else{
      this.selectedCity = 0
      this.cities = [""]
    }
  }
  cityChange(index:number){
    this.selectedCity = index
    this.selectedDistrict = 0
    if(this.selectedCity != 0){
      this.district = this.dataInfo.allDistrict(this.provinces[this.selectedProvince],this.cities[index])
      this.district.splice(0,0,"请选择")
    }else{
      this.selectedDistrict = 0
      this.district = [""]
    }

  }
  districtChange(index:number){
    this.selectedDistrict = index
  }
  build() {
    Column() {
      Row(){
        Button("取消")
          .margin({left:10})
          .fontColor("#ff2181e9")
          .fontSize(16)
          .type(ButtonType.Normal)
          .borderRadius(20)
          .backgroundColor("#ffffffff")
          .layoutWeight(2)
          .onClick(()=>{
            this.cancel = !this.cancel
          })
        Column(){
          Text(this.title)
            .fontSize(16)
        }
        .height(20)
        .layoutWeight(5)

        Button("确认")
          .margin({right:10})
          .fontColor("#ff2181e9")
          .fontSize(16)
          .type(ButtonType.Normal)
          .borderRadius(20)
          .backgroundColor("#ffffffff")
          .layoutWeight(2)
          .onClick(()=>{
            this.result = this.provinces[this.selectedProvince]+"/"+this.cities[this.selectedCity]+"/"+this.district[this.selectedDistrict]
            this.confirm = !this.confirm
          })
      }
      .margin({top:10})
      .width("100%")

      Row() {
        TextPicker({ range: this.provinces,selected:this.selectedProvince })
          .onChange((value: string, index: number) => {
            this.provinceChange(index)
          })
          .margin({left:10})
          .layoutWeight(1)
        TextPicker({ range: this.cities,selected:this.selectedCity  })
          .onChange((value: string, index: number) => {
            this.cityChange(index)
          })
          .layoutWeight(1)
        TextPicker({ range: this.district,selected:this.selectedDistrict  })
          .onChange((value: string, index: number) => {
            this.districtChange(index)
          })
          .layoutWeight(1)
          .margin({right:10})
      }
      .width("100%")
      .height(300)
    }
    .backgroundColor("#ffffffff")
    .height(this.areaSelectHeight)
    .animation({
      duration:300
    })
  }
}


import {areaInfo} from "../data/Data"
import promptAction from '@ohos.promptAction'

//获取省份，城市，区域信息
class ObtainInfo{
  private provinces:string[] = []
  private cities:string[] = []
  private district:string[] = []

  allProvince():string[]{
    this.provinces = []
    areaInfo.forEach(element => {
      this.provinces.push(element.label)
    });
    return this.provinces
  }

  allCity(provinceName="北京市"):string[]{
    this.cities = []
    areaInfo.forEach(element => {
      if(element.label == provinceName){
        let cityForProvince = element.children;
        cityForProvince.forEach(element=>{
          this.cities.push(element.label)
        })
      }
    });
    return this.cities
  }

  allDistrict(provinceName="北京市",cityName="北京市"):string[]{
    this.district = []
    areaInfo.forEach(element => {
      if(element.label == provinceName){
        let cityForProvince = element.children;
        cityForProvince.forEach(element=>{
          if(element.label == cityName){
            let districtForCity = element.children
            districtForCity.forEach(element=>{
              this.district.push(element.label)
            })
          }
        })
      }
    });
    return this.district
  }

  InitSelectPDC(provinces:string[],cities:string[],districts:string[],province,city,district):number[]{
    let P = 0
    let C = 0
    let D = 0
    for(let i=0;i<provinces.length;i++){
      if(provinces[i] == province){
        P = i
        for(let j=0;j<cities.length;j++){
          if(cities[j] == city){
            C = j
            for(let k=0;k<districts.length;k++){
              if(districts[k]==district){
                D = k
                break;
              }
            }
          }
        }
      }
    }
    return [P,C,D]
  }

}