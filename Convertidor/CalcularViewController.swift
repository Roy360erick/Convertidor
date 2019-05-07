//
//  CalcularViewController.swift
//  Convertidor
//
//  Created by Erick Fernandez  on 7/05/19.
//  Copyright © 2019 Erick Fernandez . All rights reserved.
//

import UIKit

class CalcularViewController: UIViewController {

    @IBOutlet weak var medida: UITextField!
    @IBOutlet weak var unidadActual: UITextField!
    @IBOutlet weak var unidadAConvertir: UITextField!
    @IBOutlet weak var respuesta: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calcular(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var rpta : Double? = 0
        
        if unidadActual.text == "mi" && unidadAConvertir.text == "yd" {
            //Millas a Yardas
            rpta = Double(medida.text!)! * 1760
            respuesta.text = "\( rpta! ) yardas"
        }else if unidadActual.text == "mi" && unidadAConvertir.text == "km"{
            //Milas a Kilometros
            rpta = Double(medida.text!)! / 0.62137
            respuesta.text = "\(rpta! ) Kilometros"
        }else if unidadActual.text == "yd" && unidadAConvertir.text == "mi"{
            //Yardas a Millas
            rpta = Double(medida.text!)! * 0.00056818
            respuesta.text = "\( rpta! ) Millas"
        }else if unidadActual.text == "yd" && unidadAConvertir.text == "km"{
            //Yardas a Kilometros
            rpta = Double(medida.text!)! / 1093.6
            respuesta.text = "\( rpta! ) Kilometros"
        }else if unidadActual.text == "km" && unidadAConvertir.text == "yd"{
            //Kilometros a Yardas
            rpta = Double(medida.text!)! * 1093.61
            respuesta.text = "\( rpta! ) yardas"
        }else if unidadActual.text == "km" && unidadAConvertir.text == "mi"{
            //Kilometros a Millas
            rpta = Double(medida.text!)! * 0.62137
            respuesta.text = "\( rpta! ) Millas"
        }
        
        let conversion = Conversion(context: context)
        conversion.medida = Double(medida.text!)!
        conversion.unidadInicial = unidadActual.text!
        conversion.unidadFinal = unidadAConvertir.text!
        conversion.medidaFinal = rpta!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
}
