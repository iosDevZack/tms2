//
//  TabBarViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 28.11.21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RCManager.shared.remoteConfigConnetced = {
            DispatchQueue.main.async {
                guard let vc1 = UIViewController.getViewController(by: "MainScreenViewController"),
                      let vc2 = UIViewController.getViewController(by: "MapViewController"),
                      let vc3 = UIViewController.getViewController(by: "GoogleMapsViewController"),
                      let vc4 = UIViewController.getViewController(by: "WeatherHistoryViewController"),
                      let vc5 = UIViewController.getViewController(by: "NewsViewController") else { return }
                if RCManager.shared.getBoolValue(from: .chooseGoogleMaps) {
                    self.viewControllers = [vc1, vc2, vc4, vc5]
                }else {
                    self.viewControllers = [vc1, vc3, vc4, vc5]
                }
            }
        }
        
        RCManager.shared.connected()
        
        let notificationCenter = UNUserNotificationCenter.current() // Создание алерт нотификации

        notificationCenter.getPendingNotificationRequests { requests in // Обращение к нотификации
//
//            guard let req = requests.first(where: {$0.identifier == "5days_notification"}) else { return } // Получаем ту нотификацию к которой будем обращаться (первая в массиве)
//
            notificationCenter.removePendingNotificationRequests(withIdentifiers: ["5days_notification"]) // Данный метод удаляет (не создает) уведомление если в приложение уже заходили (в указанный интервал)

            print("Notification remove")
        }

        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { result,
            error in
            guard result else { return }

            let content = UNMutableNotificationContent()  // Создание тела нотификации
            content.title = "Hello"
            content.sound = UNNotificationSound.default // Включаем звук у нотификации
            content.badge = 1
            content.body = "Maybe show you weather?"
            content.userInfo = ["current_vc": "WeatherInMyLocationViewController"]

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 30.0, repeats: false) // Время через которое будет выскакивать уведомление(нотификация), время указывается в секундах


            let request = UNNotificationRequest(identifier: "5days_notification", content: content, trigger: trigger) // Задаем идентификатор, что бы нашу нотификацию можно было как-то отличить. Identifier это любая рандомная строка - UUID().uuidString (генерируется рандомная строка)

            notificationCenter.add(request) { error_ in // Кладем нотификацию в нотификейшн центр, а если что-то не так выведем ошибку
                print(error_?.localizedDescription ?? "")

                print("Notification added")
            }
        }
    }


}
