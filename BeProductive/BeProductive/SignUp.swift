//
//  SignUp.swift
//
//
//  Created by mashal imtiaz on 4/23/23.
//
import SwiftUI
import Firebase
import GoogleSignIn

struct SignUp: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    func signUp() {
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            if let error = error {
                print("Sign-up error: \(error.localizedDescription)")
            } else {
                // Sign-up successful, perform additional actions if needed
                print("User signed up: username: \(username), password: \(password), name: \(name)")
                presentationMode.wrappedValue.dismiss()
            }
        }
    }


    
    var body: some View {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Name", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Replace the existing NavigationLink with this Button
                Button(action: {
                    signUp()
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                
                Spacer()
                
                Text("Already have an account?")
                    .font(.footnote)
                
                NavigationLink(destination: LogIn()) {
                    Text("Log In")
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
