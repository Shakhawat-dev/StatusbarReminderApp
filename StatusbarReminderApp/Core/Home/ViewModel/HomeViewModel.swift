//
//  HomeViewModel.swift
//  StatusbarReminderApp
//
//  Created by Shakhawat Hossain Shahin on 7/4/23.
//

import Foundation
import AppKit
import SwiftUI

class HomeViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var routineData: [RoutineEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "RoutineContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA! \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        
        fetchRoutine()
    }
    
    func fetchRoutine() {
        let request = NSFetchRequest<RoutineEntity>(entityName: "RoutineEntity")
        
        do {
            routineData = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching RountineEntity Core Data \(error)")
        }
    }
    
    func addRoutine(title: String, remindTime: Date, duration: Double, details: String) {
        let newRoutine = RoutineEntity(context: container.viewContext)
        newRoutine.title = title
        newRoutine.remindTime = remindTime
        newRoutine.duration = duration
        newRoutine.details = details
        
        saveRoutine()
    }
    
    func saveRoutine() {
        do {
            try container.viewContext.save()
            fetchRoutine()
        } catch let error {
            print("Error Saving Routine to Core Data \(error)")
        }
        
    }
}
