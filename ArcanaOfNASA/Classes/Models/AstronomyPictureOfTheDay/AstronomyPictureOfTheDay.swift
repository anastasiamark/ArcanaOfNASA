//
//  AstronomyPictureOfTheDay.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 02.08.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import Foundation
import Mapper

class AstronomyPictureOfTheDay: Mappable {
    
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let url: String?
    let title: String?
    let mediaType: String?
    
    
    required init(map: Mapper) throws {
        copyright = map.optionalFrom("copyright")
        date = map.optionalFrom("date")
        explanation = map.optionalFrom("explanation")
        hdurl = map.optionalFrom("hdurl")
        url = map.optionalFrom("url")
        title = map.optionalFrom("title")
        mediaType = map.optionalFrom("media_type")
    }
}
