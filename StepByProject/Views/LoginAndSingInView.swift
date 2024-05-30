//
//  LoginAndSingInView.swift
//  StepByProject
//
//  Created by Juan Camilo Fonseca Gomez on 30/05/24.
//

import SwiftUI

struct LoginView: View {
    @State var mail: String = ""
    @State var password: String = ""
    var body: some View {
        VStack (){
            RegisterButtons()
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.gray)
        .clipShape(.capsule)
        .padding([.leading, .trailing])
        VStack {
            Image("StepBy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.capsule)
                .frame(width: 200, height: 200)
            LoginComponentsView(mail: $mail, password: $password)
        }
        .padding()
        Spacer()
        
    }
}

#Preview {
    LoginView()
}
struct LoginComponentsView: View {
    @Binding var mail: String
    @Binding var password: String
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text("Welcome back!")
                    .font(.caption2)
                Text("Login")
                    .font(.title)
            }
            .padding()
            Spacer()
        }
        VStack(alignment: .leading, spacing: 20) {
            TextField("Ingrese su Email", text: $mail)
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity, maxHeight:30)
                .background(Color(.lightGray))
                .border(.black, width: 3)
                .clipShape(.rect(cornerRadius: 10))
            SecureField("Ingrese su password", text: $password)
                .padding()
                .frame(maxWidth: .infinity, maxHeight:30)
                .background(Color(.lightGray))
                .border(.black, width: 3)
                .clipShape(.rect(cornerRadius: 10))
        }
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("Forgot password?")
                }
                .padding()
            }
            Button("Log in") {
                print(mail)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color(.red))
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}
struct RegisterButtons: View {
    @State var loginPush: Bool = false
    @State var signInPush: Bool = false
    var body: some View {
        HStack {
            Button("Log in") {
                if loginPush {
                    loginPush.toggle()
                    signInPush.toggle()
                }
            }
            .font(.title2)
            .fontWeight(loginPush ? .light : .heavy)
            .bold(!loginPush)
            .frame(width: 150, height: 30)
            .background(loginPush ? Color.white : Color.black)
            .foregroundStyle(loginPush ? Color.black : Color.white)
            .clipShape(.capsule)
            .shadow(radius: loginPush ? 0 : 20)
            .padding()
            
            Button("Sign in") {
                if !signInPush {
                    loginPush.toggle()
                    signInPush.toggle()
                }
            }
            .font(.title2)
            .frame(width: 150, height: 30)
            .fontWeight(signInPush ? .heavy : .light)
            .background(signInPush ? Color.black: Color.white)
            .clipShape(.capsule)
            .foregroundStyle(signInPush ? Color.white : Color.black)
            .bold(signInPush)
            .shadow(radius: signInPush ? 20 : 0)
            .padding()
        }
    }
}
