//
//  ExplainView.swift
//  Random
//
//  Created by Yavuz Kaan Akyüz on 1.12.2023.
//

import SwiftUI
import Pow

struct ExplainView: View {
    @State var canContinue = false
    @State private var appearHeadingObjects: Bool = false
    @State private var offsetHeadingObjects: Bool = false
    @State private var removeHeadingImage: Bool = false
    
    @State private var offsetImageandText: Bool = false
    @State private var appearImageandText: Bool = false
    @State private var switchRandomView = false
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        Text("Random")
                            .foregroundColor(.white)
                            .font(.system(size: 62))
                            .fontWeight(.heavy)
                           
                        
                        
                        Text("Join the app")
                            .foregroundColor(.white)
                            .font(.system(size: 38))
                            .fontWeight(.heavy)
                            .padding(.bottom, 30)
                    }
                    .scaleEffect(appearHeadingObjects ? 1 : 0)
                    .offset(y: offsetHeadingObjects ? -90 : 150)
                    
                    VStack(alignment: .center, spacing: 20) {
                        HStack(spacing: 25) {
                            Image(systemName: "moon.stars.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 50))
                            
                            VStack(alignment: .leading) {
                                Text("Stars and moon")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("Did you know that you can \nbuy stars and moons? \nPretty cool right?")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        HStack(spacing: 10) {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 50))
                                .offset(x: -8)
                            
                            VStack(alignment: .leading) {
                                Text("A graph")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("See what the graph show \nit is interesting")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "display.2")
                                .foregroundColor(.white)
                                .font(.system(size: 50))
                                .offset(x: -15)
                            
                            VStack(alignment: .leading) {
                                Text("Two screens")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("I know, who would have \nthought you need two.")
                                    .foregroundColor(.white)
                            }
                            .offset(x: -10)
                        }
                        
                        Button(action: {
                            // add action here
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 250, height: 50)
                                .overlay(content: {
                                    Text("Lets do this!")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                })
                        })
                        .conditionalEffect(.repeat(.wiggle(rate: .fast), every: 3.0), condition: true)
                        .offset(y: 80)
                        
                        Text("What are you waiting for...")
                            .foregroundColor(.white)
                            .offset(y: 80)
                    }
                    .offset(y: offsetImageandText ? -90 : 150)
                    .opacity(appearImageandText ? 1 : 0)
                }
            }
            .onAppear {
                removeHeadingImage = true
                
                withAnimation(.easeInOut(duration: 0.7)) {
                    appearHeadingObjects = true
                }
                
                withAnimation(.easeInOut(duration: 1).delay(1)) {
                    offsetHeadingObjects = true
                }
                
                withAnimation(.easeInOut(duration: 0.7).delay(1.3)) {
                    offsetImageandText = true
                }
                
                withAnimation(.linear(duration: 0.5).delay(1.4)) {
                    appearImageandText = true
                }
        }
        }
    }
}

#Preview {
    ExplainView()
}
