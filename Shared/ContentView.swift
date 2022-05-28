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
    
    case reminder = "Reminder"
    case assignment = "Assignment"
    case summative = "Summative"
}

extension Priority {
    
    var title: String {
        switch self {
            case .reminder:
                return "Reminder"
            case .assignment:
                return "Assignment"
            case .summative:
                return "Summative"
        }
    }
}

struct ContentView: View {
    
    @State private var title: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Title", text: $title)
                    .textFieldStyle(.roundedBorder)
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
