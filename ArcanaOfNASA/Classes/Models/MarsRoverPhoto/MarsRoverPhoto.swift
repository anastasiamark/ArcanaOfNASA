//
//  MarsRoverPhoto.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 20.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Mapper



class MarsRoverPhoto: Mappable {
    
    let photoURL: String?
    let photoId: Int?
    let earthDate: String?
    let sol: Int?
    let rover: MarsRover?
    let camera: Camera?
    
    //TODO: Entity Camera and Rover add property
    
    
    
    required init(map: Mapper) throws {
        photoURL = map.optionalFrom("img_src")
        photoId = map.optionalFrom("id")
        earthDate = map.optionalFrom("earth_date")
        sol = map.optionalFrom("sol")
        rover = map.optionalFrom("rover")
        camera = map.optionalFrom("camera")
    }
}
