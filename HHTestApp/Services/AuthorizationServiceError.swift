
/// Enum representing AuthorizationService errors
///
/// - fail: Default Error
enum AuthorizationServiceError: Error {
  case noInternet
  case custom(Error)
}
