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
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 3;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(1)
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}

/**
 * 自定义图标
 */
@Component
export struct Rate_icon{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 3;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(1)
        .starStyle({
          backgroundUri: "/common/img/Rate_heart_white.png",
          foregroundUri: "/common/img/Rate_heart_yellow.png"
        })
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}
/**
 * 自定义样式
 */
@Component
export struct Rate_style{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 3;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(1)
        .starStyle({
          backgroundUri: "/common/img/Rate_star_grey.png",
          foregroundUri: "/common/img/Rate_star_red.png"
        })
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}

/**
 * 半星
 */
@Component
export struct Rate_halfStar{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 3.5;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(0.5)
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}

/**
 * 自定义数量
 */
@Component
export struct Rate_number{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State total_score: number = 5;
  @State rating: number = 5;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(this.total_score)
        .stepSize(1)
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}
/**
 * 禁用状态
 */
@Component
export struct Rate_disabled{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 4;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(1)
        .enabled(false)
        .starStyle({
          backgroundUri: "/common/img/Rate_star_grey.png",
          foregroundUri: "/common/img/Rate_star_grey_2.png"
        })
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}
/**
 * 只读状态
 */
@Component
export struct Rate_readOnly{
  @State cur_height: number = 70;//组件高度
  @State cur_width: number = 360;//组件宽度
  @State rating: number = 4;

  build(){
    Column(){
      Rating({ rating: this.rating, indicator: false })
        .size({width: 300, height: 60})
        .stars(5)
        .stepSize(1)
        .enabled(false)
    }
    .height(this.cur_height)
    .width(this.cur_width)
  }
}
