import { SwipeCell_async, SwipeCell_default } from 'easyui'
@Entry
@Component
struct TextSearch{
  build(){
    Column({space: 20}){
      Text("SwipeCell基础用法")
        .fontSize(25)
        .width("100%")
        .height(30)
        .margin({left: 10, top: 10})
        .align(Alignment.Start)

      SwipeCell_default()

      Text("SwipeCell异步删除")
        .fontSize(25)
        .width("100%")
        .height(30)
        .margin({left: 10, top: 10})
        .align(Alignment.Start)

      SwipeCell_async()

    }
    .backgroundColor("#ffdddddd")
    .height("100%")
    .width("100%")
  }
}