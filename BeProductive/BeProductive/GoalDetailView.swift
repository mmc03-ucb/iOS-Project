//
//  GoalDetailView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/15/23.
//

import SwiftUI

struct GoalDetailView: View {
    @EnvironmentObject var goalStore: GoalStore
    @State private var showingEditView = false
    let goal: Goal

    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.title)
                .font(.largeTitle)
                .padding(.bottom)
            Text(goal.description)
                .font(.body)
                .padding(.bottom)
            Text("Due Date: \(goal.dueDate, style: .date)")
                .font(.subheadline)
                .padding(.bottom)
            Text("Status: \(goal.status.rawValue)")
                .font(.subheadline)
                .padding(.bottom)

            // Example related activities list
            List {
                Text("Related Activities")
                    .font(.headline)
                // Display related activities here
            }

            Spacer()

            Button(action: {
                showingEditView.toggle()
            }, label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            })
            .padding(.bottom)
        }
        .padding()
        .sheet(isPresented: $showingEditView) {
            //EditGoalView(goal: $goal)
        }
        .navigationTitle("Goal Details")
    }
}
