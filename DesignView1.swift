//
//  File.swift
//  WWDC2022 FaizalH
//
//  Created by Faizal Hudya Rizfianto on 22/04/22.


//  For Changing colors of the shape and the font

import Foundation
import SwiftUI

struct TapView: View {

    @State private var color : Color = Color.primary
    
    var tapGesture: some Gesture {
        TapGesture()
            .onEnded {
                withAnimation {
                    color = Color.random()
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("Tap the rectangle to change its color")
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(width: 250, height: 125)
                .gesture(tapGesture)
            Spacer()
        }
        .navigationTitle("Tap")
        .toolbar {
            Button("Reset") {
                color = Color.primary
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
