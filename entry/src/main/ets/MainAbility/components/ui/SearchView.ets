@Component
export struct SearchView {
  @State isVisible:boolean=true
  @State flag:boolean=true
  @State inputWidth:string='5%'

  switchToInput(){
    this.isVisible=false
    animateTo({
      duration: 1300,
      tempo: 1,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {}
    }, () => {
      this.inputWidth='90%'
    })
    console.log('1'+this.isVisible)
  }
  switchToImage(){
    if(this.isVisible===false) {
      animateTo({
        duration: 1300,
        tempo: 1,
        iterations: 1,
        playMode: PlayMode.Normal,
        onFinish: () => {
        }
      }, () => {
        this.inputWidth = '0%'
      })
      setTimeout(() => {
        this.isVisible = true
      }, 1300)
      console.log('2')
    }
  }

  build() {
    Column() {
      Column() {
        Image($rawfile("SearchView_search.png"))
          .width(50)
          .height(50)
          .visibility(this.isVisible ? Visibility.Visible : Visibility.None)
          .onClick(() => this.switchToInput())
        TextInput({ placeholder: "search.." })
          .width(this.inputWidth)
          .backgroundColor(Color.White)
          .visibility(this.isVisible ? Visibility.Hidden : Visibility.Visible)
          .enterKeyType(EnterKeyType.Search)
      }
      .width('100%')
      .height(50)
      .backgroundColor('#33ff99')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .onClick(() => this.switchToImage())
  }
}