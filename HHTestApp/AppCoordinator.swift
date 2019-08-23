import UIKit

class AppCoordinator {
//  var coordinator: RootCoordinator!
  
  func start(window: UIWindow, moduleAssembler: ModuleAssembler) {
    let coordinator = RootCoordinator()
    coordinator.start(window: window, moduleAssembler: moduleAssembler)
  }
}
