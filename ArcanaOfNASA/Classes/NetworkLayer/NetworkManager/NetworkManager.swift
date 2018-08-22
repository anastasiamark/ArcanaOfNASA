    //
//  NetworkManager.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 01.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper

typealias APODCompletion = (AstronomyPictureOfTheDay?, Error?) -> Void
typealias MarsPhotosCompletion = ([MarsRoverPhoto?], Error?) -> Void

class NetworkManager: NSObject {
    
    func fetchAPOD(completion: APODCompletion?) {
        let provider = MoyaProvider<NetworkService>()
        provider.request(.fetchAPOD()) { result in
            switch result {
            case let .success(moyaResponse):                
                do {
                    let jsonAPOD = try moyaResponse.mapJSON()
                    print(jsonAPOD)
                    let apod = try moyaResponse.map(to: AstronomyPictureOfTheDay.self)
                    
                    if let completion = completion {
                        completion(apod, nil)
                    }
                    print(apod)
                    
                } catch {
                    print(error.localizedDescription)
                    print(MoyaError.objectMapping(error, moyaResponse))
                    if let completion = completion {
                        completion(nil, error)
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
                if let completion = completion {
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchAPODForDate(date: String, completion: APODCompletion?) {
        let provider = MoyaProvider<NetworkService>()
        provider.request(.fetchAPODForDate(dateString: date)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let jsonAPOD = try moyaResponse.mapJSON()
                    print(jsonAPOD)
                    let apod = try moyaResponse.map(to: AstronomyPictureOfTheDay.self)
                    
                    if let completion = completion {
                        completion(apod, nil)
                    }
                    print(apod)
                    
                } catch {
                    print(error.localizedDescription)
                    if let completion = completion {
                        completion(nil, error)
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
                if let completion = completion {
                    completion(nil, error)
                }
            }
        }
    }
    
    func fetchMarsPhotosForEarthDate(earthDate: String, completion: MarsPhotosCompletion?) {
        let provider = MoyaProvider<NetworkService>()
        provider.request(.fetchMarsPhotos(earthDateString: earthDate)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let jsonMarthPhotos = try moyaResponse.mapJSON()
                    print(jsonMarthPhotos)
                    let marsPhotos = try moyaResponse.map(to: [MarsRoverPhoto].self, keyPath: "photos")
                    print(marsPhotos)
                    
                    if let completion = completion {
                        completion(marsPhotos, nil)
                    }
                } catch {
                    print(error.localizedDescription)
                    if let completion = completion {
                        completion([], error)
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
                if let completion = completion {
                    completion([], error)
                }
            }
        }
    }
    
}
