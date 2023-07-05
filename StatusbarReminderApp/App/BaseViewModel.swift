//
//  BaseViewModel.swift
//  StatusbarReminderApp
//
//  Created by Shakhawat Hossain Shahin on 7/4/23.
//

import Foundation

class BaseViewModel: ObservableObject {
    @Published var text: String = "Type Something..."
}
