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
import ohos.image.Size as UniqueIm
import ohos.prompt_action.*
import std.collection.ArrayList
import std.sync.*
import std.time.*


type ObservedMatrix = ObservedArray<(Bool,Int64)>
@Component
class BubbleLine {
    @Prop var data: ObservedMatrix
    @Prop var isType2:Bool
    @State var isShow:Bool=true
    @State var wideSize:Length=40.vp
    @State var heightSize:Length=40.vp

    func build() {
        Stack {
            Grid {
                ForEach(data, itemGeneratorFunc: { _: (Bool,Int64), i: Int64 =>
                            GridItem {
                            if(data[i][0])
                            {
                                if(isType2){
                                    Image(@r(app.media.Before2)).width(this.wideSize).height(this.heightSize).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                        if (this.isShow) {
                                            animateTo(AnimateParam(
                                                duration: 50,
                                                curve: Curve.EaseOut,
                                                iterations: 1,
                                                playMode: PlayMode.Normal,
                                                onFinish: {=> AppLog.info("play end")
                                                                animateTo(AnimateParam(
                                                                    duration: 100,
                                                                    curve: Curve.EaseOut,
                                                                    iterations: 1,
                                                                    playMode: PlayMode.Normal,
                                                                    onFinish: {=> AppLog.info("play end")
                                                                            data[i] = (false,data[i][1])
                                                                        }
                                                                ), {=>
                                                                    this.wideSize = 40.vp
                                                                    this.heightSize = 40.vp
                                                                    })
                                                                }),
                                                {=>
                                                this.wideSize = 30.vp
                                                this.heightSize = 30.vp
                                                })
                                        }
                                        })
                                }else{
                                    Image(@r(app.media.Before3)).width(this.wideSize).height(this.heightSize).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                        if (this.isShow) {
                                            animateTo(AnimateParam(
                                                duration: 50,
                                                curve: Curve.EaseOut,
                                                iterations: 1,
                                                playMode: PlayMode.Normal,
                                                onFinish: {=> AppLog.info("play end")
                                                                animateTo(AnimateParam(
                                                                    duration: 100,
                                                                    curve: Curve.EaseOut,
                                                                    iterations: 1,
                                                                    playMode: PlayMode.Normal,
                                                                    onFinish: {=> AppLog.info("play end")
                                                                            data[i] = (false,data[i][1])
                                                                        }
                                                                ), {=>
                                                                    this.wideSize = 40.vp
                                                                    this.heightSize = 40.vp
                                                                    })
                                                                }),
                                                {=>
                                                this.wideSize = 30.vp
                                                this.heightSize = 30.vp
                                                })
                                        }
                                        })
                                }
                            }
                            else{
                                if(isType2){
                                    Image(@r(app.media.After2)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (false,data[i][1])
                                        })
                                }else{
                                    Image(@r(app.media.After3)).width(40).height(40).border(width: 0.vp).borderStyle(BorderStyle.Dashed)
                            .onClick({evt =>
                                    data[i] = (false,data[i][1])
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
    @State var isType:Bool=true


    func build() {
        Column {
            GridRow(columns: 1){
                GridCol { BubbleLine(data : data[0],isType2:isType)}
            }.width(100.percent)
            .height(60)
            //.backgroundColor(0x92C3E4)
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

            Row {
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

                Blank().width(20)

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
                }
                    .margin(top: 20, bottom: 10)          // 整个 Row 的外边距
                    .padding(left: 10, right: 10)  // 内边距，可选
                    .width(100.percent)       // 让 Row 占满宽度
                    .justifyContent(FlexAlign.Center) // 水平居中，可根据需求改为 Start/End/SpaceBetween

            }.margin(top: 10.percent)
            .backgroundColor(
                if(isType) {0xFFFFFF} else {0xB3D3E8})
            .padding(top:50)
            .border(width: 1.vp)

            .borderStyle(BorderStyle.Dashed)
    }

}






























