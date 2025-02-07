//
//  ContentView.swift
//  PortfolioApp
//
//  Created by srijan vikram on 2/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var typedText = ""
    @State private var fullText = "Srijan Vikram"
    @State private var showProjects = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background circles
                BackgroundView()
                
                ScrollView {
                    VStack(spacing: 27) {
                        // Avatar Image
                        Image("avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.teal, lineWidth: 2))
                            .shadow(radius: 10)
                        
                        // Animated name
                        Text(typedText)
                            .font(.custom("Helvetica Neue", size: 28))
                            .fontWeight(.bold)
                            .onAppear {
                                startTypewriterAnimation()
                            }
                        
                        // Job title
                        Text("Software Engineer")
                            .font(.custom("Helvetica Neue", size: 20))
                            .foregroundColor(.white)
                        
                        // Brief intro
                        Text("Passionate software engineer with expertise in iOS development. Creating elegant solutions to complex problems through clean and efficient code. \n Lets begin the journey by clicking below !!")
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        // Projects Button
                        NavigationLink(destination: ProjectsView()) {
                            Text("Projects")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 100.0, height: 50)
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(25)
                        }
                        Text("Below are the links for my socials. \nLet's connect over there !!")
                                                    .font(.system(size: 15))
                                                    .multilineTextAlignment(.center)
                                                    .padding(.horizontal)
                        
                        // Social Media Links
                        HStack(spacing: 20) {
                            Link(destination: URL(string: "https://www.instagram.com/srijanvikram20/")!) {
                                Image("instagram")
                                    .padding(.top, 1.0)
                                    .font(.system(size: 60))  // Increased from 40 to 60
                                    .foregroundColor(.white)
                            }
                            
                            Link(destination: URL(string: "https://www.linkedin.com/in/srijan-vikram-4b0a291ba/")!) {
                                Image("linkedin")
                                    .font(.system(size: 60))  // Increased from 40 to 60
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
    
    private func startTypewriterAnimation() {
        typedText = ""
        for (index, character) in fullText.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                typedText.append(character)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
















