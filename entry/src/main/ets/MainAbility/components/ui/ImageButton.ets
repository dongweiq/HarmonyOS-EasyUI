//图片按钮组件
@Component
export struct ImageButton {
  private buttonWidth: number = 100
  private buttonHeight: number = 50
  private imageName: string = ""
  private text:string = ""
  private buttonRadius:number = 0
  private fontColor:string|Color = "#daffffff"
  private fontSize: number = this.buttonWidth/6
  //  private image: string = "entry/src/main/ets/MainAbility/images/icon.png"
  clickListener?:(event?:ClickEvent) => void

  build() {
    Row() {
      Stack() {
        //http://photogz.photo.store.qq.com/psc?/V53Ltus92i73H30w5y610elH1X3NS6zy/05RlWl8gsTOH*Z17MtCBzE03esYleptw24NWD6XmfJ2*oMzqeETjl8VQSIltwFyWQo1Xunt2h2vwjX49UuH67w!!/m&bo=cgByAHIAcgAWADA!
        if(this.imageName === ""){
          if(this.text === ""){
            Button("添加文字")
              .width(this.buttonWidth)
              .height(this.buttonHeight)
              .onClick(() => {
                this.clickListener()
              })
          }else{
            Button(this.text)
              .width(this.buttonWidth)
              .height(this.buttonHeight)
              .fontSize(this.fontSize)
              .fontColor(this.fontColor)
              .onClick(() => {
                this.clickListener()
              })
          }

//            .opacity(1)
        }else{
          Image($rawfile(this.imageName))
            //将该占位图片改为不存在提示
            .alt("http://photogz.photo.store.qq.com/psc?/V53Ltus92i73H30w5y610elH1X3NS6zy/05RlWl8gsTOH*Z17MtCBzPZY5SnQNVvd0rGNiIxnpntlCxqC9jk18cl6nF7OAvuOcRJ01HTLKBRvmJlAxsj4qg!!/m&bo=aAA0AGgANAAWADA!")
            .width(this.buttonWidth)
            .height(this.buttonHeight)
            .objectFit(ImageFit.Fill)
            .borderWidth(1)
            .borderColor("#aabbcc")
            .shadow({radius:10})
            .borderRadius(this.buttonRadius)
          Text(this.text)
            .fontSize(this.fontSize)
            .textAlign(TextAlign.Center)
            .width(this.buttonWidth)
            .height(this.buttonHeight)
            .fontColor(this.fontColor)
          Button($rawfile(this.imageName))
            .width(this.buttonWidth)
            .height(this.buttonHeight)
            .opacity(0)
            .onClick(()=>{
              this.clickListener()
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}