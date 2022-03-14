//
//  JsonAPI.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/27.
//

import Foundation
import Moya

let JsonAPIProvider = MoyaProvider<JsonAPI>()

enum JsonAPI {
    case fetchSchools
    case fetchSATData
}

extension JsonAPI : TargetType {
    var baseURL: URL {
        
        guard let url = URL(string: BASE_URL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        
        switch self {
        case .fetchSchools:
            return ENDPOINT_SCHOOLS
        case .fetchSATData:
            return ENDPOINT_SAT
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchSchools:
            return .get
        case .fetchSATData:
            return .get
        }
    }
    
    var sampleData: Data {
        
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .fetchSchools:
            return .requestPlain
        case .fetchSATData:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        
        return [
            "Content-type": "application/json",
        ]
    }
}

extension Moya.Response {
    func jsonAPIResponse() throws -> Dictionary<String, Any> {
        let any = try self.mapJSON()
        guard let dic = any as? Dictionary<String, Any> else {
            throw MoyaError.jsonMapping(self)
        }
        return dic
    }
}


