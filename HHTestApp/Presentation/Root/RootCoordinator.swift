import UIKit

class RootCoordinator {
  private weak var window: UIWindow!
  private var moduleAssembler: ModuleAssembler!
  private weak var navigation: UINavigationController!
  
  func start(window: UIWindow, moduleAssembler: ModuleAssembler) {
    self.window = window
    self.moduleAssembler = moduleAssembler
    openRootModule()
  }
  
  private func openRootModule() {
    let (view, navigation) = moduleAssembler.makeRootModule()
    self.navigation = navigation
    view.onOpenAuth = { 
      self.openAuthModule()
    }
    window.rootViewController = navigation
  }
  
  private func openAuthModule() {
    let view = moduleAssembler.makeAuthorizationModule()
    
    navigation.pushViewController(view, animated: true)
  }
}
