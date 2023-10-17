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
@Component
export struct DatetimePicker_date {
  @State cur_height: number = 250; //组件高度
  @State cur_width: number = 360; //组件宽度

  @State cur_Date: string = "";//当前日期
  @State cur_Time: string = "";//当前时间


  @State years: string[] = ["1970", "1971", "1972", "1973", "1974"];
  @State selected_year: number = 0;//初始选中的 年 的下标

  @State months: string[] = ["01", "02", "03", "04", "05"];
  @State selected_month: number = 0;//初始选中的 月 的下标

  private days_normal: number[] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  private days_leap: number[] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  @State days: string[] = ["01", "02", "03", "04", "05"];
  @State selected_day: number = 0;//初始选中的 日 的下标

  @State hours: string[] = ["00", "01", "02", "03", "04"];
  @State selected_hour: number = 0;

  @State minutes: string[] = ["00", "01", "02", "03", "04"];
  @State selected_minute: number = 0;

  @State hasYear: boolean = false;
  @State hasMonth: boolean = false;
  @State hasDay: boolean = false;
  @State hasHour: boolean = false;
  @State hasMinute: boolean = false;

  @State visibility_Year: Visibility = Visibility.Hidden;
  @State visibility_Month: Visibility = Visibility.Hidden;
  @State visibility_Day: Visibility = Visibility.Hidden;
  @State visibility_Hour: Visibility = Visibility.Hidden;
  @State visibility_Minute: Visibility = Visibility.Hidden;

  @State year_picker_width: number = this.cur_width / 5;
  @State month_picker_width: number = this.cur_width / 5;
  @State day_picker_width: number = this.cur_width / 5;
  @State hour_picker_width: number = this.cur_width / 5;
  @State minute_picker_width: number = this.cur_width / 5;



  aboutToAppear(){
    //初始化 年 范围
    let k=0;
    for (let i = 1970; i <= 2100 ; i++) {
      this.years[k++] = "" + i;
    }

    //初始化 月 范围
    for (let i = 0; i < 12 ; i++) {
      if(i < 9)
        this.months[i] = "0" + (i+1);
      else
        this.months[i] = "" + (i+1);
    }

    //初始 日 范围
    this.getDays(this.years[this.selected_year], this.months[this.selected_month]);

    //初始化 小时 范围
    for (let i = 0; i < 24 ; i++) {
      if(i < 9)
        this.hours[i] = "0" + i;
      else
        this.hours[i] = "" + i;
    }

    //初始化 分钟 范围
    for (let i = 0; i < 60 ; i++) {
      if(i < 9)
        this.minutes[i] = "0" + i;
      else
        this.minutes[i] = "" + i;
    }

  }

  isLeapYear(year: string): boolean{
    let year_ = parseInt(year, 10);
    if( (year_ % 4 == 0 && year_ % 100 != 0) || year_ % 400 == 0)
      return true;
    return false;
  }

  getDays(year: string, month: string){
    let selected_month_ = parseInt(month, 10);//当前月份

    if(this.isLeapYear(year)){
      for (let i = 0; i < this.days_leap[selected_month_-1]; i++) {
        if(i < 9)
          this.days[i] = "0" + (i+1);
        else
          this.days[i] = "" + (i+1);
      }
    }
    else{
      for (let i = 0; i < this.days_normal[selected_month_-1]; i++) {
        if(i < 9)
          this.days[i] = "0" + (i+1);
        else
          this.days[i] = "" + (i+1);
      }
    }
  }

