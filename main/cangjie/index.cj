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
    @Prop var isType2:Bool
    func build() {
        Stack {
            Grid {
                ForEach(data, itemGeneratorFunc: { _: (Bool,Int64), i: Int64 =>
                            GridItem {
                            if(data[i][0])
                            {
                                if(isType2){
                                    Image(@r(app.media.Before2)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                                }else{
                                    Image(@r(app.media.Before1)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                                }

                            }
                            else{
                                if(isType2){
                                    Image(@r(app.media.After2)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                                }else{
                                    Image(@r(app.media.After1)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (!data[i][0],data[i][1])
                                        })
                                }
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
//    @State var nowtype:Bubbletype=type2
    @State var isType:Bool=true


    func build() {
        Column {
            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[0],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[1],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[2],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[3],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xFFECA1)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[4],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[5],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0xCC6CE7)
            .margin(top:10)
            .padding(left:40)

            Button("换一张")
            .onClick {
            evt =>
            let rowIndices = 0..=5
            for (i in rowIndices) {
                let colIndices = 0..=5
                for (j in colIndices) {
                    this.data[i][j] = (true, 0)
                }
            }
        }

            Button("更换类型")
            .onClick{
                evt =>
                let rowIndices = 0..=5
                for (i in rowIndices) {
                    let colIndices = 0..=5
                    for (j in colIndices) {
                        this.data[i][j] = (true, 0)
                }
            }
                match(isType){
                    case true=>isType=false
                    case false=>isType=true
                }
            }

        }.margin(top: 10.percent)
        //.backgroundColor(0x5DE2E7)
        .padding(top:50)
        .border(width: 1.vp)

        .borderStyle(BorderStyle.Dashed)
    }

}
