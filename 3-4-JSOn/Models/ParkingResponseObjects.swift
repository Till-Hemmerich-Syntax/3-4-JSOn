//
//  ParkingResponseObjects.swift
//  3-4-JSOn
//
//  Created by Till Hemmerich on 19.11.24.
//

import Foundation


enum HTTPError : Error{
    case invalidURL,fetchFailed
    
    var message: String {
        switch self{
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Das Laden ist fehlgeschagen"
        }
    }
}


struct ParkingInfo: Codable, Hashable{
    var parkPlaetze : [ParkPlatz]
    
    enum CodingKeys: String, CodingKey {
        case parkPlaetze = "parking_lorry"
    }
}

struct ParkPlatz: Codable, Hashable{
    var title: String
    var subtitle: String
    var isBlocked: String
    var description: [String]
    var lorryParkingFeatureIcons : [ParkingFeature]
}

struct ParkingFeature: Codable, Hashable{
    var description : String
}
//[
//        {
//            "identifier": "DE-BY-000131",
//            "icon": "314-50",
//            "isBlocked": "false",
//            "future": false,
//            "extent": "13.416122,48.415228999,13.416122,48.415228999",
//            "point": "13.416122,48.415228999",
//            "startLcPosition": "1",
//            "display_type": "PARKING",
//            "subtitle": "Vorstauraum Suben",
//            "title": "A3 | Linz",
//            "coordinate": {
//                "long": "13.416122",
//                "lat": "48.415228999"
//            },
//            "description": [
//                "PKW Stellplätze: 0",
//                "LKW Stellplätze: 65"
//            ],
//            "routeRecommendation": [],
//            "footer": [
//                "Betreut durch Autobahndirektion Südbayern",
//                "",
//                "Koordinaten: 13.416122,48.415228999"
//            ],
//            "lorryParkingFeatureIcons": [
//                {
//                    "description": "Mülleimer",
//                    "style": "",
//                    "icon": "fa fa-trash"
//                },
//                {
//                    "description": "Toilette vorhanden",
//                    "style": "",
//                    "icon": "almofont almo-restroom"
//                }
//            ]
//        },
//    ]


