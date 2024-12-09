# Swift Programmatic UI

Screen VC 생성
- 각 Screen은 View, View를 관리하는 Controller로 구성됨

VC 내부에서는 subview 들의 configure 함수가 존재함

```swift
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
```

다음과 같은 configure 함수들을 실행하여 Screen 그려냄. 이때 `view.addSubview()` 매서드를 사용함

## CustomView 작성법
전체 예시 코드
- init 함수 내부에서 cufigure() 함수 실행
- configure 함수 내에서 modifier 관련 작업 실행
```swift
import UIKit

class GFButton: UIButton {
    override init(frame: CGRect) {
        // default super init 실행
        super.init(frame: frame)
        // custom code here
        configure()
    }

    // required when using storyboard
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 배경색과 title을 설정해서 초기화하는 커스텀 initializer
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }

    // 해당 class 내에서만 사용가능
    private func configure() {
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        // dynamic type 지원
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)

        // MARK: 직접 constraints 설정하기 위해서?

        translatesAutoresizingMaskIntoConstraints = false
    }
}

```
