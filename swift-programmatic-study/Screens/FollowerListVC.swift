//
//  FollowerListVC.swift
//  swift-programmatic-study
//
//  Created by Donghan Kim on 11/17/24.
//

import UIKit

class FollowerListVC: UIViewController {
    // get from other vc (Search VC here)
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                // Here, self indicates UIViewController itself
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happen", message: errorMessage!, buttonTitle: "OK")
                return
            }

            print("Followers.count = \(followers.count)")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.isNavigationBarHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
