//
//  Person.swift
//  SwiftStub
//
//  Created by Matt Casey on 07/05/2015.
//  Copyright (c) 2015Digital Ice ltd. All rights reserved.
//

import UIKit

class Person : NSObject {
    var firstName: String
    var lastName: String
    var fullName: String {
        return self.calculateFullName()
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func calculateFullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
}
