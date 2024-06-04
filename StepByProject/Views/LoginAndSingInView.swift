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
    @State var loginPush: Bool = false
    @State var signInPush: Bool = false
    @State var name: String = ""
    @State var present: Bool = false
    var body: some View {
        VStack () {
            RegisterButtons(loginPush: $loginPush, signInPush: $signInPush)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.gray)
        .clipShape(.capsule)
        .padding([.leading, .trailing])
        Image("StepBy")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.capsule)
            .frame(width: 200, height: 200)
        ZStack {
            if loginPush {
                VStack {
                    SignInView(tfName: $name, tfEmail: $mail, tfPassword: $password)
                        .padding()
                    Button("Sign in") {
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color(.red))
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                }
            } else {
                VStack {
                    LoginComponentsView(mail: $mail, password: $password)
                    Button("Log in") {
                        present.toggle()
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color(.red))
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding()
            }
        }
        Spacer()
            .fullScreenCover(isPresented: $present, content: {
                Proyectos()
            })
    }
}

#Preview {
    LoginView()
}
struct LoginComponentsView: View {
    @Binding var mail: String
    @Binding var password: String
    @State var isSecured = true
    @FocusState var fc1: Bool
    @FocusState var fc2: Bool
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text("Welcome back!")
                    .font(.caption2)
                Text("Login")
                    .font(.title)
                    .fontWeight(.heavy)
            }
            .padding()
            Spacer()
        }
        VStack(alignment: .leading, spacing: 20) {
            TextField("Ingrese su Email", text: $mail)
                .padding()
                .keyboardType(.emailAddress)
                .border(.black, width: 3)
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField("Password", text: $password)
                            .padding()
                            .keyboardType(.default)
                            .border(.black, width: 3)
                            .focused($fc1)
                    } else {
                        TextField("Password", text: $password)
                            .padding()
                            .keyboardType(.default)
                            .border(.black, width: 3)
                            .focused($fc2)
                    }
                }
                .overlay(alignment: .trailing) {
                    Button(action: {
                        isSecured.toggle()
                        if isSecured { fc1 = true } else { fc2 = true }
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    .padding()
                }
            }
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
        }
    }
}
struct RegisterButtons: View {
    @Binding var loginPush: Bool
    @Binding var signInPush: Bool
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
            .frame(width: 150, height: 40)
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
            .frame(width: 150, height: 40)
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
struct SignInView: View {
    @Binding var tfName: String
    @Binding var tfEmail: String
    @Binding var tfPassword: String
    @State var isSecured = true
    @FocusState var fc1: Bool
    @FocusState var fc2: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sign UP!")
                .font(.title)
                .fontWeight(.heavy)
            TextField("Name", text: $tfName)
                .padding()
                .keyboardType(.default)
                .border(.black, width: 3)
            TextField("Email", text: $tfEmail)
                .padding()
                .keyboardType(.emailAddress)
                .border(.black, width: 3)
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField("Password", text: $tfPassword)
                            .padding()
                            .keyboardType(.default)
                            .border(.black, width: 3)
                            .focused($fc1)
                    } else {
                        TextField("Password", text: $tfPassword)
                            .padding()
                            .keyboardType(.default)
                            .border(.black, width: 3)
                            .focused($fc2)
                    }
                }
                .overlay(alignment: .trailing) {
                    Button(action: {
                        isSecured.toggle()
                        if isSecured { fc1 = true } else { fc2 = true }
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                    .padding()
                }
            }
        }
    }
}
