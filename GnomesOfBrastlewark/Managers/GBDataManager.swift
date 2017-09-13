//
//  GBDataManager.swift
//  GnomesOfBrastlewark
//
//  Created by Axel Mosiejko on 9/11/17.
//  Copyright © 2017 Axel Mosiejko. All rights reserved.
//

import Foundation

class GBDataManager {
    
    class func getAllGnomes( completion: @escaping ([GBGnome]) -> Void) {
        
        loadDataFromURL(url: NSURL(string: "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json")!) { (data, error) in
            
            var gnomesArray = [GBGnome]()
   
            do {
                guard let
                    parsedObject = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any],
                    let brastlewark = parsedObject["Brastlewark"] as? [JSONDictionary]
                else { fatalError() }
                
                gnomesArray = brastlewark.map { GBGnome(dict: $0) }
                
            } catch {
                print(error)
            }
            
            completion(gnomesArray)
        }
    }
    
    
    /*class func getDataFromFileWithSuccess(success: @escaping ((_ data: NSData) -> Void)) {
        
        // Move to background thread
        DispatchQueue.global(qos: .userInitiated).async {
            let filePath = Bundle.main.path(forResource: NSLocalizedString("data", comment: ""),ofType:"json")
            
            do {
                let data = try NSData(contentsOfFile:filePath!,
                                      options: NSData.ReadingOptions.uncached)
                success(data)
            } catch {
                fatalError()
            }
        }
        
    }*/
    
    class func loadDataFromURL(url: NSURL, completion:@escaping (_ data: Data?, _ error:Error?) -> Void) {
        let session = URLSession.shared
        
        
        let loadDataTask = session.dataTask(with: url as URL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let responseError = error {
                
                completion(nil, responseError)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"raw.githubusercontent.com", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(nil, statusError)
                } else {
                    completion(data, nil)
                }
            }
        }
        
        loadDataTask.resume()
        
    }
}

