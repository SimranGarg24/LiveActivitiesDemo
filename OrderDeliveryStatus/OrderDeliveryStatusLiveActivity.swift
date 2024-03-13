//
//  OrderDeliveryStatusLiveActivity.swift
//  OrderDeliveryStatus
//
//  Created by ChicMic on 12/03/24.
//

import WidgetKit
import SwiftUI

// This is our Live Activity file where we are going to build our various UI
struct OrderDeliveryStatusLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OrderDeliveryStatusAttributes.self) { context in
            // Lock screen/banner UI goes here
            LiveActivityView(state: context.state, attributes: context.attributes)
                .activityBackgroundTint(Color("BackgroundGreen"))
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    VStack(alignment: .leading) {
                        Text("\(context.state.orderStatus.shortDesc)")
                            .foregroundStyle(Color("BackgroundGreen"))
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("\(context.attributes.quantity)x \(context.attributes.foodName)")
                            .foregroundStyle(.white.opacity(0.5))
                            .font(.system(size: 16))
                            .lineLimit(1)
                    }
                    .padding([.leading, .top], 4)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image(systemName: "fork.knife")
                        .foregroundStyle(Color("BackgroundGreen"))
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding([.trailing, .top], 4)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        CustomProgressBar(state: context.state, attributes: context.attributes)
                        
                        Spacer(minLength: 20)
                        
                        Image(context.attributes.foodImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(12.0)
                            
                    }
                    .padding(.horizontal, 4)
                }
            } compactLeading: {
                Text("\(context.state.orderStatus.shortDesc)")
                    .foregroundStyle(Color("BackgroundGreen"))
            } compactTrailing: {
                Text("\(context.attributes.quantity)x \(context.attributes.foodName)")
            } minimal: {
                Image(systemName: "fork.knife")
                    .foregroundStyle(Color("BackgroundGreen"))
            }
//            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color("BackgroundGreen"))
        }
    }
}

struct MatchLiveScoreLiveActivity_Previews: PreviewProvider {
    static let attributes = OrderDeliveryStatusAttributes(foodImage: "Burger", quantity: "2", foodName: "Burger")
    static let contentState =  OrderDeliveryStatusAttributes.ContentState(orderStatus: .preparing)
    
    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
