//
//  UserOrderViewModel.swift
//  TestAppSwiftUI_Constraints
//
//  Created by Stephen Clark on 16/01/2022.
//

import Foundation

class UserOrderViewModel: ObservableObject {

    // Your Details
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var dateOfBirth: Date = Date(timeIntervalSince1970: TimeInterval(323456789))
    @Published var emailAddress: String = ""
    
    // Your Address
    @Published var addressLineOne: String = ""
    @Published var addressLineTwo: String = ""
    @Published var townOrCity: String = ""
    @Published var city: String = ""
    @Published var postcode: String = ""
    
    @Published var complete: Bool = false
    
    init() {
        $firstName
            .map { $0.isEmpty ? false: true }
            .assign(to: &$complete)
    }
}
