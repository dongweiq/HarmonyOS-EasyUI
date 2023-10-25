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


import {Icon} from "easyui"
@Entry
@Component
struct TestIcon {

  private controller: TabsController = new TabsController()
  private tabLabels:string[] = ["基础图标","线框风格","实底风格"]  //标签页
  private animated:boolean = true   //是否开启切换动画s
  private tabPageWidth:number|string  = 80
  @State currentIndex:number = 0

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? '#ff000000' : '#ff5d5d5d')
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#ff005eff')
        .width("100%")
        .opacity(this.currentIndex === index ? 1 : 0)
        .animation({
          duration:200
        })
    }.width(this.tabPageWidth)
  }
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {

        ForEach(this.tabLabels, (item, index) => {
          TabContent() {
              Column() {
                if(index==0){
                  BasicIcon()
                }else if(index==1){
                  LineFrameIcon()
                }else if(index==2){
                  SolidBaseIcon()
                }

              }.width('100%').height('100%').backgroundColor('#ffd4d4d4')
          }.tabBar(this.TabBuilder(index, item))
        })
      }
      .scrollable(this.animated)
      .vertical(false)
      .barWidth("100%")
      .animationDuration(this.animated?300:0)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width("100%")
      .margin({ top: 0 })
      .backgroundColor('#ffffffff')

    }.width('100%')
  }

}
@Component
struct BasicIcon {
  private basicIcon:string[] = ["success.png","plus.png","cross.png","fail.png","arrow-right.png","arrow-left.png","arrow-up.png","arrow-down.png"]

  build(){
    Column() {
      Grid() {
        ForEach(this.basicIcon, (item: string) => {
          GridItem() {
            Icon({
              url: `icon/basic/${item}`,
              iconWidth: 50,
              iconHeight: 50,
              name: item.split('.')[0]
            })
          }
          .margin({ bottom: 10,top:10 })
        }, item => item)
      }
      .columnsTemplate("1fr 1fr 1fr 1fr")
    }
    .backgroundColor("#ffffffff").width("90%").height("25%").margin({top:20})
  }
}

@Component
struct LineFrameIcon {

  private lineFrameIcon:string[] = ["location-o.png","like-o.png","star-o.png","phone-o.png","setting-o.png","fire-o.png","coupon-o.png","cart-o.png"
    ,"shopping-cart-o.png","cart-circle-o.png","friends-o.png","comment-o.png","gem-o.png","gift-o.png","point-gift-o.png","send-gift-o.png"
    ,"service-o.png","bag-o.png","todo-list-o.png","balance-list-o.png","medel-o.png","close.png","clock-o.png","question-o.png"
    ,"passed.png","add-o.png","gold-coin-o.png","info-o.png","manager-o.png","label-o.png","hot-o.png","hot-sale-o.png"
    ,"new-o.png","new-arrival-o.png","goods-collect-o.png","eye-o.png","browsing-history-o.png","bookmark-o.png","bill-o.png","video-o.png"
    ,"shop-o.png","shop-collect-o.png","chat-o.png","smile-comment-o.png","vip-card-o.png","award-o.png","diamond-o.png","volume-o.png"
    ,"cluster-o.png","underway-o.png","photo-o.png","gift-card-o.png","more-o.png","expand-o.png","play-circle-o.png","pause-circle-o.png"
    ,"stop-circle-o.png","warning-o.png","phone-circle-o.png","smile-o.png","music-o.png","balance-o.png","refund-o.png","birthday-cake-o.png"
    ,"user-o.png","thumb-circle-o.png","orders-o.png","tv-o.png","envelop-o.png","flag-o.png","flower-o.png","filter-o.png"
    ,"bar-chart-o.png","chart-trending-o.png","comment-circle-o.png","brush-o.png","bullhorn-o.png","hotel-o.png","cashier-o.png","newspaper-o.png"
    ,"warn-o.png","notes-o.png","calender-o.png","bulb-o.png","user-circle-o.png","desktop-o.png","apps-o.png","home-o.png"
    ,"share.png","search.png","points.png","edit.png","delete.png","qr.png","qr-invalid.png","closed-eye.png"
    ,"wap-home.png","scan.png","free-postage.png","certificate.png","logistics.png","contact.png","cash-back-record.png","after-sale.png"
    ,"exchange.png","upgrade.png","ellipsis.png","circle.png","description.png","records.png","sign.png","completed.png"
    ,"failure.png","ecard-pay.png","peer-pay.png","balance-pay.png","credit-pay.png","debit-pay.png","cash-on-deliver.png","other-pay.png"
    ,"tosend.png","pending-payment.png","paid.png","aim.png","discount.png","idcard.png","replay.png","shrink.png"]

