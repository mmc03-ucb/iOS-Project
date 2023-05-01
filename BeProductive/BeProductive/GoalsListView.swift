//
//  GoalsListView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//

import SwiftUI

struct GoalsListView: View {
    @State private var goals: [Goal] = [] // Example goals data
    @State private var showingAddGoalView = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 20) {
                    ForEach(goals) { goal in
                        GoalCardView(goal: goal, onDelete: {
                            if let index = goals.firstIndex(where: { $0.id == goal.id }) {
                                goals.remove(at: index)
                            }
                        })
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("Goals", displayMode: .large)
            .navigationBarItems(trailing: Button(action: {
                showingAddGoalView.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddGoalView) {
                AddGoalView(goals: $goals)
            }
        }
    }
}

struct GoalCardView: View {
    let goal: Goal
    let onDelete: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(goal.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(goal.status.rawValue)
                    .font(.subheadline)
                    .foregroundColor(goal.status == .completed ? .green : .red)
                Text(goal.dueDate, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding()
            Spacer()
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
            }
            .padding(.trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct Goal: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var status: GoalStatus
    //make new instance of rewards to update and connect the two 
    @EnvironmentObject var rewards = Reward()
    var allRewards = RewardsView()
    
    enum GoalStatus: String {
        case completed = "Completed"
        case pending = "Pending"
    }

    func addReward() {
        //Make reward name equal to the title 
        rewardName = title;
        allRewards.rewardTotal += 1
    }

    //See when to show alert, only when goal is completed
    func showAlert() -> Alert{
        if completed == .completed {
            var alertMessage = UIAlertController(title: Text("Congrats! You achieved your goal."), message: "Ready to view your rewards?", preferredStyle: .alert)

            //Create View Reward Button 
            let view = UIAlertAction(title: "View Rewards", style: .default, handler:{ (action) -> 
            NavigationLink(destination: RewardsView())})
            
            //Create Return button 
            let returnButton = UIAlertAction(title: "Return to Goals", style: .cancel, handler: { (action) -> 
            NavigationLink(destination: GoalsListView())})

            //Add the buttons to the alert message
            alertMessage.add(view)
            alertMessage.add(returnButton)

            self.present(alertMessage, animate: true, completion: nil)

        }
    }
}
