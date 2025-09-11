package ohos_app_cangjie_entry

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import cj_res_entry.*
import ohos.image.Image as MultiImage
import ohos.image.Component as ImageComponent
import ohos.image.InitializationOptions
import ohos.image.PixelMapFormat
import ohos.image.PixelMap
import ohos.image.createPixelMap
import ohos.image.Size as UniqueImageSize


@Entry
@Component
class EntryView {
    var pixelMap: ?PixelMap = None
    @State var loaded: Bool = false
    @State var text: String = ""

    func build() {
        Column {
            Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start)) {
                //点击图片显示鼠标位置相对与组件左边缘与上边缘位置
                Row(0) {
                    Image(@r(app.media.Bubble_Warp)).onTouch({event =>
                        this.text = """
                        TouchType: ${event.eventType.toString()}
                            x: ${event.touches[0].x}
                            y: ${event.touches[0].y}
                            """
                            AppLog.info(this.text)
                            }).width(200.px)
                    .width(300)
                    .height(400)
                }

            }.backgroundColor(0x838383)
            .size(width: 300,height:400)

            Button("换一张")
            .shape(ShapeType.Capsule)
            .size(width: 100,height :50)
            .margin(top: 100)

            Text(this.text).padding(15).width(100.percent)
        }
        .height(700)
        .width(400)
        .padding(top:100)
        .backgroundColor(0xAFEEEE)
    }
}