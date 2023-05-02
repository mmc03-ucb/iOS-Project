import SwiftUI

struct HomePage: View {
    @EnvironmentObject var goalStore: GoalStore

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
            }) {
                VStack(spacing: 10) {
                    NavigationLink(destination: SelfieView()) {
                        Image(systemName: "camera")
                            .font(.system(size: 40))
                        Text("Selfie")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            HStack(spacing: 20) {
                Button(action: {
                }) {
                    VStack(spacing: 10) {
                        NavigationLink(destination: ToDoView()) {
                            Image(systemName: "list.bullet")
                                .font(.system(size: 40))
                            Text("TO DO")
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                Button(action: {
                }) {
                    VStack(spacing: 10) {
                        NavigationLink(destination: GoalsListView()) {
                            Image(systemName: "star")
                                .font(.system(size: 40))
                            Text("GOALS")
                                .font(.headline)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
            HStack(spacing: 20) {
                Button(action: {
                }) {
                    VStack(spacing: 10) {
                        NavigationLink(destination: RewardsView()) {
                            Image(systemName: "gift")
                                .font(.system(size: 40))
                            Text("REWARDS")
                                .font(.headline)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: {
                }) {
                    VStack(spacing: 10) {
                        NavigationLink(destination: CreateSessionView()) {
                            Image(systemName: "plus")
                                .font(.system(size: 40))
                            Text("CREATE SESSION")
                                .font(.headline)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .navigationBarTitle(Text("Home"))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage().environmentObject(GoalStore())
    }
}
