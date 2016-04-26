//
//  ModelManager.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Cocoa

class ModelManager: NSObject {
    class func parseDataToModel(XMLData : NSData) -> [EntityModel]{
        let xml = SWXMLHash.parse(XMLData)
        
        var listEntityModel = [EntityModel]()
        
        let model = xml["model"]
        let entities = model["entity"]
        
        for entitie in entities{
            let entityModel = EntityModel()
            entityModel.name = entitie.element!.attributes["name"]
            entityModel.attributes = [AttributeModel]()
            entityModel.relationships = [RelationshipModel]()
            
            let attributes = entitie["attribute"]
            for attribute in attributes{
                let attributeModel = AttributeModel()
                attributeModel.name = attribute.element!.attributes["name"]
                attributeModel.attributeType = attribute.element!.attributes["attributeType"]
                attributeModel.optionalValue = attribute.element!.attributes["optional"] == nil ? false : true
                entityModel.attributes.append(attributeModel)
            }
            let relationships = entitie["relationship"]
            for relationship in relationships{
                let relationshipModel = RelationshipModel()
                relationshipModel.name = relationship.element!.attributes["name"]
                relationshipModel.optionalValue = relationship.element!.attributes["optional"] == nil ? false : true
                relationshipModel.toMany = relationship.element!.attributes["toMany"] == nil ? false : true
                relationshipModel.inverseEntity = relationship.element!.attributes["inverseEntity"]
                entityModel.relationships.append(relationshipModel)
            }
            listEntityModel.append(entityModel)
        }
        
        return listEntityModel
    }
}
