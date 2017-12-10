//
//  ViewController.swift
//  49020
//
//  Created by macos on 03/12/17.
//  Copyright © 2017 meire. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var cerveja : Cerveja!
    
    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblTagline: UITextView!
    @IBOutlet weak var tvDescricao: UITextView!
    @IBOutlet weak var lblTeorAlcoolico: UILabel!
    @IBOutlet weak var lblEscalaAmargor: UILabel!
    @IBOutlet weak var ivFoto: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Beer!!!"
        
        if cerveja != nil {
            lblNome.text = cerveja.nome
            lblTagline.text = cerveja.tagline
            tvDescricao.text = cerveja.descricao
            
            if let teor_alcoolico = cerveja.teor_alcoolico {
               lblTeorAlcoolico.text = "\(teor_alcoolico)"
            }
            else {
                lblTeorAlcoolico.text = ""
            }
            
            if let escala_amargor = cerveja.escala_amargor {
                lblEscalaAmargor.text = "\(escala_amargor)"
            }
            else {
                lblEscalaAmargor.text = ""
            }
            
            let url = URL(string: cerveja.urlImagem)
            ivFoto.kf.setImage(with: ImageResource(downloadURL: url!, cacheKey: cerveja.nome))
//            ivFoto.image = try! UIImage(data: Data(contentsOf: url!))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

