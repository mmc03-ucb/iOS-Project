//
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
    var isComplete: Bool = false
}

struct ToDoView: View {
    @State private var selectedTimeframe: Timeframe = .today
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    let todoItems = [
        TodoItem(dueDate: Date(), task: "Today Example: Finish project"),
        TodoItem(dueDate: Date().addingTimeInterval(60 * 60 * 24), task: "Weekly Example: Buy groceries"),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("ToDo")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.yellow)
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
                
                List(todoItems.filter { item in
                    switch selectedTimeframe {
                    case .today:
                        return Calendar.current.isDateInToday(item.dueDate)
                    case .weekly:
                        return Calendar.current.isDate(item.dueDate, equalTo: Date(), toGranularity: .weekOfYear)
                    case .monthly:
                        return Calendar.current.isDate(item.dueDate, equalTo: Date(), toGranularity: .month)
                    }
                }) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(dateFormatter.string(from: item.dueDate))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(item.task)
                                .font(.headline)
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    enum Timeframe {
        case today
        case weekly
        case monthly
    }
}
