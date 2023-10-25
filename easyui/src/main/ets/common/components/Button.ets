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


/**
 * 主要按钮
 */
 @Component
export struct Button_type_main{
  private buttonName:string = "主要按钮"
  build(){
    Flex() {
      Button(this.buttonName)
        .forType()
        .type(ButtonType.Normal)
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 标准按钮
 */
@Component
export struct Button_type_normal{
  private buttonName:string = "标准按钮"
  build() {
    Flex() {
      Button(this.buttonName)
        .forType()
        .type(ButtonType.Normal)
        .backgroundColor("#ffe1e1e1")
        .fontColor("#ff353535")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}

/**
 * 链接按钮
 */

@Component
export struct Button_type_link {
  private buttonName:string = "链接按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forType()
        .type(ButtonType.Normal)
        .backgroundColor("#ffffffff")
        .fontColor("#ff0a8fec")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 按钮组
 */
@Component
export struct Button_type_group {
  private buttonName_1:string = "按钮组"
  private buttonName_2:string = "第二个"
  private buttonName_3:string = "第三个"
  build() {
    Flex(){
      Row(){
        Button(this.buttonName_1)
          .type(ButtonType.Normal)
          .backgroundColor("#ffe1e1e1")
          .fontColor("#ff353535")
          .borderRadius(5)
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_1}`)
          })
        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_2)
          .type(ButtonType.Normal)
          .backgroundColor("#ffe1e1e1")
          .fontColor("#ff353535")
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_2}`)
          })
        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_3)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor("#ffe1e1e1")
          .fontColor("#ff353535")
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_3}`)
          })
      }
      .forType()
      .height(40)
      .backgroundColor("")
      .backgroundColor("#ffe1e1e1")
      .borderWidth(1)
      .borderColor("#ffe1e1e1")
    }
  }
}
/**
 * 大尺寸按钮
 */
@Component
export struct Button_size_big_blue{
//  @State btnHeight:number=60
  private buttonName:string = "大尺寸按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .height(60)
        .fontSize(20)
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}

@Component
export struct Button_size_big_grey{
  private buttonName:string = "大尺寸按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .height(60)
        .fontSize(20)
        .fontColor("#ff353535")
        .backgroundColor("#ffe1e1e1")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}

/**
 * 较小的按钮
 */
@Component
export struct Button_size_small_blue {
  private buttonName:string = "较小按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .borderRadius(5)
        .type(ButtonType.Normal)
        .fontSize(14)
        .height(30)
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}

@Component
export struct Button_size_small_grey {
  private buttonName:string = "较小按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .borderRadius(5)
        .type(ButtonType.Normal)
        .fontSize(14)
        .height(30)
        .fontColor("#ff353535")
        .backgroundColor("#ffe1e1e1")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 迷你按钮
 */
@Component
export struct Button_size_tiny_blue {
  private buttonName:string = "迷你按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .borderRadius(5)
        .type(ButtonType.Normal)
        .fontSize(10)
        .height(20)
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}

@Component
export struct Button_size_tiny_grey {
  private buttonName:string = "迷你按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .borderRadius(5)
        .type(ButtonType.Normal)
        .fontSize(10)
        .height(20)
        .fontColor("#ff353535")
        .backgroundColor("#ffe1e1e1")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 块状按钮
 */
@Component
export struct Button_size_block_blue {
  private buttonName:string = "块状按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .width("100%")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
@Component
export struct Button_size_block_grey {
  private buttonName:string = "块状按钮"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .width("100%")
        .fontColor("#ff353535")
        .backgroundColor("#ffe1e1e1")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 带图标的按钮
 */
@Component
export struct Button_state_withIcon {
  private buttonName:string = "带图标的按钮"
  private imgName:string = "Alert_warning2.png"
  build() {
    Flex(){
      Button(){
        Flex(){
          Image($rawfile(this.imgName))
            .objectFit(ImageFit.Fill)
            .borderRadius(10)
            .width(40)
            .height(40)
            .margin({left:5})
          Text("带图标的按钮")
            .fontSize(16)
            .margin({ left:5 })
            .alignSelf(ItemAlign.Center)
        }
      }.width(180)
      .height(50)
      .backgroundColor("#ffe1e1e1")
      .type(ButtonType.Normal)
      .forState()
      .onClick(()=>{
        console.log(`点击了${this.buttonName}`)
      })
    }
  }
}
/**
 * 状态切换按钮
 */
@Component
export struct Button_state_stateSwitching {
  private buttonName:string = "状态切换按钮"
  @State btnColor:string = "#ff0a58f6"
  private isClick:Boolean = false
  build() {
    Flex(){
      Button(this.buttonName)
        .forState()
        .type(ButtonType.Normal)
        .backgroundColor(this.btnColor)
        .onClick(()=>{
          this.isClick = !this.isClick
          if(this.isClick){
            this.btnColor = "#ff053183"
          }else{
            this.btnColor = "#ff0a58f6"
          }
          console.log(`点击了${this.buttonName}`)
        })

    }
  }
}
/**
 * 多选按钮
 */
@Component
export struct Button_state_multSelect {
  private buttonName_1:string = "多选1"
  private buttonName_2:string = "多选2"
  private buttonName_3:string = "多选3"
  @State btnColor_1:string = "#ffe1e1e1"
  @State btnColor_2:string = "#ffe1e1e1"
  @State btnColor_3:string = "#ffe1e1e1"
  private isClick_1:boolean = false
  private isClick_2:boolean = false
  private isClick_3:boolean = false
  build() {
    Flex(){
      Row(){
        Button(this.buttonName_1)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(this.btnColor_1)
          .fontColor("#ff353535")
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_1}`)
            this.isClick_1 = !this.isClick_1
            if(this.isClick_1){
              this.btnColor_1 = "#ff838383"
            }else{
              this.btnColor_1 = "#ffe1e1e1"
            }
          })
        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_2)
          .type(ButtonType.Normal)

          .backgroundColor(this.btnColor_2)
          .fontColor("#ff353535")
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_2}`)
            this.isClick_2 = !this.isClick_2
            if(this.isClick_2){
              this.btnColor_2 = "#ff838383"
            }else{
              this.btnColor_2 = "#ffe1e1e1"
            }
          })
        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_3)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(this.btnColor_3)
          .fontColor("#ff353535")
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_3}`)
            this.isClick_3 = !this.isClick_3
            if(this.isClick_3){
              this.btnColor_3 = "#ff838383"
            }else{
              this.btnColor_3 = "#ffe1e1e1"
            }
          })
      }
      .forType()
      .height(40)
      .backgroundColor("#ffe1e1e1")
      .borderWidth(1)
      .borderColor("#ffe1e1e1")
    }
  }
}
/**
 * 单选按钮
 */
