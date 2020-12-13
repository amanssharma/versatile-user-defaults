//
//  SampleModel.swift
//  VersatileUserDefaultsSample
//
//  Created by Aman Sharma on 07/07/20.
//  Copyright © 2020 Aman Sharma. All rights reserved.
//

import Foundation

let customDefaults = UserDefaults.init(suiteName: "customDefaultsSuite")!

struct SampleDataObject {
    @VersatileUserDefaults(key: "a-boolean-value", defaultValue: true) var boolVar: Bool
    
    @VersatileUserDefaults(key: "an-int-value", defaultValue: 20) var intVar: Int
    
    @VersatileUserDefaults(key: "a-string", defaultValue: "") var stringVar: String
    
    @VersatileUserDefaults(key: "a-nullable-string") var nullableStringVar: String?
}

class SampleModel: ObservableObject {
    @Published var storedEntity: SampleDataObject = SampleDataObject()
    
    func update(value: Bool) {
        storedEntity.boolVar = value
    }
    
    func update(value: Int) {
        storedEntity.intVar = value
    }
    
    func update(value: String) {
        storedEntity.stringVar = value
    }
    
    func update(value: String?) {
        storedEntity.nullableStringVar = value
    }
}
