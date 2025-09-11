package ohos_app_cangjie_entry

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import crypto.x509.X509Exception

@Entry
@Component
class EntryView {
    var settings:RenderingContextSettings = RenderingContextSettings(antialias:true)
    var context:CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)

    func build() {
        Row {
            Column {
                Canvas(context)
                .width(100.percent)
                .height(100.percent)
                .backgroundColor(0x1fbf41)
                .onReady(
                    { => drawPaper(this.context)}
                )

                Button("换一张")
                .fontSize(15)
                .fontColor(Color.BLACK)
                .shape(ShapeType.CircleType)
                .width(100)
                .height(100)
                .position(x: 140, y: 580)
                .backgroundColor(Color.WHITE)

            }.width(100.percent)
        }.height(100.percent)

    }

}

func drawPaper(context:CanvasRenderingContext2D){
    var startx = 85
    var starty = 120
    var xdistance = 70
    var ydistance = 80

    context.fillStyle(0xd4d4d4)
    context.fillRect(startx,starty,230,340)
    for(i in 0..3){
        for(j in 0..4){
            drawCircle(context,Float64(startx+40+i*xdistance),Float64(starty+40+j*ydistance),20.0)
        }
    }
}

func drawCircle(context:CanvasRenderingContext2D,x:Float64,y:Float64,radius:Float64){
    context.beginPath()
    context.arc(x,y,radius,0.0,6.283)
    context.fillStyle(Color.WHITE)
    context.fill()
    context.closePath()
}

