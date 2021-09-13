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
//Сделать таймер в шашках в формате 00:00 (мин:сек). Добавьте в проект любой кастомный шрифт и используйте его на таймере. Кастомизируйте его через attributedString. Продолжайте кастомизировать приложения (например делать крутые кнопки, возможно с какими-нибудь анимациями, как я делал это на уроке). Сделать так, чтобы шашками можно было пользоваться по очереди. Сначала белыми, потом чёрными, потом белыми, потом чёрными и тд. Используйте для этого enum  СДЕЛАНО

//ДЗ
//Доделываем наконец шашки (выравниваемся по дз, кто просрочил). Добавить на экране настроек кнопку "About" (или что-то такое)
//При нажатии на эту кнопку переходи на новый экран с UIScrollView, где будет описана история шашек с интересными картинками! Сделайте красиво СДЕЛАНО

//ДЗ
//возвращаемся к шашкам
//Заходите в шашки, начинаете новую игру, идет время, двигайте ваши шашки как хотите. При нажатии на кнопку возврата в главное меню выскакивает алерт о вопросе, сохранить данную партию или нет. Если нет, то просто выходите и все
//если нажимаете да, то сохраняете данные в файл о партии (тут нужно подумать вам как это сделать). При следующем заходе в шашки и нажатии на новую игру, вы проверяете есть ли файл с сохраненной партией. Если есть, то спрашиваете продолжить ли партию. Если выбираете да, то считываете данные о партии из файла и продолжаете игру с прошлого момента. При заходе на доску, удаляйте файл с партией СДЕЛАНО

//ДЗ
//В шашках, в пункт настроек добавьте выбор стиля шашек. Т.е сделайте UICollectionView в котором можно выбрать вариант отображения ваших шашек (грубо говоря чтобы можно было поменять картинку шашек). Можете обмениваться картинками, если хотите. Выбранный результат нужно сохранять и применять к игре. Выбранные шашки храните в UserDefaults

//ДЗ
//Добавьте в настройки, в шашках, пункт с выбором фона на контроллере с игрой. Фон выбираем из галлереи фотографии через picker. Выбранный фон, так же сохранять (сохранять нужно Data). На главном меню, кастомные кнопки сделайте через xib, в я делал на уроке.
//В идеале создать один класс общий со всеми сохранёнными данными, который будет содержать массив шашек, время таймера, картинка шашек, картинка фона и тд

//ДЗ
//продолжаем шашки. Делаем чтобы шашками можно ходить только по диагонали, т.е туда, куда они реально могут ходить, а не в любую черную пустую позицию
