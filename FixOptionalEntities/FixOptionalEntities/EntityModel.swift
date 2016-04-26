//
//  EntityModel.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Cocoa

class EntityModel: NSObject {
    var name : String!
    var attributes : [AttributeModel]!
    var relationships : [RelationshipModel]!
}
