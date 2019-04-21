
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    mainScreen()
    return true
  }
  
  private func mainScreen() {
    let appRouter = AppRouter()
    let tabBar = appRouter.buildTabBar()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = tabBar
    window?.makeKeyAndVisible()
  }

}

