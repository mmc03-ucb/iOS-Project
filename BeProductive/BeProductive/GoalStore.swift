//
//  GoalStore.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 5/1/23.
//

import Combine
import SwiftUI

class GoalStore: ObservableObject {
    @Published var goals: [Goal] = [
        Goal(title: "Goal 1", description: "Description 1", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Study Star")),
        Goal(title: "Goal 2", description: "Description 2", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Focus Session")),
        Goal(title: "Goal 3", description: "Description 3", dueDate: Date(), status: .pending, reward: Reward(rewardName: "Pomodoro Warrior"))
    ]
    @Published var todoItems: [TodoItem] = []
    var completedRewards: [Reward] {
        goals.filter { $0.status == .completed }.map { $0.reward }
    }
}