@Component
export struct Button_state_singleSelect {
  private buttonName_1:string = "单选1"
  private buttonName_2:string = "单选2"
  private buttonName_3:string = "单选3"
  @State btnColor_1:string = "#ff0a58f6"
  @State btnColor_2:string = "#ff0a58f6"
  @State btnColor_3:string = "#ff0a58f6"
  private isClick_1:boolean = false
  private isClick_2:boolean = false
  private isClick_3:boolean = false
  build() {
    Flex(){
      Row(){
        Button(this.buttonName_1)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(this.btnColor_1)
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_1}`)
            this.isClick_1 = !this.isClick_1
            if(this.isClick_1){
              this.btnColor_1 = "#ff053183"
              this.isClick_2 = false
              this.btnColor_2 = "#ff0a58f6"
              this.isClick_3 = false
              this.btnColor_3 = "#ff0a58f6"
            }else {
              this.isClick_1 = false
              this.btnColor_1 = "#ff0a58f6"
            }
          })
        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_2)
          .type(ButtonType.Normal)
          .backgroundColor(this.btnColor_2)
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_2}`)
            this.isClick_2 = !this.isClick_2
            if(this.isClick_2) {
              this.btnColor_2 = "#ff053183"
              this.isClick_1 = false
              this.btnColor_1 = "#ff0a58f6"
              this.isClick_3 = false
              this.btnColor_3 = "#ff0a58f6"
            }else{
              this.isClick_2 = false
              this.btnColor_2 = "#ff0a58f6"
            }
          })

        Divider()
          .vertical(true)
          .strokeWidth(1)
          .color('#ff353535')
        Button(this.buttonName_3)
          .type(ButtonType.Normal)
          .borderRadius(5)
          .backgroundColor(this.btnColor_3)
          .height(40)
          .onClick(()=>{
            console.log(`点击了${this.buttonName_3}`)
            this.isClick_3 = !this.isClick_3
            if(this.isClick_3) {
              this.btnColor_3 = "#ff053183"
              this.isClick_1 = false
              this.btnColor_1 = "#ff0a58f6"
              this.isClick_2 = false
              this.btnColor_2 = "#ff0a58f6"
            }else{
              this.isClick_3 = false
              this.btnColor_3 = "#ff0a58f6"
            }
          })
      }
      .forType()
      .height(40)
      .backgroundColor("#ff0a58f6")
      .borderWidth(1)
      .borderColor("#ffe1e1e1")
    }
  }
}
/**
 * 加载状态按钮
 */
