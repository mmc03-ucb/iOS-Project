import SwiftUI
import Firebase
import GoogleSignIn

class User: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}

struct LogIn: View {
    @StateObject var user = User()
    @State private var isLoggedIn = false // Track login status
    @State private var loginError: String = "" // Track login error
    
    func logIn() {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                loginError = error.localizedDescription
                print("Login error: \(loginError)")
            } else {
                if authResult != nil {
                    // Login successful
                    isLoggedIn = true // Set login status to true
                    print("User logged in: email: \(user.email), password: \(user.password)")
                } else {
                    loginError = "Invalid credentials"
                    print(loginError)
                }
            }
        }
    }
    
    
    
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.bold)
    
            TextField("Email", text: $user.email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none) // Disable autocapitalization
    
            SecureField("Password", text: $user.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
    
            Button(action: logIn) {
                Text("LOG IN")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if !loginError.isEmpty {
                Text(loginError)
                    .foregroundColor(.red)
            }
            
            Spacer()
    
            Text("Don't have an account?")
                .font(.footnote)
            
            NavigationLink(
                destination: HomePage(),
                isActive: $isLoggedIn,
                label: { EmptyView() }
            )
            .hidden()
    
  
            NavigationLink(destination: SignUp()) {
                Text("Sign Up!")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        
        Button(action: {
            isLoggedIn = true // Simulate a successful login
        }) {
            Text("Simulate Login") // Button for simulating login
                .foregroundColor(.red)
        }
    }
}
