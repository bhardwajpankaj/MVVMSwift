//
//  ViewModel.swift
//  MVVMSwift
//
//  Created by user on 22/03/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ViewModel: NSObject {

    var networkCall = NetworkCall()

    var responseArray: [NSDictionary]?
    
    func getList(completionHandler: @escaping () -> Void) {
        
        networkCall.getDataFromServer { (responseData) in
            
            DispatchQueue.main.async {
                self.responseArray = responseData
                completionHandler()
            }
        }
    }
    
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return responseArray?.count ?? 0
    }
    
    func cellTitleForCell(for indexPath: IndexPath) -> String {
        return responseArray?[indexPath.row].value(forKeyPath: "name") as? String ?? ""
    }
}
