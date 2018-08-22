//
//  Camera.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 21.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Mapper


class Camera: Mappable {
    
    let fullName: String?
    let cameraId: Int?
    let name: String?
    let roverId: Int?
    
    required init(map: Mapper) throws {
        fullName = map.optionalFrom("full_name")
        cameraId = map.optionalFrom("id")
        name = map.optionalFrom("name")
        roverId = map.optionalFrom("rover_id")
    }
}
