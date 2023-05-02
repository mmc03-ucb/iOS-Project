//  TodoView.swift
//  BeProductive
//
//  Created by MUQUEET MOHSEN CHOWDHURY on 4/24/23.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let dueDate: Date
    let task: String
    let associatedGoal: String
    var isComplete: Bool = false
}

enum GroupByOption {
    case date
    case goal
}

struct ToDoView: View {
    @State private var selectedTimeframe: Timeframe = .today
    @State private var groupByOption: GroupByOption = .date
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    let todoItems = [
        TodoItem(dueDate: Date(), task: "Today Example: Finish project", associatedGoal: "Goal 1"),
        TodoItem(dueDate: Date().addingTimeInterval(60 * 60 * 24), task: "Weekly Example: Buy groceries", associatedGoal: "Goal 2"),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("📝 ToDo")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTimeframe = .today
                    }, label: {
                        Text("Today")
                    })
                    .padding(.trailing)
                    
                    Button(action: {
                        selectedTimeframe = .weekly
                    }, label: {
                        Text("Weekly")
                    })
                    .padding(.trailing)
                    
                    Button(action: {
                        selectedTimeframe = .monthly
                    }, label: {
                        Text("Monthly")
                    })
                    .padding(.trailing)
                }
                
                Divider()
                
                Picker(selection: $groupByOption, label: Text("Group By")) {
                    Text("Date").tag(GroupByOption.date)
                    Text("Goal").tag(GroupByOption.goal)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                List {
                    ForEach(groupByOption == .date ? todoItems.sorted(by: { $0.dueDate < $1.dueDate }) : todoItems.sorted(by: { $0.associatedGoal < $1.associatedGoal })) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(dateFormatter.string(from: item.dueDate))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(item.task)
                                    .font(.headline)
                                Text("Goal: \(item.associatedGoal)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            if item.isComplete {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    enum Timeframe {
        case today
        case weekly
        case monthly
    }
}
