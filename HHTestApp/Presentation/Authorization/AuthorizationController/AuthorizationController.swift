import Foundation

protocol AuthorizationController: AnyObject {
  
  func isPasswordValid(_ string: String) -> Bool
  func isEmailValid(_ string: String) -> Bool
  func authUserRequest(email: String, password: String, completion: @escaping Completion<DarkskyResponse, AuthorizationServiceError>)
}

protocol AuthorizationControllerInput: AnyObject {
  
}

class AuthorizationControllerImp: AuthorizationController {
  weak var view: AuthorizationControllerInput!
  var authService: AuthorizationService!
  
  init(view: AuthorizationControllerInput, authService: AuthorizationService) {
    self.view = view
    self.authService = authService
  }
  
  func isPasswordValid(_ string: String) -> Bool {
//    let uppers = CharacterSet.uppercaseLetters
//    let lowers = CharacterSet.lowercaseLetters
//    var uCount = 0
//    var lCount = 0
//    for c in string.unicodeScalars {
//      if uppers.contains(c) {
//        uCount += 1
//      } else if lowers.contains(c) {
//        lCount += 1
//      }
//    }
//    return lCount > 0 && uCount > 0 && string.count >= 6
    return StringValidation.isValid(string: string, type: .pass)
  }
  
  func isEmailValid(_ string: String) -> Bool {
    return StringValidation.isValid(string: string, type: .mail)
  }
  
  func authUserRequest(email: String, password: String, completion: @escaping Completion<DarkskyResponse, AuthorizationServiceError>) {
    self.authService.auth(email: email, pasword: password, completion: completion)
  }
}
