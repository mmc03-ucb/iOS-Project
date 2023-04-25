import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack {
            VStack {
                NavigationLink(destination: SelfieView()) {
                    Text("Selfie")
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            
            VStack {
                HStack {
                    NavigationLink(destination: ToDoView()) {
                        Text("TO DO")
                            .font(.headline)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: GoalsListView()) {
                        Text("GOALS")
                            .font(.headline)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                HStack {
                    NavigationLink(destination: RewardsView()) {
                        Text("REWARDS")
                            .font(.headline)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: CreateSessionView()) {
                        Text("CREATE SESSION")
                            .font(.headline)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                NavigationLink(destination: HomePage()) {
                    Text("Home")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            } // vstack ender
            .padding()
            
            Spacer()
            
        } // big vstack ender
        .padding()
    } //someView ender
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
