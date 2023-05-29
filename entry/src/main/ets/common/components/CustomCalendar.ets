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

//@ts-nocheck
@CustomDialog
export struct CustomCalendar {
  controller: CustomDialogController

  cancel():void{
    console.info('取消选择日期')
  }
  confirm():void{
    this.confirmSelectedDay = this.isSelectDay
    console.info(this.confirmSelectedDay)
  }

  @State time_title:string='2022年08月'  //年月栏
  @State isSelectDay:string= ''  // 点击选中的时间
  @State selectedDay:string = "" // 点击选中的时间
  @Link confirmSelectedDay:string //将改变量与父页面变量绑定。


  @State dayList:any[]=[
    [{"year":2022,"month":7,"day":31,"time":"2022-07-31","label":"last"},
     {"year":2022,"month":8,"day":1,"time":"2022-08-01","label":"at"},
     {"year":2022,"month":8,"day":2,"time":"2022-08-02","label":"at"},
     {"year":2022,"month":8,"day":3,"time":"2022-08-03","label":"at"},
     {"year":2022,"month":8,"day":4,"time":"2022-08-04","label":"at"},
     {"year":2022,"month":8,"day":5,"time":"2022-08-05","label":"at"},
     {"year":2022,"month":8,"day":6,"time":"2022-08-06","label":"at"}],
    [{"year":2022,"month":8,"day":7,"time":"2022-08-07","label":"at"},
     {"year":2022,"month":8,"day":8,"time":"2022-08-08","label":"at"},
     {"year":2022,"month":8,"day":9,"time":"2022-08-09","label":"at"},
     {"year":2022,"month":8,"day":10,"time":"2022-08-10","label":"at"},
     {"year":2022,"month":8,"day":11,"time":"2022-08-11","label":"at"},
     {"year":2022,"month":8,"day":12,"time":"2022-08-12","label":"at"},
     {"year":2022,"month":8,"day":13,"time":"2022-08-13","label":"at"}],
    [{"year":2022,"month":8,"day":14,"time":"2022-08-14","label":"at"},
     {"year":2022,"month":8,"day":15,"time":"2022-08-15","label":"at"},
     {"year":2022,"month":8,"day":16,"time":"2022-08-16","label":"at"},
     {"year":2022,"month":8,"day":17,"time":"2022-08-17","label":"at"},
     {"year":2022,"month":8,"day":18,"time":"2022-08-18","label":"at"},
     {"year":2022,"month":8,"day":19,"time":"2022-08-19","label":"at"},
     {"year":2022,"month":8,"day":20,"time":"2022-08-20","label":"at"}],
    [{"year":2022,"month":8,"day":21,"time":"2022-08-21","label":"at"},
     {"year":2022,"month":8,"day":22,"time":"2022-08-22","label":"at"},
     {"year":2022,"month":8,"day":23,"time":"2022-08-23","label":"at"},
     {"year":2022,"month":8,"day":24,"time":"2022-08-24","label":"at"},
     {"year":2022,"month":8,"day":25,"time":"2022-08-25","label":"at"},
     {"year":2022,"month":8,"day":26,"time":"2022-08-26","label":"at"},
     {"year":2022,"month":8,"day":27,"time":"2022-08-27","label":"at"}],
    [{"year":2022,"month":8,"day":28,"time":"2022-08-28","label":"at"},
     {"year":2022,"month":8,"day":29,"time":"2022-08-29","label":"at"},
     {"year":2022,"month":8,"day":30,"time":"2022-08-30","label":"at"},
     {"year":2022,"month":8,"day":31,"time":"2022-08-31","label":"at"},
     {"year":2022,"month":9,"day":1,"time":"2022-09-01","label":"next"},
     {"year":2022,"month":9,"day":2,"time":"2022-09-02","label":"next"},
     {"year":2022,"month":9,"day":3,"time":"2022-09-03","label":"next"}]
  ]  // 显示的日历列表

