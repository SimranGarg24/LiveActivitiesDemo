//
//  OrderDeliveryStatusBundle.swift
//  OrderDeliveryStatus
//
//  Created by ChicMic on 12/03/24.
//

import WidgetKit
import SwiftUI
// WidgetKit is used to implemt both normal widgets and Live activites
@main
struct OrderDeliveryStatusBundle: WidgetBundle {
    var body: some Widget {
        // Removing this line will basically just not show the normal home screen widget to the user,
        // that basically will not be able to find any widget of our app in the “Add widget” screen
        // OrderDeliveryStatus()
        OrderDeliveryStatusLiveActivity()
    }
}
