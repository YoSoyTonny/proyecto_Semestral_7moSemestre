//
//  Modelo.swift
//  ProyectoEmilianoApp
//
//  Created by Tonny Gammer on 15/11/19.
//  Copyright © 2019 Tonny Gammer. All rights reserved.
//

import Foundation
import UIKit


class VideoGameList {
    
    var nombre : String
    var desarrollador: String
    var empresa : String
    var fecha : String
    var consola : String
    var categoria : String
    var urlFlyer : String
    
    init (nombre : String, desarrollador: String, empresa : String, fecha: String, consola: String, categoria: String, urlFlyer : String)
    {
        self.nombre = nombre
        self.desarrollador = desarrollador
        self.empresa = empresa
        self.fecha = fecha
        self.categoria = categoria
        self.consola = consola
        self.urlFlyer = urlFlyer
    }
    
}