  //初始化时间, 需要显示初始化日历的年月，格式：y-M
  initDay(day:Date){
    this.today = this.formatDate(new Date(),'y-M-d');
    if(!day){
      day = this.today;
    }
    console.log('传入的当前年月：'+day)
    console.log('获取今天的时间：'+this.today)
    this.getCld(day);
    this.isSelectDay=this.today;
    console.log(this.isSelectDay)
  }
  //获取日历
  getCld(time:Date){
    let dd = new Date(time);
    let {year: y, month: m, monthLen} = this.getDateInfo(time);
    let {year: l_y, month: l_m, monthLen: l_monthLen} = this.getDateInfo(time,-1);
    let {year: n_y, month: n_m} = this.getDateInfo(time,+1);

    console.log('getcld函数参数time：'+time)
    console.log('getcld函数参数dd：'+dd)

    this.time_title = this.formatDate(dd,'y年M月');
    let date = new Date(y,m-1,1);
    //该月1号周几
    let week_start = date.getDay();

    // 该月有多少周
    let week_len = Math.ceil((week_start + monthLen) / 7);
    let arr = [];
    let num = 1;
    let n_num = 1;
    for(var i = 0; i < week_len; i++){
      arr.push([])
      for(var j = 0; j < 7; j++){
        if((i < 1 && j < week_start)){
          // 上个月
          let l_d = l_monthLen - week_start + (1 + j);
          arr[i].push({
            year: l_y,
            month: l_m,
            day: l_d,
            time: `${l_y}-${l_m.toString().padStart(2,'0')}-${l_d.toString().padStart(2,'0')}`,
            label: 'last',
          });
        } else if((num > monthLen)){
          // 下个月
          arr[i].push({
            year: n_y,
            month: n_m,
            day: n_num,
            time: `${n_y}-${n_m.toString().padStart(2,'0')}-${n_num.toString().padStart(2,'0')}`,
            label: 'next',
          });
          n_num++;
        } else {
          // 本月
          arr[i].push({
            year: y,
            month: m,
            day: num,
            time: `${y}-${m.toString().padStart(2,'0')}-${num.toString().padStart(2,'0')}`,
            label: 'at',
          });
          num++;
        }
      }
    }
    this.dayList = arr;
  }
  // 跳转到今天
  toToday(){
    this.isSelectDay = this.today;
    this.currentYM = this.today;
    this.initDay(this.currentYM);
  }
  // 点击<>切换月份
  cutMonth(num){
    let date = this.currentYM || this.today;
    let {year, month} = this.getDateInfo(date,num);
    this.currentYM = `${year}-${month.toString().padStart(2,'0')}`;
    this.getCld(this.currentYM);
  }
  // 获取上下个月的年份和月份方法
  getDateInfo(date,num = 0){
    let m_len = [31,28,31,30,31,30,31,31,30,31,30,31]; //月份的天数
    let dd = new Date(date);
    let y = dd.getFullYear();
    let m = dd.getMonth() + 1;
    let d = dd.getDate();
    if(m + num > 12){
      y = y + num;
      m = 1;
    } else if(m + num == 0) {
      y = y + num;
      m = 12;
    } else {
      m = m+num;
    }
    m_len[1] = (m == 2 && this.leapYear(y)) ? 29 : 28;
    return {year: y, month: m, day: d, monthLen: m_len[m - 1]};
  }
  // 点击选择日期
  selectDay(e:any){//e可能是整数或者字符串
    //    if(!e) return;
    if(e.label == 'last'){
      this.cutMonth(-1);
    }
    if(e.label == 'next'){
      this.cutMonth(1);
    }
    this.isSelectDay = e.time;
    console.log(this.isSelectDay)
  }

  // 格式化时间
  formatDate(date:Date, fmt:string) {
    let ret;
    let o = {
      "y+": date.getFullYear(),
      "M+": date.getMonth() + 1,
      "d+": date.getDate(),
      "H+": date.getHours(),
      "m+": date.getMinutes(),
      "s+": date.getSeconds(),
      "W+": date.getDay(),
    };
    for (let k in o) {
      ret = new RegExp("(" + k + ")").exec(fmt);
      if (ret) {
        let str = o[k].toString();
        str = str.padStart(2,0);
        fmt = fmt.replace(ret[1], str);
      }
    }
    return fmt;
  }
  // 判断是否是闰年，是返回true，不是返回false
  leapYear(year:number) {
    if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
      return true
    }
    return false;
  }

  build() {
    Column() {
      Row(){
        Text('<')
          .fontSize(20)
          .margin(10)
          .fontColor(Color.Grey)
          .onClick(() => {
            this.cutMonth(-1)
          })
        Text(this.time_title)
          .fontSize(20)
          .margin(10)
          .fontColor(Color.Black)
        Text('>')
          .fontSize(20)
          .margin(10)
          .fontColor(Color.Grey)
          .onClick(() => {
            this.cutMonth(1)
          })
        Button({type: ButtonType.Normal}){
          Text('今天')
            .fontSize(20)
            .fontColor(Color.Blue)
        }
        .height(20)
        .backgroundColor(Color.White)
        .margin({right:15,left:18})
        .onClick(() => {
          this.initDay(this.today)
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      Row() {
        ForEach(this.weekList, (item: any, index?: number) => {
          Text(`${item}`)
            .width(30)
            .fontSize(20)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      ForEach(this.dayList, (item: any) => {// 循环数组创建每一个Item
        Row(){
          ForEach(item, (i:any) => {
            if(i.label==="at"&&i.time===this.isSelectDay){
              Text(i.day.toString())
                .fontSize(20)
                .width(30)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Pink)
                .borderRadius(15)
                .onClick(() => { this.selectDay(i) })
            }
            else if(i.label==="at"){
              Text(i.day.toString())
                .fontSize(20)
                .width(30)
                .textAlign(TextAlign.Center)
                .borderRadius(15)
                .onClick(() => { this.selectDay(i) })
            }
            else if(i.label==="last"||i.label==="next"){
              Text(i.day.toString())
                .fontSize(20)
                .fontColor(Color.Grey)
                .width(30)
                .textAlign(TextAlign.Center)
                .onClick(() => { this.selectDay(i) })
              //                .onAppear(() => {
              //                  console.log(i.day)
              //                })
            }
          })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        //        .onAppear(() => {
        //          console.log(JSON.stringify(item))
        //        })
      })
      Row() {
        Button('取消')
          .height(20)
          .fontSize(20)
          .backgroundColor(Color.White)
          .fontColor(Color.Blue)
          .onClick(() => {
            this.controller.close()
            this.cancel()
          })
        Button('|')
          .height(20)
          .fontSize(20)
          .backgroundColor(Color.White)
          .fontColor(Color.Grey)
        Button('确定')
          .height(20)
          .fontSize(20)
          .backgroundColor(Color.White)
          .fontColor(Color.Blue)
          .onClick(() => {
            this.controller.close()
            this.confirm()
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .height('55%')
    .justifyContent(FlexAlign.SpaceAround)
    .onAppear(() => { this.initDay(this.currentYM) })
  }
}