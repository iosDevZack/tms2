//
//  AppDelegate.swift
//  lesson16 homeWork
//
//  Created by Женя  on 3.08.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

//Дз на практику по таблицам
//
//1. Создайте таблицу которая содержит 200 ячеек. done
//2. для каждой ячейки генирируйте радномный цвет.done
//3. RGB данные пишите в тексте ячейки, например: RGB(10,20,255)done
//4. Также раскрашивайте текст ячейки этим цветом.done
//5. Теперь создайте класс, который содержит цвет и имя.done
//6. В viewDidLoad сгенерируйте 200 объектов такого класса done
//7. Положите их в массив и отобразите в таблице. done
// 8. Создайте также кнопку, при нажатии на которую, будет переход на следующий экран с таблицей. done
//9. Создайте класс Студент. Сгенерируйте 20-30 разных студентов. done
//10. В таблице создавайте создайте ячейку с двумя UILabel. В первом выводите ФИО, а во втором средний балл. done
//12. Если средний бал низкий - окрашивайте имя студента в красный цвет
//13. Отсортируйте студентов в алфовитном порядке и отобразите в таблице.
//14. Средний бал для студентов ставьте рандомно от 2 до 5
//15. После того, как вы сгенерировали студентов вам надо их разбить на группы:
//отличники, хорошисты, троечники и двоечники
//16. Каждая группа это секция с соответствующим названием.
//17. Студенты внутри своих групп должны быть в алфовитном порядке
//18. Отобразите группы студентов с их оценками в таблице.
