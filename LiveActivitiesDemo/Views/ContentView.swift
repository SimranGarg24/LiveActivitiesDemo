//
//  ContentView.swift
//  LiveActivitiesDemo
//
//  Created by ChicMic on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentVm = ContentViewModel()
    
    var body: some View {
        VStack {
            
            Text("Live Activities Demo")
                .foregroundStyle(Color("DarkGreen"))
                .font(.system(size: 24))
                .fontWeight(.bold)
            
            Image(systemName: "fork.knife")
                .resizable()
                .foregroundStyle(Color("BackgroundGreen"))
                .frame(width: 20, height: 40)
            
            Spacer()
            
            VStack {
                if contentVm.isOrderPlaced {
                    if contentVm.count >= 0 {
                        Image(contentVm.order.foodImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(12.0)
                        
                        Text("\(contentVm.order.quantity)x \(contentVm.order.foodName)")
                            .foregroundStyle(Color("BackgroundGreen"))
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.bottom, 8)
                        
                        Text(OrderStatus(rawValue: Float(contentVm.count))?.description ?? "")
                            .foregroundStyle(Color("DarkGreen"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                    } else {
                        ProgressView()
                    }
                } else {
                    EmptyView()
                }
            }
            .frame(height: 120)
            
            Spacer()
            
            VStack {
                Button {
                    contentVm.isOrderPlaced = true
                    contentVm.startActivity()
                } label: {
                    Text("Place Order")
                        .frame(width: 120, height: 24)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 8)
                        .background(Color("BackgroundGreen"))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                }
                
                Button {
                    contentVm.endActivity()
                } label: {
                    Text("Cancel Order")
                        .frame(width: 120, height: 24)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 8)
                        .background(Color("DarkGreen"))
                        .foregroundStyle(.white)
                        .cornerRadius(8)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
