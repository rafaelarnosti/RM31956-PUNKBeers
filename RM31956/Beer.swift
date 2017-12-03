//
//  Beer.swift
//  RM31956
//
//  Created by rafael on 01/12/17.
//  Copyright © 2017 rafael. All rights reserved.
//

import Foundation

class Beer{
    
    var id: Int
    var name: String
    var tagline: String
    var description: String
    var image_url: String
    var abv: Float
    var ibu: Float?
    
    init(id: Int, name: String, tagline:String, description:String,image_url:String, abv:Float,ibu:Float)
    {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.image_url = image_url
        self.abv = abv
        self.ibu = ibu
    }
    
}
