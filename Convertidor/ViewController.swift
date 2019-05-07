//
//  ViewController.swift
//  Convertidor
//
//  Created by Erick Fernandez  on 7/05/19.
//  Copyright © 2019 Erick Fernandez . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var conversiones :[Conversion] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversiones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let conversion = conversiones[indexPath.row]
        cell.textLabel?.text = "\( conversion.medida ) \( conversion.unidadInicial! ) Convertido a  \( conversion.medidaFinal ) \( conversion.unidadFinal! )"
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            conversiones = try context.fetch(Conversion.fetchRequest())
            tableView.reloadData()
        }catch{}
    }


}

