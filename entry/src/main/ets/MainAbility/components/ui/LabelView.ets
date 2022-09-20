
@Component
export struct LabelView{
  //需要添加label的组件宽高
  @State viewW: number = 0;
  @State viewH: number = 0;
  //label内容
  @State labelTitle: string = "";
  //label位置(1-左上， 2-右上， 3-左下， 4-右下) //3,4参数还需调整,目前实现了1,2
  @State labelLoc: number = 0;
  //label与顶角的距离
  @State distance: number = 0;
  //label宽度
  @State labelW: number = 0;

  @State mPath: string = "";
  @State mAngel: number = 0;
  @State mPos_x: number = 0;
  @State mPos_y: number = 0;


  build(){

    Row(){
      Text("" + this.labelTitle)
        .fontSize(this.labelW * 0.5)
        .fontColor(Color.White)
        .position({
          x: this.mPos_x,
          y: this.mPos_y
        })
        .rotate({
          x: 0,
          y: 0,
          z: 5,
          centerX: 0,
          centerY: 0,
          angle: this.mAngel
        })
    }
    .width(this.viewW)
    .height(this.viewH)
    .clip(new Path({
      commands: this.mPath
    }))
    .backgroundColor(Color.Red)
    .onAppear(() => {
      switch(this.labelLoc){
        case 1:
          this.mPath = "M 0 " + vp2px(this.distance) +
                       " L " + vp2px(this.distance) + " 0" +
                       " L " + vp2px(this.distance+ this.labelW) + " 0" +
                       " L 0 " + vp2px(this.distance+ this.labelW) + " Z";
          this.mAngel = -45;
          this.mPos_x = this.distance * 0.2;
          this.mPos_y = this.distance * 0.9;
          console.log("左上" + this.mPath);
          break;

        case 2:
          this.mPath = "M " + vp2px(this.viewW - this.distance - this.labelW) + " 0" +
                       " L " + vp2px(this.viewW) + " " + vp2px(this.distance + this.labelW) +
                       " L " + vp2px(this.viewW) + " " + vp2px(this.distance) +
                       " L " + vp2px(this.viewW - this.distance) + " 0 Z";
          this.mAngel = 45;
          this.mPos_x = this.viewW - this.distance * 0.9;
          this.mPos_y = this.distance * 0.2;
          console.log("右上" + this.mPath);
          break;
//
//        case 3:
//          this.mPath = "M 0 " + vp2px(this.viewH - this.distance - this.labelW) +
//                       " L " + vp2px(this.distance + this.labelW) + " " + vp2px(this.viewH) +
//                       " L " + vp2px(this.distance) + " " + vp2px(this.viewH) +
//                       " L 0 " + vp2px(this.viewH - this.distance) + " Z";
//          this.mAngel = 45;
//          this.mPos_x = this.distance * 0.8;
//          this.mPos_y = this.distance * 1.4;
//          console.log("左下" + this.mPath);
//          break;
//
//        case 4:
//          this.mPath = "M " + vp2px(this.labelW) + " " +  vp2px(this.viewH - this.distance - this.labelW) +
//                       " L " + vp2px(this.viewW - this.distance - this.labelW) + " " + vp2px(this.viewH) +
//                       " L " + vp2px(this.viewW - this.distance) + " " + vp2px(this.viewH) +
//                       " L " + vp2px(this.viewW) + " " + vp2px(this.viewH - this.distance) + " Z";
//          this.mAngel = -45;
//          this.mPos_x = this.distance * 0.2;
//          this.mPos_y = this.distance * 0.9;
//          console.log("右下" + this.mPath);

      }
      console.log("=== " + this.viewW + " ==== " + this.viewH + " ==== " + this.labelTitle + " ==== " + this.labelLoc + " ==== " + this.distance + " ==== " + this.labelW + "===" + this.mPath)
    })

  }
}