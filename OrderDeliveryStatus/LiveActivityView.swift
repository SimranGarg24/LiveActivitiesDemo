//
//  liveActivityView.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation
import SwiftUI

struct LiveActivityView: View {
    let state: OrderDeliveryStatusAttributes.ContentState
    let attributes: OrderDeliveryStatusAttributes
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
//                    Text(
//                      Date(
//                        timeIntervalSinceNow: Double(context.state.startedAt) - Date().timeIntervalSince1970
//                      ),
//                      style: .timer
//                    )
                    Text("\(state.orderStatus.description)")
                        .foregroundStyle(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("\(attributes.quantity)x \(attributes.foodName)")
                        .foregroundStyle(.white.opacity(0.6))
                        .font(.system(size: 16))
                        .lineLimit(1)
                }
                
                Spacer()
                
                Image(systemName: "fork.knife")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding()
            
            HStack {
                CustomProgressBar(state: state, attributes: attributes)
                
                Spacer(minLength: 20)
                
                Image(attributes.foodImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(12.0)
                    
            }
            .padding([.horizontal, .bottom])
        }
    }
}
