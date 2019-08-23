import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.makeKeyAndVisible()
    
    let serviceAssembler = ServiceAssemblerImp()
    let moduleAssembler = ModuleAssemblerImp(serviceAssembler: serviceAssembler)
    let coordinator = AppCoordinator()
    coordinator.start(window: window, moduleAssembler: moduleAssembler)
      
    return true
  }
}

