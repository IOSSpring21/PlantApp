//
//  SettingsViewController.swift
//  Botanica
//
//  Created by Sam Zakeri on 6/1/21.
//

import UIKit
import UserNotifications



class SettingsViewController: UIViewController {

    @IBOutlet weak var Notification: UIButton!
    @IBAction func didTapButton(){
        let alert = UIAlertController(title: nil, message: "Add reminder below by Hours/Minutes/Seconds" , preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Hours "
          })
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Minutes "
          })
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Seconds "
          })

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
            print("tapped Dismiss")
        }))
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: {action in
            let hour = Double((alert.textFields![0].text!)) ?? 0
            let minute = Double((alert.textFields![1].text!)) ?? 0
            let seconds = Double((alert.textFields![2].text!)) ?? 0

            let totalSeconds = (hour * 3600) + (minute * 60) + (seconds)
            
            let center = UNUserNotificationCenter.current()

            let content = UNMutableNotificationContent()
            content.title = "Water Notification"
            content.body = "Water your Plant!"
            content.sound = UNNotificationSound.default

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (totalSeconds), repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
            
            var timer = Timer()
            timer = Timer.scheduledTimer(withTimeInterval: totalSeconds,
                   repeats: false) {
               timer in
                self.callNotifAlert()
               }
        }))
        
        self.present(alert, animated: true)
    }
    
    func callNotifAlert(){
        let NotifAlert = UIAlertController(title: "Water Notification", message: "It's time to water your plant!" , preferredStyle: .alert)
        
        NotifAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in
            print("tapped Dismiss")
        }))
        
        self.present(NotifAlert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func scheduleLocal(){
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound];
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        center.getNotificationSettings { (settings) in
             if settings.authorizationStatus != .authorized {
                //Authorization Not Granted
                self.didTapButton()
             }
         }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
        let identifier = "UYLLocalNotification"
        
        let content = UNMutableNotificationContent()
        content.title = "jjjas"
        content.body = "Buydsakjshf"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

         center.add(request, withCompletionHandler: { (error) in
             if let error = error {
                 // Something went wrong
             }
         })
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
