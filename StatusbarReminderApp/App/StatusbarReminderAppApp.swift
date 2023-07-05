//
//  StatusbarReminderAppApp.swift
//  StatusbarReminderApp
//
//  Created by Shakhawat Hossain Shahin on 7/4/23.
//

import SwiftUI

@main
struct StatusbarReminderAppApp: App {
    @StateObject var vm = BaseViewModel()
    
    var body: some Scene {

        
        WindowGroup {
            NavigationView {
                Text("Helo")
                    .padding()
                
                
                ContentView()
            }
        }
        
        MenuBarExtra(vm.text) {
            VStack {
                TextField("Helo", text: $vm.text)
                                
                Button("Quit") {

                    NSApplication.shared.terminate(nil)

                }.keyboardShortcut("q")
            }
            .padding()
            
            
        }
        .menuBarExtraStyle(.window)
        
        Window("New Routine", id: "routine") {
            RoutineAddView()
                .frame(width: 320)
        }
        
    }
}
