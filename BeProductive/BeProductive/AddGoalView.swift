//
//  AddGoalView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//

import SwiftUI

struct AddGoalView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var goals: [Goal]

    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var selectedCategory = 0
    @State private var customReward = ""

    let categories = ["Studying", "Office Work", "Working Out", "Eating Healthy", "Drinking Water"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Goal Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }

                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(0 ..< categories.count) {
                            Text(categories[$0])
                        }
                    }
                }

                Section(header: Text("Custom Reward")) {
                    TextField("Enter custom reward", text: $customReward)
                }

                Button("Save") {
                    let reward = Reward(rewardName: customReward.isEmpty ? "General Reward" : customReward)
                    let newGoal = Goal(title: title, description: description, dueDate: dueDate, status: .pending, reward: reward)
                    goals.append(newGoal)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Add Goal", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}


