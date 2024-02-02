import SwiftUI

struct RandomView: View {
    
    @State private var value = 0
    @State private var animateGradient: Bool = false
    @State private var animationAmount = 1.0
    @State private var maximumValue = 100
    @State private var minimumValue = 0
    @State private var numbers = Array(1...10)
    @State private var showingPopover = false
    @State private var showingAlert = false
    
    private let startColor: Color = .green
    private let endColor: Color = .blue
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(value)")
                    .font(.system(size: 120))
                    .foregroundStyle(.white)
                    .contentTransition(.numericText(value: Double(value)))
                Spacer()
                    .frame(height: 140)
                HStack(spacing: 40){
                    Button("    ") {
                        if(maximumValue >= minimumValue) {
                        value = Int.random(in: minimumValue...maximumValue)
                        } else {
                            showingAlert = true
                                
                        }
                    }
                    .alert("Logic Error 🤔", isPresented: $showingAlert) {
                        Button("OK") {}
                    } message: {
                        Text("Minimum value can't be greater than maximum value")
                    }
                    .font(.system(size: 10))
                    .padding(20)
                    .background(.white)
                    .foregroundColor(.blue)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .scaleEffect(animationAmount)
                    .overlay(
                        Circle()
                            .stroke(.white)
                            .scaleEffect(animationAmount*1.8)
                            .opacity(2 - animationAmount)
                            .animation(
                                .easeOut(duration: 2)
                                .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
                    )
                    .onAppear() {
                        animationAmount = 2
                    }
                }
                Spacer()
                    .frame(height: 120)
            }
            
            .navigationBarItems(trailing:
                                    HStack {
                
                Button(action: {
                        showingPopover.toggle()
                    }) {
                        Image(systemName: "gear")
                            .fontWeight(.medium)
                            .font(.system(size: 20))
                            .padding(10)
                            .background(.white)
                            .foregroundColor(.blue)
                            .clipShape(Circle())
                            .sheet(isPresented: $showingPopover) {
                                SettingsView(maximumValue: $maximumValue, minimumValue: $minimumValue)
                        }
                }
            }
            )
            .animation(.easeInOut(duration: 0.1), value: value)
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .padding(.horizontal)
            .background {
                LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
            }
        }
    }
}


#Preview {
    RandomView()
}
