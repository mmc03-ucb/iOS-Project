import SwiftUI

class Session: ObservableObject, Identifiable {
    var id = UUID()
    var date: Date
    @Published var duration: Int
    @Published var location: String
    @Published var friends: [String]

    init(duration: Int, location: String, friends: [String]) {
        self.date = Date()
        self.duration = duration
        self.location = location
        self.friends = friends
    }
}

struct CreateSessionView: View {
    let lightBlue = Color(red: 135/255, green: 206/255, blue: 250/255)
    let lavender = Color(red: 220/255, green: 208/255, blue: 255/255)

    @StateObject var newSession = Session(duration: 0, location: "", friends: [""])
    @State private var userDuration = ""
    @State private var userLocation = ""
    @State private var userFriends = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [lightBlue, lavender]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Text("Create a Study Session!")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    Text("Today's Date:")
                        .foregroundColor(.white)
                    Spacer()
                    Text("4-24-2023")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
                
                Text("Duration")
                    .font(.system(size: 36))
                TextField("", text: $userDuration)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .onSubmit {
                        newSession.duration = Int(userDuration) ?? 0
                    }
                
                Spacer()
                
                Text("Location")
                    .font(.system(size: 36))
                TextField("", text: $userLocation)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .onSubmit {
                        newSession.location = userLocation
                    }
                
                Spacer()
                
                Text("Friends")
                    .font(.system(size: 36))
                TextField("", text: $userFriends)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 50)
                    .onSubmit {
                        newSession.friends = [userFriends]
                    }
                
            }
        }
    }
}
