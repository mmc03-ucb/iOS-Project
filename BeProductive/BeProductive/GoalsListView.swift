//
//  GoalsListView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//

import SwiftUI

struct GoalsListView: View {
    @State private var goals: [Goal] = [
        Goal(title: "Goal 1", description: "Description 1", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Study Star")),
        Goal(title: "Goal 2", description: "Description 2", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Focus Session")),
        Goal(title: "Goal 3", description: "Description 3", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Pomodoro Warrior"))
    ]
    @EnvironmentObject var goalStore: GoalStore
    
    @State private var showingAddGoalView = false
    @State private var showingCongratulatoryPopup = false
    @State private var completedGoal: Goal?

    func showCongratulatoryPopup(goal: Goal) {
        completedGoal = goal
        showingCongratulatoryPopup = true
    }

    

    var body: some View {
            NavigationView {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(goalStore.goals) { goal in
                            GoalCardView(goal: goal, onDelete: {
                                if let index = goalStore.goals.firstIndex(where: { $0.id == goal.id }) {
                                    goalStore.goals.remove(at: index)
                                }
                            }, onComplete: {
                                if let index = goalStore.goals.firstIndex(where: { $0.id == goal.id }) {
                                    goalStore.goals[index].status = .completed
                                    goalStore.goals[index].reward.dateAchieved = Date()
                                    goalStore.goals[index].reward.associatedGoalID = goal.id
                                    showCongratulatoryPopup(goal: goalStore.goals[index])
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
                    AddGoalView(goals: $goalStore.goals)
                }
                .alert(isPresented: $showingCongratulatoryPopup) {
                    Alert(title: Text("Congratulations!"),
                          message: Text("You have completed the goal '\(completedGoal?.title ?? "")' and earned a \(completedGoal?.reward.rewardName ?? "") reward."),
                          dismissButton: .default(Text("OK")))
                }
            }
        }
    }

struct GoalCardView: View {
    let goal: Goal
    let onDelete: () -> Void
    let onComplete: () -> Void

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
            
            if goal.status == .pending {
                            Button(action: onComplete) {
                                Text("Complete")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(Color.green)
                                    .cornerRadius(5)
                            }
                            .padding(.trailing, 8)
                        }
            
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
    var reward: Reward
    
    enum GoalStatus: String {
        case completed = "Completed"
        case pending = "Pending"
    }
}
