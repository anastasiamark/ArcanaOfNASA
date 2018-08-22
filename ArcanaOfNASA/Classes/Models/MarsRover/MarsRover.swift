//
//  MarsRover.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 20.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Mapper

class MarsRover: Mappable {
    
    let roverId: Int?
    let landingDate: String?
    let launchDate: String?
    let maxDate: String?
    let maxSol: Int?
    let name: String?
    let status: String?
    let totalPhotos: Int?
    let cameras: [Camera?]?
    
    required init(map: Mapper) throws {
        roverId = map.optionalFrom("id")
        landingDate = map.optionalFrom("landing_date")
        launchDate = map.optionalFrom("launch_date")
        maxDate = map.optionalFrom("max_date")
        maxSol = map.optionalFrom("max_sol")
        name = map.optionalFrom("name")
        status = map.optionalFrom("status")
        totalPhotos = map.optionalFrom("total_photos")
        cameras = map.optionalFrom("cameras")
    }
    
    
    
}
