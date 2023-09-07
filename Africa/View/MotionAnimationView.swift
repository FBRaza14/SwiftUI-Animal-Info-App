//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 13/08/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomNum = Int.random(in: 12...16)
    @State private var isAnimating = false
    //Mark: -Functions
    
    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
      return CGFloat.random(in: 0...max)
    }
    
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
      return CGFloat(Int.random(in: 10...300))
    }
    
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
      return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
      return Double.random(in: 0.025...1.0)
    }
    
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
      return Double.random(in: 0...2)
    }
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomNum, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max:  geometry.size.height)
                    )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear(
                        perform: {
                            isAnimating = true
                        })
                }//Foreach
            }//ZStack
            .drawingGroup() // swift ui use core animation rendering by default // increase sequen rendering and decrease rendering time without effecting.
        } // origin point change to top left when wrap in geometry reader:
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
