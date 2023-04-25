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
    @ObservedObject var focusSession = Reward(rewardName: "Focus Session")
    @ObservedObject var pomodoroWarrior = Reward(rewardName: "Pomodoro Warrior")

    @State var rewardTotal = 0

    func addNumber(reward: Reward) {
        reward.rewardNumber += 1
        rewardTotal += 1
    }

    var body: some View {
        VStack {

            Text("Total Points: \(rewardTotal)")
                .foregroundColor(.green)
                .font(.largeTitle)
                .padding()

            Spacer()

            Text("Reward Number \(studyStreak.rewardNumber)")
                .scaledToFit()
                .padding()
                .font(.system(size: 36))

            Text(studyStreak.rewardName)
                .scaledToFit()
                .padding()
                .font(.system(size: 24))

            Spacer()

            Text("Reward Number \(focusSession.rewardNumber)")
                .scaledToFit()
                .padding()
                .font(.system(size: 36))

            Text(focusSession.rewardName)
                .scaledToFit()
                .padding()
                .font(.system(size: 24))

            Spacer()

            Text("Reward Number \(pomodoroWarrior.rewardNumber)")
                .scaledToFit()
                .padding()
                .font(.system(size: 36))

            Text(pomodoroWarrior.rewardName)
                .scaledToFit()
                .padding()
                .font(.system(size: 24))

        }
        .onAppear {
            addNumber(reward: studyStreak)
            addNumber(reward: focusSession)
            addNumber(reward: pomodoroWarrior)
        }
    }
}
