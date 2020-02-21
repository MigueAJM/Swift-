//
//  Cliente.swift
//  TableView
//
//  Created by MIGUEL ANGEL JIMENEZ MELENDEZ on 21/02/20.
//  Copyright © 2020 MIGUEL ANGEL JIMENEZ MELENDEZ. All rights reserved.
//

import Foundation
class Cliente{
    var cvt : String = ""
    var Nombre : String = ""
    var Domicilio : String  = ""
    init(cvt : String, nom : String, dom : String){
        self.cvt = cvt
        self.Nombre = nom
        self.Domicilio = dom
    }
}
