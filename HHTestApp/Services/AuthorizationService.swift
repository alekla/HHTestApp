import Alamofire

protocol AuthorizationService: AnyObject {
  
  /// This function handles user authorizetion process
  ///
  /// - Parameters:
  ///   - email: User entered email string
  ///   - pasword: User entered password string
  ///   - completion: Completion block with authorization check result
  func auth(email: String, pasword: String, completion: @escaping Completion<DarkskyResponse, AuthorizationServiceError>)
}

class AuthorizationServiceImp: AuthorizationService {
  
  let networkReachabilityManager = NetworkReachabilityManager()
  
  func auth(email: String, pasword: String, completion: @escaping Completion<DarkskyResponse, AuthorizationServiceError>) {
    let exclude = "?exclude=minutely,hourly,daily,alerts,flags";
    let unit = "?units=si";
    let path = "/60.051917,%2030.400736" + exclude + unit
    
    let url = Constants.API.baseURL + Constants.API.APIToken + path
    AF.request(url).responseDecodable { (response: DataResponse<DarkskyResponse>) in
      switch response.result {
      case .failure(let error):
        if self.networkReachabilityManager?.isReachable ?? false {
           completion(.failure(.noInternet))
        } else {
           completion(.failure(.custom(error)))
        }
      case .success(let data):
        completion(.success(data))
      }
    }
  }
}
