//
//  OrderDeliveryStatusAttributes.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation
import ActivityKit

// defines the various properties that we are going to use inside the Live Activity UI
struct OrderDeliveryStatusAttributes: ActivityAttributes {
  
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        
        var orderStatus: OrderStatus
    }
    
    // Fixed non-changing properties about your activity go here!
    var foodImage: String
    var quantity: String
    var foodName: String
//    var startedAt: Double
//    var endedAt: Double
}

enum OrderStatus: Float, Codable, Hashable {
    case placed = 0
    case preparing
    case onWay
    case arrived
    
    var description: String {
        switch self {
        case .placed:
            return "Your order is placed"
        case .preparing:
            return "Order is being prepared"
        case .onWay:
            return "Order is on the way"
        case .arrived:
            return "Order Delivered"
        }
    }
    
    var shortDesc: String {
        switch self {
        case .placed:
            return "Placed"
        case .preparing:
            return "Preparing"
        case .onWay:
            return "On the Way"
        case .arrived:
            return "Delivered"
        }
    }
    
//    var arriving: String {
//        switch self {
//        case .placed, .preparing, .onWay:
//            return "Order Arriving in"
//        case .arrived:
//            return "Order Delivered"
//        }
//    }

}

// class TimeStatus {
//
//    static let shared = TimeStatus()
//    private init() {}
//    
//    func getLabel(state: OrderDeliveryStatusAttributes.ContentState, 
//                  attributes: OrderDeliveryStatusAttributes,
//                  onlyTimeLabel: Bool = false  ) -> String {
//        let orderStatus = state.orderStatus.arriving
//        let time = Int(attributes.endedAt - Date().timeIntervalSince1970)
//        let timeLabel = state.orderStatus.rawValue ==  3 ? "" :  "\(time) secs"
//        if onlyTimeLabel {
//            return timeLabel
//        } else {
//            return orderStatus + " " + timeLabel
//        }
//    }
// }
