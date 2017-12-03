//
//  REST.swift
//  RM31956
//
//  Created by rafael on 01/12/17.
//  Copyright © 2017 rafael. All rights reserved.
//

import Foundation
import UIKit

class REST{
    
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type": "aaplication/json"]
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    static func loadBeers(onComplete: @escaping([Beer]?) -> Void){
        guard let url = URL(string: basePath) else {return}
        
        session.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
            if error != nil{
                print("Não foi possivel acessar as Brejas")
                onComplete(nil)
            }else{
                guard let response = response as? HTTPURLResponse else{
                    print("1")
                    onComplete(nil)
                    return
                }
                if response.statusCode == 200{
                    guard let data = data else{
                        onComplete(nil)
                        return
                    }
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String:Any]]
                        
                        var beers: [Beer] = []
                        
                        for item in json{
                            let id = item["id"] as! Int
                            let name = item["name"] as! String
                            let tagline = item["tagline"] as!String
                            let description = item["description"] as! String
                            let image_url = item["image_url"] as! String
                            let abv = item["abv"] as! Float
                            let ibu = item["ibu"] as? Float ?? 0
                            
                            let beer = Beer(id: id, name: name, tagline: tagline, description: description, image_url: image_url, abv: abv, ibu: ibu)
                            
                            beers.append(beer)
                            print(beers)
                            
                        }
                        onComplete(beers)
                        
                    }catch{
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }else{
                    print(response.statusCode)
                    onComplete(nil)
                }
            }
        }.resume()
    }
}
