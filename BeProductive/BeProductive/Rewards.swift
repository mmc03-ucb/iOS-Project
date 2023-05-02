import SwiftUI

class Reward: ObservableObject, Identifiable {
    var id = UUID()
    var rewardName: String
    var dateAchieved: Date?
    var associatedGoalID: UUID?

    init(rewardName: String, dateAchieved: Date? = nil, associatedGoalID: UUID? = nil) {
        self.rewardName = rewardName
        self.dateAchieved = dateAchieved
        self.associatedGoalID = associatedGoalID
    }
}


struct RewardsView: View {
    @EnvironmentObject var goalStore: GoalStore

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(goalStore.completedRewards) { reward in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(reward.rewardName)
                                .font(.system(size: 24))
                                .scaledToFit()
                            if let dateAchieved = reward.dateAchieved {
                                Text("Achieved on \(dateAchieved, style: .date)")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .onTapGesture {
                            if let goalID = reward.associatedGoalID,
                               let goal = goalStore.goals.first(where: { $0.id == goalID }) {
                                // Show the associated goal
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Rewards 🏆", displayMode: .large)
        }
    }
}
