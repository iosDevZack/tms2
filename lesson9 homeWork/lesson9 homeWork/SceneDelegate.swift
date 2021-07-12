//
//  SceneDelegate.swift
//  lesson9 homeWork
//
//  Created by Женя  on 10.07.21.
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

//Сделать два экрана в сториборде. На первом экране есть текстовое поле и кнопка. В текстовое поле необходимо ввести имя, а при нажатии на кнопку переход на второй экран. Введённое имя, необходимо передать с первого экрана на второй экран.
//На втором экране должно быть следующее: текст: «Привет /введённое имя на первом экране/, введи свои данные: возраст и пол.» и два текстовых поля. Причём в поле возраста, можно вводить только цифры, а в поле пол, только одну букву. M или F.
//Так же есть кнопка, которая закрывает второй экран и возвращается на первый. Причём, если на втором экране возраст был больше 50 и пол М, то цвет фона на первом экране должен стать красным цветом, если пол F, то желтым цветом, в остальных случаях цвет фона зелёный.

//    1 Создать два экрана в сториборде     (Done)
//
//    2 Создать первый экран в сториборде       (Done)
//
//    3 Создать на первом экране текстовое поле     (Done)
//      В текстовое поле необходимо ввести имя

//    4 Создать на первом экране кнопку     (Done)
//
//
//
//    5 Создать второй экран        (Done)
//
//    6 Создать на втором экране лэейбл: "Привет /введённое имя на первом экране/       (Done)
//
//    7 Создать на втором экране лэйбл: "Введи свои данные: возраст и пол"      (Done)
//
//    8 Создать на втором экране текствое поле(ВОЗРОСТ) в котором можно вводить только цифры        (Done)
//
//    9 Создать на втором экране текстовое поле(ПОЛ) в котором можно вводить только одну букву M или F          (Done)
//
//    10 Создать на втором экране кнопку "Done" на клавиатуре (ввода) в текстовом поле (ПОЛ)
//      либо просто кнопка которая будет возвращать нас на первый экран     (Done)
//
//
//
//    11 Создать метод, при котором, при нажатии на кнопку мы перейдем с первого экрана
//        на второй экран       (Done)
//
//    12 Создать метод при котором, при переходе на второй экран имя введенное в поле ввода
//      на первом экране передасться на второй экран        (Done)
//
//    13 Создать метод, при котором, на втором экране
//        ЕСЛИ возраст был больше 50 и пол М,
//      ТО цвет фона на первом экране должен стать красным цветом
//        ИНАЧЕ цвет фона на первом экране зелёный
//
//      ЕСЛИ пол F, ТО первый экран станет желтым цветом, ИНАЧЕ цвет фона зелёный.  ()
