//
//  BackgroundView.swift
//  PortfolioApp
//
//  Created by srijan vikram on 2/5/25.
//


import SwiftUI

struct BackgroundView: View {
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.teal.opacity(2.5), Color.cyan.opacity(2.5),Color.cyan.opacity(1.5), Color.teal.opacity(0.6)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .edgesIgnoringSafeArea(.all)
                    
                    ForEach(0..<10) { index in
                        Circle()
                            .fill(Color.white.opacity(0.3))
                            .frame(width: CGFloat.random(in: 20...100))
                            .position(
                                x: CGFloat.random(in: 0...geometry.size.width),
                                y: CGFloat.random(in: 0...geometry.size.height)
                            )
                    }
                }
            }
        }
    }
    
    struct BackgroundView_Previews: PreviewProvider {
        static var previews: some View {
            BackgroundView()
        }
    }