@Component
export struct Button_state_loading {
  private buttonName:string = "加载状态"
  @State textContent:string = ""
  private btnColor:string = "#ff0a58f6"

  aboutToAppear(){
    this.textContent = this.buttonName
  }
  build() {
    Flex(){
      Button(this.textContent)
        .forState()
        .type(ButtonType.Normal)
        .backgroundColor(this.btnColor)
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
          this.textContent = `正在${this.buttonName.substr(0,this.buttonName.length-2)}...`
          this.btnColor = "#ff5bbeee"
          setTimeout(()=>{
            this.textContent = this.buttonName
            this.btnColor = "#ff0a58f6"
          },2000)
        })
    }
  }
}
/**
 * 禁用状态按钮
 */
@Component
export struct Button_state_disable_blue {
  private buttonName:string = "已禁用的操作"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .fontColor("#ffc8c8c8")
        .hitTestBehavior(HitTestMode.None) //按钮不可点击
    }
  }
}

@Component
export struct Button_state_disable_grey {
  private buttonName:string = "已禁用的操作"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .backgroundColor("#ffe1e1e1")
        .fontColor("#ffc8c8c8")
        .hitTestBehavior(HitTestMode.None) //按钮不可点击
    }
  }
}
/**
 * 默认按钮
 */
@Component
export struct Button_color_default {
  private buttonName:string = "默认"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .fontColor("#ff353535")
        .backgroundColor("#ffe1e1e1")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 主要按钮
 */
@Component
export struct Button_color_main {
  private buttonName:string = "主要"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .backgroundColor("#ff030fe5")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 信息按钮
 */
@Component
export struct Button_color_info {
  private buttonName:string = "信息"
  build() {
    Flex(){
      Button("信息")
        .forSize()
        .type(ButtonType.Normal)
        .backgroundColor("#ff03b8cf")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 成功按钮
 */
@Component
export struct Button_color_success {
  private buttonName:string = "成功"
  build() {
    Button(this.buttonName)
      .forSize()
      .type(ButtonType.Normal)
      .fontColor("#ff353535")
      .backgroundColor("#ff38b03f")
      .onClick(()=>{
        console.log(`点击了${this.buttonName}`)
      })
  }
}
/**
 * 警告按钮
 */
@Component
export struct Button_color_warn {
  private buttonName:string = "警告"
  build() {
    Flex(){
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .fontColor("#ff353535")
        .backgroundColor("#fff1a325")
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}
/**
 * 危险按钮
 */
@Component
export struct Button_color_danger {
  private buttonName:string = "危险"
  build() {
    Flex() {
      Button(this.buttonName)
        .forSize()
        .type(ButtonType.Normal)
        .fontColor("#ff353535")
        .backgroundColor("#ffea654a") 
        .animation({
          duration: 200,
          curve:Curve.FastOutSlowIn
        })
        .onClick(()=>{
          console.log(`点击了${this.buttonName}`)
        })
    }
  }
}


@Styles function forType(){
  //  .type(ButtonType.Normal)
  .borderRadius(10)
  .shadow({
    radius:5,
    color:Color.Black,
    offsetX:-2,
    offsetY:-2
  })
}

@Styles function forSize(){
  //  .type(ButtonType.Normal)
  .borderRadius(10)
  .shadow({
    radius:5,
    color:Color.Black,
    offsetX:-2,
    offsetY:-2
  })
}

@Styles function forState(){
  //  .type(ButtonType.Normal)
  .borderRadius(10)
  .shadow({
    radius:5,
    color:Color.Black,
    offsetX:-2,
    offsetY:-2
  })
}

@Styles function forColor(){
  //  .type(ButtonType.Normal)
  .borderRadius(10)
  .shadow({
    radius:5,
    color:Color.Black,
    offsetX:-2,
    offsetY:-2
  })
}

export default {Button_type_main,Button_type_normal,Button_type_link,
  Button_type_group,Button_size_big_blue,Button_size_big_grey,Button_size_small_blue,
  Button_size_small_grey,Button_size_tiny_blue, Button_size_tiny_grey,
  Button_size_block_blue,Button_size_block_grey,Button_state_withIcon,Button_state_stateSwitching,
  Button_state_multSelect,Button_state_singleSelect,Button_state_loading,Button_state_disable_blue,Button_state_disable_grey,
  Button_color_main,Button_color_info,Button_color_success,Button_color_danger,Button_color_warn}