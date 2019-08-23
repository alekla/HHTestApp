import UIKit

class AuthorizationViewController: UIViewController {
  // MARK: - Types
  enum Constants {
    static let title = "Авторизация"
    static let emailTitle = "Почта"
    static let passwordTitle = "Пароль"
    static let passwordDot = "*"
    static let createAccountTitle = "У мня еще нет аккаунта. Создать."
    static let restorPasswordTitle = "Забыли пароль?"
  }
  
  @IBOutlet weak var topConstraint: NSLayoutConstraint!
  // MARK: - IBOutlet
  @IBOutlet weak var componentsContainerView: UIView!
  @IBOutlet private weak var emailLabel: UILabel!
  @IBOutlet private weak var emailTextField: UITextField!
  @IBOutlet private weak var passwordLabel: UILabel!
  @IBOutlet private weak var passwordTextField: RightViewTextField!
  @IBOutlet private var bottomViewLines: [UIView]!
  @IBOutlet private weak var centeYComponentsConstraint: NSLayoutConstraint!
  @IBOutlet private weak var enterButton: EnterButton!
  @IBOutlet private weak var createAccountButton: UIButton!
  
  // MARK: - Public Properties
  var keyboardHandler: KeyboardHandler!
  var controller: AuthorizationController!
  var passwordText = ""
  
  // MARK: - AuthorizationViewController(*)
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupLabels()
    setupTextFields()
    setupEnterButton()
    setupCreateAccountButton()
    setupBottomViewLines()
  }
  
  // MARK: - IBAction
  @IBAction func authUser(_ sender: UIButton) {
    view.endEditing(true)
    enterButton.isEnabled = false
    let email = emailTextField.text ?? ""
    let password = passwordText
    validateInputData(email: email, password: password)
    controller.authUserRequest(
      email: email,
      password: password) { [weak self] result in
        guard let self = self else { return }
        self.enterButton.isEnabled = true
        switch result {
        case .failure(let error):
          switch error {
          case .noInternet:
             self.showAlert(with: "Ошибка", message: "Неверный email/пароль")
          case .custom(let error):
             print(error)
             self.showAlert(with: "Ошибка", message: "Отсутствует соединение с интернетом")
          }
        case .success(let response):
          self.showAlert(with: "Погода", message: response.text)
        }
    }
  }
  
  @IBAction func createAccount(_ sender: UIButton) {
  // TODO: - add logics
  }
  
  // MARK: - Private Methods
  private func setupView() {
    view.backgroundColor = UIColor.white
    title = Constants.title
  }
  
  private func setupLabels() {
    [emailLabel, passwordLabel].forEach {
      let title = $0 == emailLabel ? Constants.emailTitle : Constants.passwordTitle
      $0?.makeStyle(
        title: title,
        align: .left,
        font: UIFont.systemFont(ofSize: 13, weight: .regular),
        color: UIColor.Control.Label.gray,
        kern: 0.13)
    }
  }
  
  private func setupTextFields() {
    [passwordTextField, emailTextField].forEach {
      let title = $0 == emailTextField ? Constants.emailTitle : Constants.passwordTitle
      $0?.makeStyle(
        placeholder: title,
        align: .left,
        font: UIFont.systemFont(ofSize: 16, weight: .regular),
        color: UIColor.Control.TextField.gray,
        kern: -0.32)
      $0?.delegate = self
      $0?.addTarget(
        self,
        action: #selector(textFieldValueChanged(_:)),
        for: .editingChanged)
    }
    passwordTextField.rightViewMode = .always
    passwordTextField.rightView = makeRestorePasswordButton()
  }
  
  private func setupEnterButton() {
    
  }
  
  private func setupCreateAccountButton() {
    createAccountButton.makeStyle(
      title: Constants.createAccountTitle,
      align: .center,
      font: UIFont.systemFont(ofSize: 15, weight: .regular),
      textColor: UIColor.Control.Button.Restore.blue,
      kern: -0.16)
  }
  
  private func setupBottomViewLines() {
    bottomViewLines.forEach {
      $0.backgroundColor = UIColor.Control.View.gray
    }
  }
  
  private func makeRestorePasswordButton() -> UIButton {
    let button = UIButton(
      frame: CGRect(
        origin: .zero,
        size: CGSize(
          width: 113, height: 30)))
    button.makeStyle(
      title: Constants.restorPasswordTitle,
      align: .center,
      font: UIFont.systemFont(ofSize: 12, weight: .regular),
      textColor: UIColor.Control.Button.CreateAccount.gray,
      kern: -0.13)
    button.layer.cornerRadius = 4
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.Control.Button.Restore.border.cgColor
    button.addTarget(
      self,
      action: #selector(restorePassword),
      for: .touchUpInside)
    return button
  }
  
  @objc func restorePassword() {
     showAlert(with: "Уведомление", message: "Ссылка для восстановления отправлена на почту")
  }
  
  private func validateInputData(email: String, password: String) {
    guard !email.isEmpty else {
      showAlert(with: "Ошибка", message: "Поле ввода почты пустое")
      return
    }
    
    guard controller.isEmailValid(email) else {
      showAlert(with: "Ошибка", message: "Введен некоректный адрес почты")
      return
    }
    
    guard !password.isEmpty else {
      showAlert(with: "Ошибка", message: "Поле ввода пароля пустое")
      return
    }
    
    guard controller.isPasswordValid(password) else {
      showAlert(with: "Ошибка", message: "Пароль должен содержать минимум 6 символов, минимум 1 строчную букву, 1 заглавную, и 1 цифру")
      return
    }
  }
}

// MARK: - UITextFieldDelegate
extension AuthorizationViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case emailTextField:
      passwordTextField.becomeFirstResponder()
    case passwordTextField:
      passwordTextField.endEditing(false)
    default:
      break
    }
    return true
  }
  
  @objc func textFieldValueChanged(_ textField: UITextField) {}
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard textField == passwordTextField else { return true }
    

    var hashPassword = String()
    let newChar = string.first
    let offsetToUpdate = passwordText.index(passwordText.startIndex, offsetBy: range.location)
    
    if string.isEmpty {
      let distance = passwordText.distance(from: passwordText.startIndex, to: offsetToUpdate)
      if distance == 0 {
        passwordText = ""
      } else {
        passwordText.remove(at: offsetToUpdate)
      }
      
      return true
    }
    else {
      passwordText.insert(newChar!, at: offsetToUpdate)
    }
    
    for _ in 0..<passwordText.count {  hashPassword += Constants.passwordDot }
    textField.text = hashPassword
    textFieldValueChanged(textField)
    return false
  }
}

// MARK: - KeyboardHandlerDelegate
extension AuthorizationViewController: KeyboardHandlerDelegate {
  func keyboardStateChanged(input: UIView?, state: KeyboardState, info: KeyboardInfo) {
    var buttonInset: CGFloat = 0

    switch state {
    case .frameChanged, .opened:
      buttonInset = info.endFrame.height
    case .hidden:
      buttonInset = 0
    }
    if buttonInset > 0 {
      var offSet: CGFloat = 0
      if #available(iOS 11.0, *) {
        offSet = view.safeAreaInsets.bottom
      } else {
        offSet = 0
      }
      buttonInset = -(buttonInset - offSet) / 2
    }
    
    centeYComponentsConstraint.constant =  buttonInset
    info.animate ({ [weak self] in
      self?.view.layoutIfNeeded()
    })
  }
}

// MARK: - AuthorizationControllerInput
extension AuthorizationViewController: AuthorizationControllerInput {
  
}
