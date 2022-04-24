//
//  ConnectDotView.swift
//  WWDC2022 FaizalH
//
//  Created by Faizal Hudya Rizfianto on 22/04/22.


// Connecting the dot

import Foundation
import SwiftUI

struct Line1 {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat
}

struct IntroConnectingLine: View {
    @EnvironmentObject var appState: AppState
    
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero
    
    var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
            }
            .onEnded { value in
                lineEnd = value.location
            }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Connecting The Dots")
                    .font(.largeTitle.bold())
                    .underline(true, color: .orange)
                    .foregroundColor(.black)
                    .padding(.top,60)
                
                Text("Compose your canvas with simple Shapes!")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Path { path in
                    path.move(to: lineStart)
                    path.addLine(to: lineEnd)
                }
                .stroke(Color.orange, lineWidth: 8.0)
                .contentShape(Rectangle())
                .gesture(lineDrawingGesture)
            }
            .background(
                
                RoundedRectangle(cornerRadius: 50)
                    .fill(.black)
                // Size as image size...
                    .frame(width: getScreenBounds().width - 100,height:
                            getScreenBounds().width - 100)
                    .scaleEffect(2)
                    .rotationEffect(.init(degrees: 33))
                    .offset(x: getScreenBounds().width - 0, y: -getScreenBounds().width - 220)
                
                ,alignment: .leading
            )
            .overlay(
                VStack{
                    Text("You can create a line by dragging your finger on the screen")
                        .font(.title.bold())
                        .foregroundColor(.black)
                        .padding(.top,500)
                    
                    NavigationLink(destination: StoryView(level: 2)) {
                        Text("Start")
                            .font(.title2.bold())
                            .foregroundColor(.orange)
                            .padding(.vertical, 20)
                            .frame(width: 200)
                            .background(Color.black,in:
                                            RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.top, 35)
                }
                    .padding(.bottom,100)
                ,alignment: .bottom
            )
        }
        .navigationViewStyle(.stack)
    }
}

struct IntroConnectingLine_Previews: PreviewProvider {
    static var previews: some View {
        IntroConnectingLine()
    }
}