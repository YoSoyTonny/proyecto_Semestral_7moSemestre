//
//  GameCellController.swift
//  ProyectoEmilianoApp
//
//  Created by Tonny Gammer on 15/11/19.
//  Copyright © 2019 Tonny Gammer. All rights reserved.
//

import UIKit

class GameCellController: UITableViewCell {

    @IBOutlet weak var imgGame: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblFecha: UILabel!
    @IBOutlet weak var lblEmpresa: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    func set(Modelo:VideoGameList){
        lblNombre.text = Modelo.nombre
        lblFecha.text = Modelo.fecha
        lblEmpresa.text = Modelo.empresa
        
    }
}
