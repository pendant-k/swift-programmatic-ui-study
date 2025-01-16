// TODO: Check Result Type on Swift

import UIKit

class FollowerListVC: UIViewController {
    // get from other vc (Search VC here)
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkManager.shared.getFollowers(for: username, page: 1) { result in

            switch result {
            case .success(let followers):
                print("Followers.count = \(followers.count)")

            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happen", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
