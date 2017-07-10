//
//  Recipes.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 6/30/17.
//  Copyright © 2017 Solde. All rights reserved.
//

import Foundation
import UIKit

class Recipes: NSObject {
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    
    var rating: String = "rating"
    
    var isFavourite: Bool = false
    
    init (name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]){
        
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
        
        
    }
    
}
