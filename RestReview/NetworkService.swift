//
//  NetworkService.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/26/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import Foundation
import Moya

private let apiKey = ""
enum RapidServices{
    enum BussienessProvider: TargetType{
        case search(lat: Double, long: Double)
        var baseURL: URL{
            return URL(string: "https://tripadvisor1.p.rapidapi.com/restaurants/list")!
        }
        
        var path: String{
            switch self{
            case .search:
                return "/search"
            }
        }
        
        var method: Moya.Method{
            return .get
        }
        
        var sampleData: Data{
            return Data()
        }
        
        var task: Task{
            switch self{
            case let .search(lat, long):
                return .requestParameters(parameters: ["Latitude" : lat, "Longtide": long, "Limit": 1], encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]?{
            return ["x-rapidapi-host": "tripadvisor1.p.rapidapi.com",
                   "x-rapidapi-key": "d3a0128a81mshed13504589ac264p156ed1jsn69f91e442d4d"]
        }
        
    }

}
