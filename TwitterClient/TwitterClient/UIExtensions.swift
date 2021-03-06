//
//  UIExtensions.swift
//  TwitterClient
//
//  Created by Kent Rogers on 3/23/17.
//  Copyright © 2017 Austin Rogers. All rights reserved.
//

import UIKit

extension UIImage {
    
    typealias ImageCallback = (UIImage?)->()
    
    class func fetchImageWith(_ urlString : String, callback: @escaping ImageCallback) {
     
        OperationQueue().addOperation {
            
            guard let url = URL(string: urlString) else { callback(nil); return }
            
            if let data = try? Data(contentsOf: url) {
                
                let image = UIImage(data: data)
                
                OperationQueue.main.addOperation {
                    
                    callback(image)
                
                }
                
            }
            
            OperationQueue.main.addOperation {
                
                callback(nil)
                
            }
            
        }
        
    }
    
}

extension UIResponder {
    static var identifier : String {
        return String(describing: self)
    }
}






















