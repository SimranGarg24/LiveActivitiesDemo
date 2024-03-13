//
//  CustomProgressBar.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import Foundation
import SwiftUI

struct CustomProgressBar: View {
 
    let state: OrderDeliveryStatusAttributes.ContentState
    let attributes: OrderDeliveryStatusAttributes
    
    var body: some View {
        
        HStack(spacing: 0) {
            Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                .foregroundStyle(.white)
                .padding(10)
                .background(Circle().fill(Color("DarkGreen").opacity(state.orderStatus.rawValue >= 0 ? 1 : 0.5)))
                .frame(width: 40, height: 40)
            
            ProgressView(value: state.orderStatus.rawValue >= 1 ? 1 : 0, total: 1)
                .tint(Color("DarkGreen"))
            
            Image(systemName: "fireplace.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .padding(10)
                .background(Circle().fill(Color("DarkGreen").opacity(state.orderStatus.rawValue >= 1 ? 1 : 0.5)))
                .frame(width: 40, height: 40)
            
            ProgressView(value: state.orderStatus.rawValue >= 2 ? 1 : 0, total: 1)
                .tint(Color("DarkGreen"))
            
            Image(systemName: "car.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .padding(10)
                .background(Circle().fill(Color("DarkGreen").opacity(state.orderStatus.rawValue >= 2 ? 1 : 0.5)))
                .frame(width: 40, height: 40)
            
            ProgressView(value: state.orderStatus.rawValue >= 3 ? 1 : 0, total: 1)
                .tint(Color("DarkGreen"))
            
            Image(systemName: "house.fill")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.white)
                .padding(10)
                .background(Circle().fill(Color("DarkGreen").opacity(state.orderStatus.rawValue == 3 ? 1 : 0.5)))
                .frame(width: 40, height: 40)
        }
        
    }
}
