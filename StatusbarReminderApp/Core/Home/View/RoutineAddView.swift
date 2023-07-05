//
//  RoutineAddView.swift
//  StatusbarReminderApp
//
//  Created by Shakhawat Hossain Shahin on 7/4/23.
//

import SwiftUI

struct RoutineAddView: View {
    @State var title: String = ""
    @State var details: String = ""
    @State var time: Date = Date()
    
    var body: some View {
        ZStack {
            VStack {
                Text("Routine Title")
                
                TextField("Routine Title", text: $title)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                
                TextEditor(text: $details)
                    
                    .frame(minHeight: 128, maxHeight: 500, alignment: .leading)
                    .cornerRadius(8)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                DatePicker("Remind Time", selection: $time)
            }
            .padding()
        }
        .navigationTitle("Add Routine")
    }
}

struct RoutineAddView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineAddView()
    }
}
