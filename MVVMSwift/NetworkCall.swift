//
//  NetworkCall.swift
//  MVVMSwift
//
//  Created by user on 22/03/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class NetworkCall: NSObject {

    func getDataFromServer(completionHandler: @escaping ([NSDictionary]?) -> Void) {
        
        guard let url = URL(string: "https://dl.dropboxusercontent.com/s/jnxbs21h3bkm3qe/tableData.json?dl=0") else {
            print("Error");
            return
        }
        
        let sesseionDataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else {
                print("Error with data");
                return
            }
            
            do {
                if let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments) as? NSDictionary {
                    
                    if let apps = responseJSON.value(forKeyPath: "data.events") as? [NSDictionary] {
                        completionHandler(apps)
                    }
                }
            } catch {
                completionHandler(nil)
                print("Error : \(error.localizedDescription)")
            }
        }
        sesseionDataTask.resume()
    }
    
}
