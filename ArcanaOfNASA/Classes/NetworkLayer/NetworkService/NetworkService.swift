//
//  NetworkService.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 01.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Moya



struct Constants {
    static let baseNASAapiURL = "https://api.nasa.gov"
    static let apiKeyNASA = "SiDrCrk2IEN2qgbiHwhe4nG3C1Gx5TNEOVhZXGyx"
    
}

enum NetworkService {
    case fetchAPOD() //APOD - Astronomy Picture Of the Day
    case fetchAPODForDate(dateString: String) //"YYYY-MM-DD"
    case fetchMarsPhotos(earthDateString: String) //"YYYY-MM-DD"
}

// MARK: TargetType Protocol Implementation
extension NetworkService: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseNASAapiURL)!
    }
    var path: String {
        switch self {
        case .fetchAPOD(), .fetchAPODForDate(dateString: _):
            return "/planetary/apod"
        case .fetchMarsPhotos(earthDateString: _):
            return "/mars-photos/api/v1/rovers/curiosity/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchAPOD(), .fetchAPODForDate(dateString: _), .fetchMarsPhotos(earthDateString: _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchAPOD():
            return .requestParameters(parameters: ["api_key": Constants.apiKeyNASA], encoding: URLEncoding.queryString)
        case .fetchAPODForDate(dateString: let dateString):
            return .requestParameters(parameters: ["api_key": Constants.apiKeyNASA, "date": dateString], encoding: URLEncoding.queryString)
        case .fetchMarsPhotos(earthDateString: let earthDate):
            return .requestParameters(parameters: ["api_key": Constants.apiKeyNASA, "earth_date": earthDate], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
