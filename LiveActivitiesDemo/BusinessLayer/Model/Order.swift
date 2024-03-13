//
//  Order.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation

struct Order {
    var foodImage: String
    var quantity: String
    var foodName: String
//    var startedAt: Double
//    var endedAt: Double
    
    static func getSampleOrder() -> Order {
        let order = Order(foodImage: "Burger", 
                          quantity: "1",
                          foodName: "Burger")
//                          startedAt: 1641554695757,
//                          endedAt: Date().addingTimeInterval(30).timeIntervalSince1970)
        return order
    }
}
