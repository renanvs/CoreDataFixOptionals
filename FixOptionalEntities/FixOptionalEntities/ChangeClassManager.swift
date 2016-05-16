//
//  ChangeClassManager.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Cocoa

class ChangeClassManager: NSObject {

    class func convertModelToClassFiles(list : [EntityModel]){
        let documentsUrl =  NSBundle.mainBundle().bundleURL
        //let documentsUrl2 =  NSURL(string:NSFileManager.defaultManager().currentDirectoryPath)!
        print("AA - \(documentsUrl)")
        //print("AAA - \(documentsUrl2)")
        
        for entityModel in list{    
            //let entityPath = documentsUrl.URLByAppendingPathComponent("\(entityModel.name)+CoreDataProperties.swift")
            let entityPath = NSURL(fileURLWithPath: NSBundle.mainBundle().bundlePath).URLByAppendingPathComponent("\(entityModel.name)+CoreDataProperties.swift")
            
            //let data = NSData(contentsOfURL: entityPath)!
            var classStr = ""
            
            do{
                classStr = try NSString(contentsOfURL: entityPath, encoding: NSUTF8StringEncoding) as String
            }catch let error as NSError {
                print(error.localizedDescription)
            }
            
            
            for attributeModel in entityModel.attributes{
                if attributeModel.optionalValue == false{
                    let currentLabel = "\(attributeModel.name): \(attributeModel.attributeFinalType)?"
                    let finalLabel = "\(attributeModel.name): \(attributeModel.attributeFinalType)!"
                    classStr = classStr.stringByReplacingOccurrencesOfString(currentLabel, withString: finalLabel)
                }
            }
            
            for relationshipModel in entityModel.relationships{
                if relationshipModel.optionalValue == false{
                    if relationshipModel.toMany == false{
                        let currentLabel = "\(relationshipModel.name): \(relationshipModel.inverseEntity!)?"
                        let finalLabel = "\(relationshipModel.name): \(relationshipModel.inverseEntity!)!"
                        classStr = classStr.stringByReplacingOccurrencesOfString(currentLabel, withString: finalLabel)
                    }else{
                        let currentLabel = "\(relationshipModel.name): NSSet?"
                        let finalLabel = "\(relationshipModel.name): NSSet!"
                        classStr = classStr.stringByReplacingOccurrencesOfString(currentLabel, withString: finalLabel)
                    }
                }
            }
            
            do{
                try classStr.writeToFile("\(NSBundle.mainBundle().bundlePath)/\(entityModel.name)+CoreDataProperties.swift", atomically: true, encoding: NSUTF8StringEncoding)
            }catch{
                print("err 2")
            }
        }
    }
    
}
