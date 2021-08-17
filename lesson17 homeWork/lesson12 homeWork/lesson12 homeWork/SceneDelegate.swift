//
//  SceneDelegate.swift
//  lesson12 homeWork
//
//  Created by Женя  on 23.07.21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
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

//Дз
//Сделать таймер в шашках в формате 00:00 (мин:сек). Добавьте в проект любой кастомный шрифт и используйте его на таймере. Кастомизируйте его через attributedString. Продолжайте кастомизировать приложения (например делать крутые кнопки, возможно с какими-нибудь анимациями, как я делал это на уроке). Сделать так, чтобы шашками можно было пользоваться по очереди. Сначала белыми, потом чёрными, потом белыми, потом чёрными и тд. Используйте для этого enum

//ДЗ
//Доделываем наконец шашки (выравниваемся по дз, кто просрочил). Добавить на экране настроек кнопку "About" (или что-то такое)
//При нажатии на эту кнопку переходи на новый экран с UIScrollView, где будет описана история шашек с интересными картинками! Сделайте красиво




