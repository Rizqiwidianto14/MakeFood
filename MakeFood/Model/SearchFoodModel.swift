//
//  SearchFoodModel.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import Foundation
import ObjectMapper


struct Meals: Mappable{
    
    var id : String?
    var mealName : String?
    var mealOrigin : String?
    var mealImage : String?
    var instruction : String?
    
    var ingredient1 : String?
    var ingredient2 : String?
    var ingredient3 : String?
    var ingredient4 : String?
    var ingredient5 : String?
    var ingredient6 : String?
    var ingredient7 : String?
    var ingredient8 : String?
    var ingredient9 : String?
    var ingredient10 : String?
    var ingredient11 : String?
    var ingredient12 : String?
    var ingredient13 : String?
    var ingredient14 : String?
    var ingredient15 : String?
    var ingredient16 : String?
    var ingredient17 : String?
    var ingredient18 : String?
    var ingredient19 : String?
    var ingredient20 : String?
    
    var measurement1 : String?
    var measurement2 : String?
    var measurement3 : String?
    var measurement4 : String?
    var measurement5 : String?
    var measurement6 : String?
    var measurement7 : String?
    var measurement8 : String?
    var measurement9 : String?
    var measurement10 : String?
    var measurement11 : String?
    var measurement12 : String?
    var measurement13 : String?
    var measurement14 : String?
    var measurement15 : String?
    var measurement16 : String?
    var measurement17 : String?
    var measurement18 : String?
    var measurement19 : String?
    var measurement20 : String?
    
    
    
    
    init?(map: Map) {
        
        
    }
    
    mutating func mapping(map: Map) {
        id    <- map["idMeal"]
        mealName    <- map["strMeal"]
        mealOrigin    <- map["strArea"]
        mealImage    <- map["strMealThumb"]
        instruction    <- map["strInstructions"]
        
        ingredient1    <- map["strIngredient1"]
        ingredient2    <- map["strIngredient2"]
        ingredient3    <- map["strIngredient3"]
        ingredient4    <- map["strIngredient4"]
        ingredient5    <- map["strIngredient5"]
        ingredient6    <- map["strIngredient6"]
        ingredient7    <- map["strIngredient7"]
        ingredient8    <- map["strIngredient8"]
        ingredient9    <- map["strIngredient9"]
        ingredient10   <- map["strIngredient10"]
        ingredient11    <- map["strIngredient11"]
        ingredient12    <- map["strIngredient12"]
        ingredient13    <- map["strIngredient13"]
        ingredient14    <- map["strIngredient14"]
        ingredient15    <- map["strIngredient15"]
        ingredient16    <- map["strIngredient16"]
        ingredient17    <- map["strIngredient17"]
        ingredient18    <- map["strIngredient18"]
        ingredient19    <- map["strIngredient19"]
        ingredient20    <- map["strIngredient20"]
        
        measurement1    <- map["strMeasure1"]
        measurement2    <- map["strMeasure2"]
        measurement3    <- map["strMeasure3"]
        measurement4    <- map["strMeasure4"]
        measurement5    <- map["strMeasure5"]
        measurement6    <- map["strMeasure6"]
        measurement7    <- map["strMeasure7"]
        measurement8    <- map["strMeasure8"]
        measurement9    <- map["strMeasure9"]
        measurement10   <- map["strMeasure10"]
        measurement11    <- map["strMeasure11"]
        measurement12    <- map["strMeasure12"]
        measurement13    <- map["strMeasure13"]
        measurement14    <- map["strMeasure14"]
        measurement15    <- map["strMeasure15"]
        measurement16    <- map["strMeasure16"]
        measurement17    <- map["strMeasure17"]
        measurement18    <- map["strMeasure18"]
        measurement19    <- map["strMeasure19"]
        measurement20    <- map["strMeasure20"]
        
        
        
        
    }
    
    
}
