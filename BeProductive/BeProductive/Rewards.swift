import SwiftUI

class Reward: ObservableObject, Identifiable {
    var rewardName: String
    @Published var rewardNumber: Int

    init(rewardName: String) {
        self.rewardName = rewardName
        self.rewardNumber = 0
    }
}

struct RewardsView: View {
    @ObservedObject var studyStreak = Reward(rewardName: "Study Star")
    @ObservedObject var focusSession = Reward(rewardName: "Excellent Eater")
    @ObservedObject var pomodoroWarrior = Reward(rewardName: "Water Warrior")
    @State private var rewards: [Reward] = [] // Example goals data

    @State var rewardTotal = 0

    func addNumber(reward: Reward) {
        reward.rewardNumber += 1
        rewardTotal += 1
    }

    func addReward(reward: Reward) {
        rewards.append(reward)
    }

    var body: some View {
        VStack {

            Text("Total Points: \(rewardTotal)")
                .foregroundColor(.green)
                .font(.largeTitle)
                .padding()

            Spacer()

            ForEach(rewards) {
                reward in VStack {
                    Text(reward.rewardName)
                        .scaledToFit()
                        .font(.system(size: 36))
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .background(Color.gray.opacity(0.2))
                        
                    Text(reward.rewardNumber)
                        .scaledToFit()
                        .padding()
                        .font(.system(size: 24))

                        //Can add a reward image here if wanted
                }
            }

        }
        }
    }
}
