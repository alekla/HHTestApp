import UIKit

protocol ModuleAssembler: AnyObject {
  func makeRootModule() -> (RootViewControllerOutput, UINavigationController)
  func makeAuthorizationModule() -> UIViewController
}

class ModuleAssemblerImp: ModuleAssembler {
  let serviceAssembler: ServiceAssembler
  init(serviceAssembler: ServiceAssembler) {
    self.serviceAssembler = serviceAssembler
  }
  
  func makeRootModule() -> (RootViewControllerOutput, UINavigationController) {
    let view = makeNavigationModule()
    guard let root = view.viewControllers[0] as? RootViewControllerOutput else { fatalError() }
    return (root, view)
  }
  
  func makeAuthorizationModule() -> UIViewController {
    let view: AuthorizationViewController = Storyboard.authorization.instantiate()
    view.keyboardHandler = KeyboardHandler(delegate: view)
    view.controller = AuthorizationControllerImp(
      view: view,
      authService: serviceAssembler.authService)
    return view
  }
  
  // MARK: - Private Methods
  private func makeNavigationModule() -> UINavigationController {
    let view: NavigationViewController = Storyboard.root.instantiate()
    return view
  }
}
