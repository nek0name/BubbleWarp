package ohos_app_cangjie_entry

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import cj_res_entry.*
import std.collection.*
import ohos.image.Image as MultiImage
import ohos.image.Component as ImageComponent
import ohos.image.InitializationOptions
import ohos.image.PixelMapFormat
import ohos.image.PixelMap
import ohos.image.createPixelMap
import ohos.image.Size as UniqueImageSize
import ohos.prompt_action.*
import std.collection.ArrayList



type ObservedMatrix = ObservedArray<(Bool,Int64)>
@Component
class BubbleLine {
    @Prop var data: ObservedMatrix
    func build() {
        Stack {
            Grid {
                ForEach(data, itemGeneratorFunc: { _: (Bool,Int64), i: Int64 =>
                            GridItem {
                            if(data[i][0])
                            {
                                Image(@r(app.media.White_Chess)).width(40).height(40).border(width: 1.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                            }
                            else{
                                Image(@r(app.media.Black_Chess)).width(40).height(40).border(width: 1.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                            }
                        }
                        })
            }
            .columnsTemplate("1fr 1fr 1fr 1fr 1fr 1fr 1fr")
            .rowsTemplate("1fr")
            .width(100.percent)
        }
    }
}

@Entry
@Component
class EntryView {
    @State var data: ObservedArray<ObservedMatrix> =
        ObservedArray(Array(6, { _ => ObservedArray(Array(6,item : (true,0))) }))




    func build() {
        Column {
            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[0])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[1])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[2])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[3])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xFFECA1)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[4])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[5])}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            Button("换一张")
            .onClick{
                evt => this.data = ObservedArray(Array(6, { _ => ObservedArray(Array(6,item : (true,0))) }))
            }
            .fontSize(10)
            .margin(top:60)

        }.margin(top: 10.percent)
        //.backgroundColor(0x5DE2E7)
        .padding(top:50)
        .border(width: 1.vp)
        .borderStyle(BorderStyle.Dashed)
    }
}