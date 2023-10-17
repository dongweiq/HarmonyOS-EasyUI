
import { Toast_advance, Toast_default, Toast_loading, Toast_successOrFailed } from 'easyui';

@Entry
@Component
struct TestToast{
  @State pop_visibility_default: Visibility = Visibility.Hidden;
  @State pop_visibility_loading: Visibility = Visibility.Hidden;
  @State pop_visibility_success: Visibility = Visibility.Hidden;
  @State pop_visibility_failed: Visibility = Visibility.Hidden;
  @State pop_visibility_advance: Visibility = Visibility.Hidden;
  @State content: string = "";
  build(){
    Column({space: 20}){

      Column({space: 10}){
        Text("Toast文字提示")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        Row({space: 30}){
          Button("文字提示")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.content = "提示内容";
              this.pop_visibility_default = Visibility.Visible;
            })

          Button("长文字提示")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.content = "这是一条长文字提示，超过一定字数就会换行";
              this.pop_visibility_default = Visibility.Visible;
            })
        }
      }

      Column({space: 10}){
        Text("Toast加载提示")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        Row({space: 30}){
          Button("加载提示")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.content = "加载中...";
              this.pop_visibility_loading = Visibility.Visible;
            })
        }
      }

      Column({space: 10}){
        Text("Toast成功/失败提示")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        Row({space: 30}){
          Button("成功提示")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.content = "成功文案";
              this.pop_visibility_success = Visibility.Visible;
            })

          Button("失败提示")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.content = "失败文案";
              this.pop_visibility_failed = Visibility.Visible;
            })
        }
      }


      Column({space: 10}){
        Text("Toast高级用法")
          .fontSize(25)
          .width("100%")
          .height(30)
          .margin({left: 10})
          .align(Alignment.Start)
        Row({space: 30}){
          Button("高级用法")
            .type(ButtonType.Normal)
            .height("10%")
            .width("35%")
            .backgroundColor(Color.White)
            .fontSize(25)
            .fontColor(Color.Black)
            .shadow({radius: 5})
            .onClick(() => {
              this.pop_visibility_advance = Visibility.Visible;
            })
        }
      }

      Toast_default({content: $content, comp_visibility: $pop_visibility_default})
        .position({x: "30%", y: "40%"})

      Toast_loading({content: $content, comp_visibility: $pop_visibility_loading})

      Toast_successOrFailed({content: $content, comp_visibility: $pop_visibility_success, imgURL: "Toast_success.png"})
      Toast_successOrFailed({content: $content, comp_visibility: $pop_visibility_failed, imgURL: "Toast_failed_1.png"})

      Toast_advance({comp_visibility: $pop_visibility_advance})


    }
  }
}