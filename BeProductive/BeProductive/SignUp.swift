//
//  SignUp.swift
//
//
//  Created by mashal imtiaz on 4/23/23.
//
import SwiftUI

struct SignUp: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    func signUp() -> Bool {
        // Add your sign-up logic here
        // For example, check if username, password, and name fields are not empty
        if !username.isEmpty && !password.isEmpty && !name.isEmpty {
            // Proceed with the registration process
            print("User signed up: username: \(username), password: \(password), name: \(name)")
            return true
        } else {
            print("Please fill in all the fields.")
            return false
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
                    if signUp() {
                        // If the sign-up process is successful, navigate to the HomePage
                        presentationMode.wrappedValue.dismiss()
                    }
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
