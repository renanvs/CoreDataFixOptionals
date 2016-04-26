//
//  RelationshipModel.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Cocoa

class RelationshipModel: NSObject {
    var name : String!
    var optionalValue : Bool!
    var toMany : Bool!
    var inverseEntity : String?
}
