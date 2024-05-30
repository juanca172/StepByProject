//
//  ContentView.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 30/05/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var isHidding = true
    @State var presentViewController = false
    var body: some View {
        VStack {
            Image("StepBy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(cornerRadius: 20))
                .scaleEffect(CGSize(width: isHidding ? 0.0 : 1.0, height: isHidding ? 0.0 : 1.0))
                .rotationEffect(.degrees(isHidding ? 0.0 : 360.0))
                .shadow(radius: 10)
        }
        .onAppear() {
            withAnimation(Animation.default.delay(1.0)) {
                isHidding.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    presentViewController.toggle()
                }
            }
        }
        .fullScreenCover(isPresented: $presentViewController, content: {
            LoginView()
        })
    }
}

#Preview {
    SplashScreen()
}
