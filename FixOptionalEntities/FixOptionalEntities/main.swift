//
//  main.swift
//  FixOptionalEntities
//
//  Created by renanvs on 4/25/16.
//  Copyright © 2016 mwg. All rights reserved.
//

import Foundation

func starService(){
    
    let documentsUrl =  NSBundle.mainBundle().bundleURL
    print("rvs_2 - \(documentsUrl.absoluteString)")
    //let documentsPath : AnyObject = NSBundle.mainBundle().bundlePath
    //print("rvs_22 - \(documentsPath)")
    do {
        let directoryUrls = try  NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsUrl, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
        let listModel = directoryUrls.filter{ $0.pathExtension == "xcdatamodeld" }
        if listModel.count > 0{
            
            print("rvs_3 - listModel.count > 0")
            let modelPath = listModel.first!
            
            let subModelPath = try  NSFileManager.defaultManager().contentsOfDirectoryAtURL(modelPath, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions()).first!
            
            let fullPath = subModelPath.URLByAppendingPathComponent("contents")
            
            print("rvs_4 - \(fullPath)")
            
            let XMLData = NSData(contentsOfURL: fullPath)!
            
            let listEntityModel = ModelManager.parseDataToModel(XMLData)
            
            print("rvs_5 - \(listEntityModel)")
            
            ChangeClassManager.convertModelToClassFiles(listEntityModel)
            
            print("rvs_6 - should create files")
            
            
            print("finished")
            
        }
        
        
    } catch let error as NSError {
        print(error.localizedDescription)
    }
}


print("rvs_1")
starService()