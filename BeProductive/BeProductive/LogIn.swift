//
//  LogIn.swift
//
//
//  Created by mashal imtiaz on 4/23/23.
//
import SwiftUI

// User should not be a struct, it should be a class or a model
class User: ObservableObject {
    // Use @Published instead of @State
    @Published var username: String = ""
    @Published var password: String = ""
}

struct LogIn: View {
    // Use @StateObject to create an instance of User
    @StateObject var user = User()

    var body: some View {
            VStack {
                Text("Welcome Back!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Use $ to create a binding to the user's username
                TextField("Username", text: $user.username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Use $ to create a binding to the user's password
                SecureField("Password", text: $user.password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                NavigationLink(destination: HomePage()) {
                    Text("LOG IN")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Text("Don't have an account?")
                    .font(.footnote)
                
                NavigationLink(destination: SignUp()) {
                    Text("Sign Up!")
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                NavigationLink(destination: HomePage()) {
                    Text("Home")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .padding()
        }
    }

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