  private data:MyDataSource = new MyDataSource()
  aboutToAppear(){
    this.data.setDataArray(this.lineFrameIcon)
  }

  build(){
      Column() {
        Grid() {
          LazyForEach(this.data, (item: string) => {
            GridItem() {
              Icon({
                url: `icon/style/${item}`,
                iconWidth: 50,
                iconHeight: 50,
                name: item.split('.')[0]
              })
            }
            .margin({ bottom: 10, top: 10 })
          }, item => item)
        }.columnsTemplate("1fr 1fr 1fr 1fr")
      }
      .backgroundColor("#ffffffff").width("90%").margin({ top: 20 })
  }
}

@Component
struct SolidBaseIcon {

  private solidBaseIcon:string[] = ["location.png","like.png","star.png","phone.png","setting.png","fire.png","coupon.png","cart.png"
    ,"shopping-cart.png","cart-circle.png","friends.png","comment.png","gem.png","gift.png","point-gift.png","send-gift.png"
    ,"service.png","bag.png","todo-list.png","balance-list.png","medel.png","clear.png","clock.png","question.png"
    ,"checked.png","add.png","gold-coin.png","info.png","manager.png","label.png","hot.png","hot-sale.png"
    ,"new.png","new-arrival.png","goods-collect.png","eye.png","browsing-history.png","bookmark.png","bill.png","video.png"
    ,"shop.png","shop-collect.png","chat.png","smile-comment.png","vip-card.png","award.png","diamond.png","volume.png"
    ,"cluster.png","underway.png","photo.png","gift-card.png","more.png","expand.png","play-circle.png","pause-circle.png"
    ,"stop-circle.png","alipay.png","wechat.png","photograph.png","youzan-shield.png","umbrella-circle.png","bell.png","printer.png"
    ,"map-marked.png","card.png","add-square.png","live.png","lock.png","audio.png","graphic.png","column.png"
    ,"invition.png","play.png","pause.png","stop.png","weapp-nav.png","ascending.png","descending.png","bars.png"
    ,"wap-nav.png"]

  private data:MyDataSource = new MyDataSource()
  aboutToAppear(){
    this.data.setDataArray(this.solidBaseIcon)
  }
  build(){
    Column() {
      Grid() {
        ForEach(this.solidBaseIcon, (item: string) => {
          GridItem() {
            Icon({
              url: `icon/style/${item}`,
              iconWidth: 50,
              iconHeight: 50,
              name: item.split('.')[0]
            })
          }
          .margin({ bottom: 10, top: 10 })
        }, item => item)
      }.columnsTemplate("1fr 1fr 1fr 1fr")
    }
    .backgroundColor("#ffffffff").width("90%").margin({ top: 20 })
  }
}


// Basic implementation of IDataSource to handle data listener
class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): any {
    return undefined;
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = ["success.png","plus.png","cross.png","fail.png","arrow-right.png","arrow-left.png","arrow-up.png","arrow-down.png"]

  public setDataArray(data){
    this.dataArray = data
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): any {
    return this.dataArray[index];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}