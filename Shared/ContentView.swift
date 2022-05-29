//
//  ContentView.swift
//  Shared
//
//  Created by user217900 on 5/28/22.
//

import SwiftUI

enum Priority: String, Identifiable, CaseIterable {
    var id: UUID {
        return UUID()
    }
    
    case reminders = "Reminders"
    case assignments = "Assignments"
    case summative = "Summative"
}

extension Priority {
    
    var title: String {
        switch self {
            case .reminders:
                return "Reminders"
            case .assignments:
                return "Assignments"
            case .summative:
                return "Summative"
        }
    }
}
struct ContentView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .assignments
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors:
                    [NSSortDescriptor(key: "dateDue", ascending: false)]) private var allTasks: FetchedResults<Task>
    
    private func saveTask() {
        
        do {
            let task = Task(context:viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateDue = Date()
            try viewContext.save()
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $selectedPriority) { ForEach(Priority.allCases) { priority in
                    Text(priority.title).tag(priority)
                }
                }.pickerStyle(.segmented)
                
                Button("Save") {
                    saveTask()
                } .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                
                List {
                    
                    ForEach(allTasks) { task in
                        Text(task.title ?? "")
                    }
                    
                }
                
                
                Spacer()
            }
            .padding()
            .navigationTitle("All Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
