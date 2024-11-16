//
//  OnboardingView.swift
//  CustomSwiftUIViews
//
//  Created by Rafiul Hasan on 11/16/24.
//

import SwiftUI

struct OnboardingStep {
    let image: String //ImageResource
    let title: String
    let description: String
    let color: Color
}

struct OnboardingView: View {
    
    @State var currentStep: Int = 0
    @State var isFinished: Bool = false
    
    let onboardingSteps: [OnboardingStep] = [
        OnboardingStep(image: "", title: "Send and Receive gifts", description: "Easily send and receive gifts with our seamless system.", color: .red),
        OnboardingStep(image: "", title: "Data Analytics", description: "Track and analyze data to make informed decisions.", color: .yellow),
        OnboardingStep(image: "", title: "In-App Security", description: "We ensure your data is safe and secure with our advanced security measures.", color: .blue),
        OnboardingStep(image: "", title: "Teamwork in App", description: "Collaborate with your team and improve productivity in real-time.", color: .indigo),
        OnboardingStep(image: "", title: "Traveling", description: "Plan your next adventure with our travel friendly features.", color: .cyan)
    ]
    
    var body: some View {
        ZStack {
            if isFinished {
                HomeView()
                    .transition(.move(edge: .trailing))
            } else {
                VStack {
                    ProgressView(steps: onboardingSteps.count, currentStep: $currentStep)
                    Spacer()
                    DetailView(onboardingSteps: onboardingSteps, currentStep: currentStep)
                    Spacer()
                }
                .padding()
                
                NextButtonView(currentStep: $currentStep, color: onboardingSteps[currentStep].color) {
                    if currentStep < onboardingSteps.count - 1 {
                        $currentStep.wrappedValue += 1
                    } else {
                        withAnimation(.linear.delay(0.5)) {
                            isFinished = true
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    OnboardingView()
}

struct HomeView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Home View")
        }
        .padding()
    }
}

struct DetailView: View {
    
    var onboardingSteps: [OnboardingStep]
    var currentStep: Int
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height:  200)
            
            Text(onboardingSteps[currentStep].title)
                .font(.title)
            
            Text(onboardingSteps[currentStep].description)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .id(currentStep)
        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
        .animation(.linear, value: currentStep)
        .frame(maxWidth: .infinity)
    }
}
