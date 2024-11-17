//
//  SceneDelegate.swift
//  swift-programmatic-study
//
//  Created by Donghan Kim on 11/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // window 전체 화면 채우기
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)

        // window에 windowScene 할당
        window?.windowScene = windowScene
        // root VC 연결
        window?.rootViewController = createTabbar()
        // window 실제로 보이게 적용
        window?.makeKeyAndVisible()

        configureNavigationBar()
    }

    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemBackground
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers = [createSearchNavigationController(), createFavoriteNavigationController()]
        return tabbar
    }

    func createSearchNavigationController() -> UINavigationController {
        // Search VC instance 생성
        let searchVC = SearchVC()
        // search viewcontroller 설정
        // tabbar 관련 설정
        searchVC.title = "검색"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        return UINavigationController(rootViewController: searchVC)
    }

    func createFavoriteNavigationController() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()

        favoritesListVC.title = "북마크"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        return UINavigationController(rootViewController: favoritesListVC)
    }

    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
