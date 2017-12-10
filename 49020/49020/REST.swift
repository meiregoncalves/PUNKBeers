//
//  REST.swift
//  49020
//
//  Created by macos on 03/12/17.
//  Copyright © 2017 meire. All rights reserved.
//

import Foundation
import UIKit

class REST {
    static let basePath = "https://api.punkapi.com/v2/beers"
    static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.timeoutIntervalForRequest = 45.0
        config.httpMaximumConnectionsPerHost = 5
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        
        return config
    }()
    
    static let session = URLSession(configuration: configuration)
    
    
    static func getCervejas(onComplete: @escaping ([Cerveja]?) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return}
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Erro!")
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        var cervejas: [Cerveja] = []
                        
                        for item in json {
                            let id = item["id"] as! Int
                            let nome = item["name"] as! String
                            let tagline = item["tagline"] as! String
                            let descricao = item["description"] as! String
                            let urlImagem = item["image_url"] as! String

                            let cerveja = Cerveja(id: id, nome: nome, tagline: tagline, teor_alcoolico: nil, escala_amargor: nil, descricao: descricao, urlImagem : urlImagem)
                            
                            if let teor_alcoolico = item["abv"] as? Double? {
                                cerveja.teor_alcoolico = teor_alcoolico
                            }
                            
                            if let escala_amargor = item["ibu"] as? Double? {
                                cerveja.escala_amargor = escala_amargor
                            }
                            cervejas.append(cerveja)
                        }
                        onComplete(cervejas)
                        
                    } catch {
                        print (error.localizedDescription)
                        onComplete(nil)
                    }
                } else {
                    print("Erro no servidor: ", response.statusCode)
                    onComplete(nil)
                }
            }
            }.resume()
    }
}










