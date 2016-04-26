//
//  AttributeModel.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Cocoa

class AttributeModel: NSObject {
    var name : String!
    var attributeType : String!
    var optionalValue : Bool!
    var attributeFinalType:String!{
        get{
            if attributeType == "Integer 32" || attributeType == "Float" || attributeType == "Integer 16" {
                return "NSNumber"
            }
            
            return attributeType
        }
    }
    
}
