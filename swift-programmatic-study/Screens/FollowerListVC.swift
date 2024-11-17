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
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