  build() {
    Column() {
      Row(){
        Text("取消")
          .width("100")
          .height("50")
          .margin({left: 20})
          .fontSize(20)
          .fontColor(Color.Blue)


        Text("确认")
          .width("100")
          .height("50")
          .fontColor(Color.Blue)
          .fontSize(20)
          .margin({left:this.cur_width * 0.5})
          .onClick(() => {
            console.log("当前选择的日期为：" + this.cur_Date + this.cur_Time);
          })
      }
      .width("100%")

      Row() {
        Column(){
          TextPicker({range:this.years, selected: this.selected_year})//年
            .onChange((value: string, index: number) => {
              this.selected_year = index;
              this.days = [];
              this.getDays(this.years[this.selected_year], this.months[this.selected_month]);
              console.log(this.years[this.selected_year] + "====" + this.months[this.selected_month] + "=== " +this.days[this.selected_day])
            })
        }
        .margin({left: -10})
        .width(this.year_picker_width + 10)
        .visibility(this.visibility_Year)
        // .borderWidth(3)

        Column(){
          TextPicker({range: this.months, selected: this.selected_month})//月
            .onChange((value: string, index: number) => {
              this.selected_month = index;
              this.days = [];
              this.getDays(this.years[this.selected_year], this.months[this.selected_month]);
              console.log(this.years[this.selected_year] + "====" + this.months[this.selected_month] + "=== " +this.days[this.selected_day]);
            })
        }
        .width(this.month_picker_width)
        .visibility(this.visibility_Month)
        // .borderWidth(3)
        // .borderColor(Color.Red)

        Column(){
          TextPicker({range: this.days, selected: this.selected_day})//日
            .onChange((value: string, index: number) => {
              this.selected_day = index;
              this.days = [];
              this.getDays(this.years[this.selected_year], this.months[this.selected_month]);
              console.log(this.years[this.selected_year] + "====" + this.months[this.selected_month] + " === " +this.days[this.selected_day]);
            })
        }
        .width(this.day_picker_width)
        .visibility(this.visibility_Day)
        // .borderWidth(3)
        // .borderColor(Color.Green)

        Column(){
          TextPicker({range: this.hours, selected: this.selected_hour})//时
            .onChange((value: string, index: number) => {
              this.selected_hour = index;
              console.log(this.hours[this.selected_hour] + "==h==" + this.minutes[this.selected_minute])
            })
        }
        .width(this.hour_picker_width)
        .visibility(this.visibility_Hour)
        // .borderWidth(3)
        // .borderColor(Color.Blue)


        Column(){
          TextPicker({range: this.minutes, selected: this.selected_minute})//分
            .onChange((value: string, index: number) => {
              this.selected_minute = index;
              console.log(this.hours[this.selected_hour] + "==m==" + this.minutes[this.selected_minute])
            })
        }
        .width(this.minute_picker_width)
        .visibility(this.visibility_Minute)
        // .borderWidth(3)
      }
      .height(this.cur_height)
      .width(this.cur_width)
    }
    .onAppear(() => {
      if(this.hasYear) {
        this.visibility_Year = Visibility.Visible;
      }
      else {
        this.visibility_Year = Visibility.Hidden;
      }

      if(this.hasMonth) {
        this.visibility_Month = Visibility.Visible;
      }
      else {
        this.visibility_Month = Visibility.Hidden;
      }

      if(this.hasDay) {
        this.visibility_Day = Visibility.Visible;
      }
      else {
        this.visibility_Day = Visibility.Hidden;
      }

      if(this.hasHour) {
        this.visibility_Hour = Visibility.Visible;
      }
      else {
        this.visibility_Hour = Visibility.Hidden;
      }

      if(this.hasMinute) {
        this.visibility_Minute = Visibility.Visible;
      }
      else {
        this.visibility_Minute = Visibility.Hidden;
      }

      let vis_num = 0;
      if(this.visibility_Year == Visibility.Visible)
        vis_num++;
      if(this.visibility_Month == Visibility.Visible)
        vis_num++;
      if(this.visibility_Day == Visibility.Visible)
        vis_num++;
      if(this.visibility_Hour == Visibility.Visible)
        vis_num++;
      if(this.visibility_Minute == Visibility.Visible)
        vis_num++;

      console.log("===" + vis_num)

      if(this.hasYear) {
        this.year_picker_width = this.cur_width / vis_num;
      }
      else {
        this.year_picker_width = 0;
      }

      if(this.hasMonth) {
        this.month_picker_width = this.cur_width / vis_num;
      }
      else {
        this.month_picker_width = 0;
      }

      if(this.hasDay) {
        this.day_picker_width = this.cur_width / vis_num;
      }
      else {
        this.day_picker_width = 0;
      }

      if(this.hasHour) {
        this.hour_picker_width = this.cur_width / vis_num;
      }
      else {
        this.hour_picker_width = 0;
      }

      if(this.hasMinute) {
        this.minute_picker_width = this.cur_width / vis_num;
      }
      else {
        this.minute_picker_width = 0;
      }

      if(this.hasYear && this.hasMonth && !this.hasDay && !this.hasHour && !this.hasMinute){
        for (let i = 0; i < this.years.length; i++) {
          this.years[i] = this.years[i] + " 年";
        }
        for (let i = 0; i < this.months.length; i++) {
          this.months[i] = this.months[i] + "月";
        }
      }

      this.cur_Date = this.years[this.selected_year] + " 年 " + this.months[this.selected_month] + " 月 " + this.days[this.selected_day] + " 日";
      this.cur_Time = this.hours[this.selected_hour] + " 时 " + this.minutes[this.selected_minute] + " 分";
    })
    .width(this.cur_width)
  }
}