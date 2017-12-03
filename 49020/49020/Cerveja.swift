//
//  Cerveja.swift
//  49020
//
//  Created by macos on 03/12/17.
//  Copyright © 2017 meire. All rights reserved.
//


import Foundation


class Cerveja {
    var id : Int
    var nome: String
    var tagline: String
    var teor_alcoolico: Double?
    var escala_amargor: Double?
    var descricao: String
    
    init(id : Int, nome : String, tagline : String, teor_alcoolico : Double?, escala_amargor : Double?, descricao : String) {
        self.id = id
        self.nome = nome
        self.tagline = tagline
        
        if let teor_alcoolico = teor_alcoolico {
            self.teor_alcoolico = teor_alcoolico
        }
        
        if let escala_amargor = escala_amargor {
            self.escala_amargor = escala_amargor
        }
        
        self.descricao = descricao
    }
    
}
