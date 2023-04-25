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
    
    enum GoalStatus: String {
        case completed = "Completed"
        case pending = "Pending"
    }
}
