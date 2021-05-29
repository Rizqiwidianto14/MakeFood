//
//  SearchFoodRepository.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import Foundation
import Moya_ObjectMapper
import Moya


protocol Network{
    associatedtype T: TargetType
    var provider: MoyaProvider<T> {get}
}


class Repository: Network {
    let provider = MoyaProvider<MakeFoodApi>()

    func getFoodList(name: String, completion: @escaping([Meals]) -> ()) {
        provider.request(.searchFood(name: name)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try response.mapArray(Meals.self, atKeyPath: "meals")
                    completion(results)
                    print(results)
                    
                } catch let err{
                    print(err)
                    
                }
                
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
}
