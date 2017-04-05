//
//  Marcador.swift
//  MapEnIOs
//
//  Created by alumno on 4/4/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit
import MapKit

class Marcador: NSObject, MKAnnotation {
    
    var nombre:String?
    var descriptionSelf: String?
    //var nombre:String?
    var coordinate:CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.nombre = title
        self.descriptionSelf = subtitle
        self.coordinate = coordinate
        
        super.init()
    }
    
    var title:String? {
        return nombre
    }
    
    var subtitle:String? {
        return descriptionSelf
    }
    
}
