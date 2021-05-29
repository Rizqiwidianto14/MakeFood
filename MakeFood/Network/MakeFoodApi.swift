//
//  SearchFoodApi.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import Foundation
import Moya

enum MakeFoodApi{
    case searchFood(name: String)
    case detailFood(id: String)
}

extension MakeFoodApi: TargetType{
    var baseURL: URL{
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/") else { fatalError("baseURL could not be configured.")}
          return url
    }
    
    var path: String{
        switch self{
        case .searchFood:
            return "search.php"
        case .detailFood:
            return "lookup.php"
        }
    }
    
    var method: Moya.Method{
        return Moya.Method.get
    }
    
    var sampleData: Data{
        return Data()
    }
    
    var task: Task{

        switch self {
        case .searchFood(let name):
            return .requestParameters(parameters: ["s":name], encoding: URLEncoding.queryString)

        case .detailFood(let id):
            return .requestParameters(parameters: ["i":id], encoding: URLEncoding.queryString)

        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
