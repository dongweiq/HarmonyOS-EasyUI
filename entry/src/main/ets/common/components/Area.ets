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
import {areaInfo} from "../data/Data"

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

// @Entry
@Component
export struct Area_basic {

  @Link result:string
  @State provinces: string[] = []
  @State cities:string[] = []
  @State district:string[] = []
  @State selectedProvince:number = 0
  @State selectedCity:number = 0
  @State selectedDistrict:number = 0
  private dataInfo = new ObtainInfo()

  aboutToAppear(){
    this.provinces = this.dataInfo.allProvince()
    this.cities = this.dataInfo.allCity()
    this.district = this.dataInfo.allDistrict()
  }

  provinceChange(index:number){
    this.selectedProvince = index
    this.cities = this.dataInfo.allCity(this.provinces[index])
    this.district = this.dataInfo.allDistrict(this.provinces[this.selectedProvince],this.cities[this.selectedCity])
  }
  cityChange(index:number){
    this.selectedCity = index
    this.district = this.dataInfo.allDistrict(this.provinces[this.selectedProvince],this.cities[index])
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
            console.log("取消选择")
          })
        Divider()
          .vertical(true)
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
            console.log("选中的值："+this.provinces[this.selectedProvince]+"-"+this.cities[this.selectedCity]+"-"+this.district[this.selectedDistrict])
            this.result = this.provinces[this.selectedProvince]+" "+this.cities[this.selectedCity]+" "+this.district[this.selectedDistrict]
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
  }
}

@Component
export struct Area_selectedPCD {

  @Link result:string
  @State provinces: string[] = []
  @State cities:string[] = []
  @State district:string[] = []
  @Link selectedProvince:string
  @Link selectedCity:string
  @Link selectedDistrict:string
  private dataInfo = new ObtainInfo()
  @State selectedProvinceNumber:number = 0
  @State selectedCityNumber:number = 0
  @State selectedDistrictNumber:number = 0

  aboutToAppear(){
    this.provinces = this.dataInfo.allProvince()
    this.cities = this.dataInfo.allCity(this.selectedProvince)
    this.district = this.dataInfo.allDistrict(this.selectedProvince,this.selectedCity)
    this.initPDC(this.dataInfo.InitSelectPDC(this.provinces,this.cities,this.district,this.selectedProvince,this.selectedCity,this.selectedDistrict))
  }

  initPDC(PDC:number[]) {
    this.selectedProvinceNumber = PDC[0]
    this.selectedCityNumber = PDC[1]
    this.selectedDistrictNumber = PDC[2]
  }

  provinceChange(value:string,index:number){
    this.selectedProvince = value
    this.selectedProvinceNumber = index
    this.selectedCityNumber = 0
    this.selectedDistrictNumber = 0
    this.cities = this.dataInfo.allCity(this.provinces[index])
    this.district = this.dataInfo.allDistrict(this.provinces[this.selectedProvinceNumber],this.cities[this.selectedCityNumber])

  }
  cityChange(value:string,index:number){
    this.selectedCity = value
    this.selectedCityNumber = index
    this.district = this.dataInfo.allDistrict(this.provinces[this.selectedProvinceNumber],this.cities[index])
  }
  districtChange(value:string,index:number){
    this.selectedDistrict = value
    this.selectedDistrictNumber = index
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
            console.log("取消选择")
          })
        Divider()
          .vertical(true)
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
            console.log("选中的值："+this.selectedProvince+"-"+this.selectedCity+"-"+this.selectedDistrict)
            this.result = this.selectedProvince+" "+this.selectedCity+" "+this.selectedDistrict
          })
      }
      .margin({top:10})
      .width("100%")

      Row() {
        TextPicker({ range: this.provinces,selected:this.selectedProvinceNumber })
          .onChange((value: string, index: number) => {
            this.provinceChange(value,index)
          })
          .margin({left:10})
          .layoutWeight(1)
        TextPicker({ range: this.cities,selected:this.selectedCityNumber  })
          .onChange((value: string, index: number) => {
            this.cityChange(value,index)
          })
          .layoutWeight(1)
        TextPicker({ range: this.district,selected:this.selectedDistrictNumber  })
          .onChange((value: string, index: number) => {
            this.districtChange(value,index)
          })
          .layoutWeight(1)
          .margin({right:10})
      }

      .width("100%")
      .height(300)
    }
    .backgroundColor("#ffffffff")
  }
}

// @Entry
@Component
export struct Area_selectedPC {

  @Link result:string
  @State provinces: string[] = []
  @State cities:string[] = []
  @State selectedProvince:number = 0
  @State selectedCity:number = 0
  private title:string = "标题"
  private dataInfo = new ObtainInfo()

  aboutToAppear(){
    this.provinces = this.dataInfo.allProvince()
    this.cities = this.dataInfo.allCity()
  }

  provinceChange(index:number){
    this.selectedProvince = index
    this.cities = this.dataInfo.allCity(this.provinces[index])
  }
  cityChange(index:number){
    this.selectedCity = index
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
            console.log("取消选择")
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
            console.log("选中的值："+this.provinces[this.selectedProvince]+"-"+this.cities[this.selectedCity])
            this.result = this.provinces[this.selectedProvince]+" "+this.cities[this.selectedCity]
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
      }
      .width("100%")
      .height(300)
    }
    .backgroundColor("#ffffffff")
  }
}

@Component
export struct Area_placeholder {

  @Link result:string
  @State provinces: string[] = []
  @State cities:string[] = []
  @State district:string[] = []
  @State selectedProvince:number = 0
  @State selectedCity:number = 0
  @State selectedDistrict:number = 0
  private title:string = "标题"
  private dataInfo = new ObtainInfo()

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
            console.log("取消选择")
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
            console.log("选中的值："+this.provinces[this.selectedProvince]+"-"+this.cities[this.selectedCity]+"-"+this.district[this.selectedDistrict])
            this.result = this.provinces[this.selectedProvince]+" "+this.cities[this.selectedCity]+" "+this.district[this.selectedDistrict]
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
  }
}