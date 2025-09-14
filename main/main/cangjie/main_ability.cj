package ohos_app_cangjie_entry

internal import ohos.base.AppLog
internal import ohos.ability.AbilityStage
internal import ohos.ability.LaunchReason
internal import cj_res_entry.app
import crypto.x509.Signature
import ohos.window.SystemBarProperties

class MainAbility <: Ability {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("MainAbility onWindowStageCreate.")
        let windowClass=windowStage.getMainWindow()
        windowClass.setWindowSystemBarEnable(["status","navigation"])
        windowClass.setWindowLayoutFullScreen(true)
        let systemBarProperties=SystemBarProperties(
            statusBarColor:"#ff00ff",
            navigationBarColor:"#00ff00",
            statusBarContentColor:"#ffffff",
            navigationBarContentColor:"#00ffff"
        )
        windowStage.loadContent("EntryView")
    }
}
