//
//  Drug.swift
//  KirkeCabinate
//
//  Created by John Pavley on 6/22/18.
//  Copyright © 2018 John Pavley. All rights reserved.
//

import UIKit

/// Model of a medication.
/// See https://health-lifesci.schema.org/Drug for inspiration
class Drug {
    
    // MARK: - Enums -
    
    /// String constants for keys
    enum DrugKey: String {
        case name = "name"
        case units = "units"
        case strength = "strength"
        case form = "form"
        case bundleFile = "Drug_Data"
        case bundleType = "plist"
    }
    
    /// The form of this drug, tablet, suspension, injection, etc...
    enum DrugForm: Int, CustomStringConvertible {
        case unknown = 0, tablet, suspension, injection, cream, spray
        
        var description: String {
            
            switch self {
            case .unknown:
                return "unknown form"
            case .tablet:
                return "tablet"
            case .suspension:
                return "liquid"
            case .injection:
                return "injection"
            case .cream:
                return "cream"
            case .spray:
                return "spray"
            }
        }
    }
    
    /// The units with which the drug's strength is measured
    enum DrugUnit: Int, CustomStringConvertible {
        case unknown = 0, mg, mcg, ml, percent
        
        var description: String {
            
            switch self {
            case .unknown:
                return "unknown unit"
            case .mg:
                return "MG"
            case .mcg:
                return "MCG"
            case .ml:
                return "ML"
            case .percent:
                return "%"
            }
        }

    }
    
    // MARK: - Properties -
    
    /// Pharmacy or retail name (name on the package)
    var name: String
    
    /// The units with which the drug's strength is measured
    var units: DrugUnit
    
    /// The value of the of the drug's strength
    var strength: Double
    
    /// The form of this drug, tablet, suspension, injection, etc...
    var form: DrugForm
    
    // MARK: - Initializers -
    
    init(name: String,
         units: DrugUnit,
         strength: Double,
         form: DrugForm) {
        
        self.name = name
        self.units = units
        self.strength = strength
        self.form = form
    }
    
    convenience init(dictionary: Dictionary<String, Any>) {
        
        if
            let name = dictionary[DrugKey.name.rawValue] as? String,
            let units = dictionary[DrugKey.units.rawValue] as? Int,
            let strength = dictionary[DrugKey.strength.rawValue] as? Double,
            let form = dictionary[DrugKey.form.rawValue] as? Int {
            
            self.init(name: name,
                      units: DrugUnit(rawValue: units)!,
                      strength: strength,
                      form: DrugForm(rawValue: form)!)
            
        } else {
            
            print("error initalizating Drug class from Dictionary")
            self.init(name: "",
                      units: .unknown,
                      strength: 0,
                      form: .unknown)
        }
    }
    
    class func loadDrugs() -> [Drug] {
        var drugs = [Drug]()
        
        if let path = Bundle.main.path(forResource: DrugKey.bundleFile.rawValue, ofType: DrugKey.bundleType.rawValue) {
            
            if let dictArray = NSArray(contentsOfFile: path) {
                
                for item in dictArray {
                    let drug = Drug(dictionary: item as! Dictionary)
                    drugs.append(drug)
                }
            }
        }
        
        return drugs
    }
}

extension Drug: CustomStringConvertible {
    
    var description: String {
        return "\(name) \(strength) \(units) \(form)"
    }
    
}
