//
//  LiveActivityManager.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation
import ActivityKit

class ActivityManager {
    
    var activity: Activity<OrderDeliveryStatusAttributes>?
    var activityID: String?
    
    static let shared = ActivityManager()
    
    private init() {}
    
    func startActivity(data: Order) {
        stopActivity()
        startNewLiveActivity(data: data)
    }
    
    func startNewLiveActivity(data: Order) {
        let attributes = OrderDeliveryStatusAttributes(
            foodImage: data.foodImage,
            quantity: data.quantity,
            foodName: data.foodName)
//            startedAt: data.startedAt,
//            endedAt: data.endedAt)
        
        let contentState = OrderDeliveryStatusAttributes.ContentState(orderStatus: .placed)
        
        let content = ActivityContent(
            state: contentState, // the initial ContentState for the live activity
            // the date that indicates to the system when the live activity must be considered outdated.
            // If a nil value is passed as staleDate, by default it will be considered outdated after 8 hours
            staleDate: nil,
            // it’s the priority that the live activity must have in the dynamic island,
            // and also the order it will have in the lock screen.
            relevanceScore: 0
            
        )
        
        // To actually start the activity use Activity.request(attributes:, content:, pushType:)
        // pushType: Indicates if the updates of the Live Activity will be from push notifications (passing .token) or
        // if we only want to update the Live Activity using the update function (passing nil)
        activity = try? Activity.request(
            attributes: attributes,
            content: content
        )
        
        guard let activity = activity else { return }
        print("ACTIVITY IDENTIFIER:\n\(activity.id)")
        //        Task {
        //            for await data in activity.pushTokenUpdates {
        //                let token = data.map {String(format: "%02x", $0)}.joined()
        //                print("ACTIVITY TOKEN:\n\(token)")
        //            }
        //        }
    }
    
    func updateActivity(orderStatus: OrderStatus) {
        Task {
            let contentState = OrderDeliveryStatusAttributes.ContentState(orderStatus: orderStatus)
            await activity?.update(using: contentState)
        }
    }
    
    func stopActivity() {
        Task {
            let contentState = OrderDeliveryStatusAttributes.ContentState(orderStatus: .arrived)
            await activity?.end(
                ActivityContent(state: contentState, staleDate: Date.distantFuture),
                dismissalPolicy: .immediate
            )
            
            activity = nil
        }
        
    }
    
}
