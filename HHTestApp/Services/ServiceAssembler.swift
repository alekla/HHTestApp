protocol ServiceAssembler: AnyObject {
  var authService: AuthorizationService {get}
}

class ServiceAssemblerImp: ServiceAssembler {
  lazy var authService: AuthorizationService = {
    return AuthorizationServiceImp()
  }()
}
