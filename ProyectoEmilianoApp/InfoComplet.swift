//
//  InfoComplet.swift
//  ProyectoEmilianoApp
//
//  Created by Tonny Gammer on 15/11/19.
//  Copyright © 2019 Tonny Gammer. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class InfoComplet: UIViewController {

    
   @IBOutlet weak var imgPortada: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblDesarrollador: UILabel!
    @IBOutlet weak var lblEmpresa: UILabel!
    @IBOutlet weak var lblConsola: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
    @IBOutlet weak var lblFechaEstreno: UILabel!
    
    var MData : VideoGameList?
    func cargar(){
        lblNombre.text = MData?.nombre
        lblDesarrollador.text = MData?.desarrollador
        lblEmpresa.text = MData?.empresa
        lblConsola.text = MData?.consola
        lblCategoria.text = MData?.categoria
        lblFechaEstreno.text = MData?.fecha
        
        AF.request("http://videogamelist.azurewebsites.net/\(MData?.urlFlyer)").responseImage {
            response in
            switch(response.result) {
                
            case.success(let Data) :
                self.imgPortada.image = Data
            case.failure(_) :
                print("Algo salio mal")
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNombre.text = MData?.nombre
        lblDesarrollador.text = MData?.desarrollador
        lblEmpresa.text = MData?.empresa
        lblConsola.text = MData?.consola
        lblCategoria.text = MData?.categoria
        lblFechaEstreno.text = MData?.fecha
        
        AF.request("http://videogamelist.azurewebsites.net\(MData!.urlFlyer)").responseImage {
            response in
            switch(response.result) {
                
            case.success(let Data) :
                self.imgPortada.image = Data
            case.failure(_) :
                print("Algo salio mal")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
