// TODO: UIViewController 내용 정리 (공식 문서)
// TODO: UIKit 구조 정리
import UIKit

class SearchVC: UIViewController {
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    // computed property
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Dark mode -> dark
        // Light mode -> white
        view.backgroundColor = .systemBackground

        // attach subviews
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()

        // add dismiss keyboard event to full screen
        createDismissKeyboardTapGesture()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // TODO: 블로그 정리
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))

        view.addGestureRecognizer(tap)
    }

    // #selector -> 사용하려면 @objc 써야함
    @objc func pushFollowerListVC() {
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username.", buttonTitle: "OK")
            return
        }

        let followerListVC = FollowerListVC()
        // followerListVC 설정
        followerListVC.username = usernameTextField.text
        // title - UIViewController의 기본 프로퍼티
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }

    // UI Configuration

    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        // image 설정
        logoImageView.image = UIImage(named: "gh-logo")!

        // 기본적으로 4가지 constraints
        NSLayoutConstraint.activate([
            // 윗면 위치 기준
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            // horizontal 가운데 정렬
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //  set height, width
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    func configureTextField() {
        view.addSubview(usernameTextField)
        // self == SearchVC
        usernameTextField.delegate = self

        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            // trailing -> negative value
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    func configureCallToActionButton() {
        view.addSubview(callToActionButton)

        // 버튼에 이벤트 추가
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)

        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// deligate -> Listening
extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
