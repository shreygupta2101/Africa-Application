//
//  MotionAnimationView.swift
//  Africa
//
//  Created by ShreyGupta on 25/10/23.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var noOfCircles = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //MARK: Functions
    //1. Random Coordinates
    
    func randomCoordinates(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    //2. Random Size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    //3. Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    //4. Random Scale
    func randomScale() -> Double {
        return Double.random(in: 0.1...2)
    }
    //5. Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0.1...2)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                ForEach(0...noOfCircles, id: \.self) { item in
                    Circle()
                        .fill(Color.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .position(x: randomCoordinates(max: geometry.size.width), y: randomCoordinates(max: geometry.size.height))
                    .scaleEffect(randomScale())
                    .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay()), value: isAnimating
                    )
                    .onAppear(perform: {
                        isAnimating = true
                    })
                }
            }
        }.drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
}
