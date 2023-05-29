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
/**
 * 基础用法
 */
@Component
export struct Rate_default{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url

  @State iconURL_yes: string = "Rate_star_yellow.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式

  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(40)
            .height(40)
            .margin({left: 10})
            .onClick(() => {
              //实现分数的变化
              this.cur_score = index + 1;
              this.function_rate(this.cur_score);
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 自定义图标
 */
@Component
export struct Rate_icon {
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url

  @State iconURL_yes: string = "Rate_star_yellow.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式

  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(40)
            .height(40)
            .margin({left: 10})
            .onClick(() => {
              //实现分数的变化
              this.cur_score = index + 1;
              this.function_rate(this.cur_score);
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 自定义样式
 */
@Component
export struct Rate_style {
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url

  @State iconURL_yes: string = "Rate_star_yellow.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式

  @State icon_size: number = 40;//图标大小

  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(this.icon_size)
            .height(this.icon_size)
            .margin({left: 10})
            .onClick(() => {
              //实现分数的变化
              this.cur_score = index + 1;
              this.function_rate(this.cur_score);
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 半星
 */
@Component
export struct Rate_halfStar {
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url
  @State icon_half: string[] = [];//半星图标url

  @State iconURL_yes: string = "Rate_star_yellow.png";//1分图标样式
  @State iconURL_no: string = "Rate_star_grey.png";//0分图标样式
  @State iconURL_half_yes: string = "Rate_halfStar_yellow.png";//0.5分图标样式
  @State iconURL_half_no: string = "Rate_halfStar_grey.png";//0.5分图标样式

  @State icon_size: number = 40;//图标大小

  function_rate(rate: number){
    rate--;
    for (let i = 0; i < this.total_score; i++) {
      if(i <= rate){
        this.icon[i] = this.iconURL_yes;
      }
      else if(i > rate && rate == i-0.5){
        this.icon[i] = this.iconURL_no;
        this.icon_half[i] = this.iconURL_half_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
        this.icon_half[i] = this.iconURL_half_no;
      }

      if( (this.icon[i]) == this.iconURL_yes){
        this.icon_half[i] = this.iconURL_half_yes
      }
      console.log("[  " + i + "  -  " + rate + "  -  " + this.icon[i] + "  -  " + this.icon_half[i] + "  ]")
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Stack(){
            Image($rawfile(this.icon[index]))
              .width(this.icon_size)
              .height(this.icon_size)
              .margin({left: 10})
              .onClick(() => {
                //实现分数的变化
                this.cur_score = index + 1;
                this.function_rate(this.cur_score);
              })

            Image($rawfile(this.icon_half[index]))
              .width(this.icon_size * 0.5)
              .height(this.icon_size)
              .margin({left: 10})
              .onClick(() => {
                //半星
                this.cur_score = index + 0.5;
                this.function_rate(this.cur_score);
              })
              .offset({x: -this.icon_size * 0.25, y: 0})
          }

        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 自定义数量
 */
@Component
export struct Rate_number{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url

  @State iconURL_yes: string = "Rate_star_yellow.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式

  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(40)
            .height(40)
            .margin({left: 10})
            .onClick(() => {
              //实现分数的变化
              this.cur_score = index + 1;
              this.function_rate(this.cur_score);
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 禁用状态
 */
@Component
export struct Rate_disabled{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url
  @State isDisabled: boolean = true;

  @State iconURL_yes: string = "Rate_star_grey_2.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式


  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(40)
            .height(40)
            .margin({left: 10})
            .onClick(() => {
              if(!this.isDisabled){
                //实现分数的变化
                this.iconURL_yes = "Rate_star_yellow.png"
                this.cur_score = index + 1;
                this.function_rate(this.cur_score);
              }
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}

/**
 * 只读状态
 */
@Component
export struct Rate_readOnly{
  @State cur_height: number = 50;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;//评分总分值
  @State cur_score: number = 4;//当前评分
  @State icon: string[] = [];//图标url
  @State isReadOnly: boolean = true;

  @State iconURL_yes: string = "Rate_star_yellow.png";//得分图标样式
  @State iconURL_no: string = "Rate_star_white.png";//不得分图标样式

  function_rate(rate: number){
    for (let i = 0; i < this.total_score; i++) {
      if(i < rate){
        this.icon[i] = this.iconURL_yes;
      }
      else{
        this.icon[i] = this.iconURL_no;
      }
    }
  }

  build(){
    Stack(){
      Row(){
        ForEach(this.icon, (item: any, index: number) => {
          Image($rawfile(this.icon[index]))
            .width(40)
            .height(40)
            .margin({left: 10})
            .onClick(() => {
              if(!this.isReadOnly){
                //实现分数的变化
                this.cur_score = index + 1;
                this.function_rate(this.cur_score);
              }
            })
        })
      }
      .height("100%")
      .zIndex(10)
      .position({x: 0})

    }
    .height(this.cur_height)
    .width(this.cur_width)
    .onAppear(() => {
      this.function_rate(this.cur_score);
      console.log("===" + this.icon)
    })
  }
}
