//
//  ContentViewModel.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation
import UIKit

class ContentViewModel: ObservableObject {
    
    @Published var count = -1
    var activityManager = ActivityManager.shared
    var timer: Timer?
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    var order = Order.getSampleOrder()
    var isOrderPlaced = false
    
    func startActivity() {
        self.count = 0
        self.endActivity()
        self.order = Order.getSampleOrder()
        activityManager.startActivity(data: order)
        self.isOrderPlaced = true
        startTimer() // dummy timer to update the activity after 5 seconds.
    }
    
    func endActivity() {
        self.isOrderPlaced = false
        activityManager.stopActivity()
        timer?.invalidate()
        UIApplication.shared.endBackgroundTask(self.backgroundTaskIdentifier)
        self.backgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
        self.count = -1
    }
    
    func startTimer() {
        timer?.invalidate()
        backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask(withName: "TimerBackgroundTask") {
            // Clean up code, called when the task is about to be terminated.
            UIApplication.shared.endBackgroundTask(self.backgroundTaskIdentifier)
            self.backgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
        }
        timer = Timer.scheduledTimer(
            timeInterval: 5,
            target: self,
            selector: #selector(fireTimer),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func fireTimer() {
        print("Timer fired!")
        count += 1
        
        if count >= 4 {
            print("stop")
            self.endActivity()
        }
        
        activityManager.updateActivity(orderStatus: OrderStatus(rawValue: Float(count)) ?? .placed)
    }
}
