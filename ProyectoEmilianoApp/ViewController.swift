//
//  ViewController.swift
//  ProyectoEmilianoApp
//
//  Created by Tonny Gammer on 15/11/19.
//  Copyright © 2019 Tonny Gammer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvGamelist.dequeueReusableCell(withIdentifier: "SeccionGame") as! GameCellController
        let list = filterData [indexPath.row]
        cell.set(Modelo: list)
        AF.request("http://videogamelist.azurewebsites.net/\(filterData[indexPath.row].urlFlyer)").responseImage {
            response in
            switch(response.result) {
                
            case.success(let Data) :
                cell.imgGame.image = Data
            case.failure(_) :
                print("Algo salio mal")
            }
        }
        
        return cell
    }
    
    
    let urlPokemon = "http://videogamelist.azurewebsites.net/videogamelist/?rest_route=/wp/v2/videogamelist/"
    
    var Data = [VideoGameList]()
    var filterData = [VideoGameList]()

    @IBOutlet weak var tvGamelist: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tvGamelist.delegate = self
        tvGamelist.dataSource = self
        
        recover()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToInfo" {
            
            let destino = segue.destination as? InfoComplet
            let indexPath = tvGamelist.indexPath(for: (sender as! UITableViewCell))
            
            let listDestino = filterData [indexPath!.row]
            destino?.MData = listDestino
            //destino?.cargar()
        }
    }

    func recover()  {
        AF.request(urlPokemon).responseJSON{
        response in
            
            switch response.result{
                
                
            case .success(let datos):
                
                if let Arrayrespuesta = datos as? NSArray{
                    if let Array = Arrayrespuesta.value(forKey: "acf") as? NSArray{
                        for element in Array{
                            if let diccionario = element as? NSDictionary {
                                
                                let nombre = diccionario.value(forKey: "nombre") as? String
                                let fecha = diccionario.value(forKey: "estreno") as? String
                                let empresa = diccionario.value(forKey: "empresa") as? String
                                let desarrollador = diccionario.value(forKey: "desarrollador") as? String
                                let consola = diccionario.value(forKey: "consola") as? String
                                let categoria = diccionario.value(forKey: "categoria") as? String
                                let urlFlyer = diccionario.value(forKey: "portadadeljuego") as? String
                                let nuevo = VideoGameList(nombre: nombre!, desarrollador: desarrollador!, empresa: empresa!, fecha: fecha!, consola: consola!, categoria: categoria!, urlFlyer: urlFlyer!)
                                
                                self.Data.append(nuevo)
                                
                            }
                        }
                    }
                }
                self.filterData = self.Data
                self.tvGamelist.reloadData()
                break
            case .failure(let datos):
                print(datos)
                break
            }
            
        }
        
         
    }

}

