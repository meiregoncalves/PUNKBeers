//
//  cervejasTableViewController.swift
//  49020
//
//  Created by macos on 03/12/17.
//  Copyright © 2017 meire. All rights reserved.
//

import UIKit
import Kingfisher


class CervejasTableViewController: UITableViewController {
    
    var cervejas: [Cerveja] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func getCervejas() {
        REST.getCervejas { (cervejas: [Cerveja]?) in
            if let cervejas = cervejas {
                self.cervejas = cervejas
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCervejas()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cervejas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CervejaTableViewCell
        
        let cerveja = cervejas[indexPath.row]
        
        cell.lblNome.text = cerveja.nome
        
        if let teor_alcoolico = cerveja.teor_alcoolico {
            cell.lblTeor.text = "Teor Alcoólico: \(teor_alcoolico)"
        }
        
        //let url = URL(string: cerveja.urlImagem)
        //cell.ivFoto.image = try! UIImage(data: Data(contentsOf: url!))
        let url = ImageResource(downloadURL: URL(string:cerveja.urlImagem)!, cacheKey: cerveja.nome)
        cell.ivFoto.kf.setImage(with: url)
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let vc = segue.destination as! ViewController
            vc.cerveja = cervejas[tableView.indexPathForSelectedRow!.row]
        }
    }
    
}

