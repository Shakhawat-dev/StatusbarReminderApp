//
//  HomeView.swift
//  StatusbarReminderApp
//
//  Created by Shakhawat Hossain Shahin on 7/4/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = HomeViewModel()
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(vm.routineData) { item in
                        Text(item.title ?? "")
                    }
                    
                }
                
            }
        }
        .toolbar(content: {
            Button("New Routine +") {
                openWindow(id: "routine")
            }
        })
        .navigationTitle(Text("Routine"))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
