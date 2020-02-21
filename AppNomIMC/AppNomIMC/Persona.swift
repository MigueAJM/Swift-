//
//  Persona.swift
//  AppNomIMC
//
//  Created by Tecnologico Roque on 2/18/20.
//  Copyright © 2020 Tecnologico Roque. All rights reserved.
//

import Foundation
class Persona{
    var nombre :String = ""
    var peso : Double = 0.0
    var altura : Double = 0.0
    var imc : Double = 0.0
    
    init(nomb :String, pes : Double, alt :Double, imc : Double) {
        self.nombre = nomb
        self.peso = pes
        self.altura = alt
        self.imc = imc
    }
}
