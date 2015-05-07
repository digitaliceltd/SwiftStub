//
//  TMTestCase.swift
//  SwiftStub
//
//  Created by Matt Casey on 07/05/2015.
//  Copyright (c) 2015Digital Ice ltd. All rights reserved.
//

import UIKit
import XCTest


private func StubMethodForObject(inout stubbedObjects: StubbedObjects, object: NSObject, method: String) {
    if stubbedObjects[object] == nil {
        stubbedObjects[object] = [:]
    }
    var methods = stubbedObjects[object]!
    methods[method] = false
    stubbedObjects[object] = methods
}

typealias StubbedObjects = [NSObject:StubbedMethods]
typealias StubbedMethods = [String: Bool]

class StubbedObjectManager {
    static var sharedInstance = StubbedObjectManager()
    
    var stubbedObjects: StubbedObjects = [:]
    
    func stubMethodForObject(object: NSObject, method: String) {
        StubMethodForObject(&self.stubbedObjects, object, method)
        println(stubbedObjects)
    }
    
    func hasMethodBeenCalled(object: NSObject, method: String) -> Bool {
        if stubbedObjects[object] == nil {
            return false
        }
        
        let stubbedMethods = stubbedObjects[object]!
        
        return stubbedMethods[method] ?? false
    }
    
    func markMethodCalled(object: NSObject, method: String) {
        var stubbedMethods = stubbedObjects[object]
        if let stubbedMethodsLet = stubbedMethods, stubbedMethod = stubbedMethodsLet[method] {
            stubbedMethods![method] = true
        }
        stubbedObjects[object] = stubbedMethods
    }
    
    func clearStubbedObjects(objectsToClear: StubbedObjects) {
        for (key, value) in objectsToClear {
            self.stubbedObjects.removeValueForKey(key)
        }
    }
}
class SSTestCase: XCTestCase {
   
    private var stubbedObjects: StubbedObjects = [:]
    
    func stub(#method: String, onObject object:NSObject) {
        StubMethodForObject(&self.stubbedObjects, object, method)
        StubbedObjectManager.sharedInstance.stubMethodForObject(object, method: method)
    }
    
    override func tearDown() {
        StubbedObjectManager.sharedInstance.clearStubbedObjects(self.stubbedObjects)
        self.stubbedObjects = [:]
        super.tearDown()
    }
    
    
    
}

extension NSObject {
    func markMethodCalled(method: String) {
        StubbedObjectManager.sharedInstance.markMethodCalled(self, method: method)
    }
    func hasMethodBeenCalled(method: String) -> Bool {
        return StubbedObjectManager.sharedInstance.hasMethodBeenCalled(self, method: method)
    }
}