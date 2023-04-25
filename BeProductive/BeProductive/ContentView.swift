//
//  ContentView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("LOGO")
                
                NavigationLink(destination: SignUp()) {
                    Text("SIGNUP")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                }
                
                NavigationLink(destination: LogIn()) {
                    Text("LOGIN")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                }
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
