// TODO: semantic UI 참고
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
