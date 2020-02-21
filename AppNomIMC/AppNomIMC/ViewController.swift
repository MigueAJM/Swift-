//
//  ViewController.swift
//  AppNomIMC
//
//  Created by Tecnologico Roque on 2/18/20.
//  Copyright © 2020 Tecnologico Roque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var peso : Double = 0.0
    var altura : Double = 0.0
    var imc : Double = 0.0
    var persona = [Persona]()
    
    @IBOutlet weak var mensajelabel: UILabel!
    @IBAction func btnConsulta(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "Lista", sender: self)
    }
    @IBAction func btnAgrega(_ sender: UIButton) {
        if lbnom.text!.isEmpty || lbpeso.text!.isEmpty || lbaltura.text!.isEmpty{
            mostrarAlerta(title: "Faltan datos", message: "Ingresa los Datos Faltantes")
            lbnom.becomeFirstResponder()
        }else{
            altura = Double(lbaltura.text!)!
            peso = Double(lbpeso.text!)!
            imc = peso / (altura * altura)
            
            persona.append(Persona(nomb: lbnom.text!, pes: peso , alt: altura , imc: imc))
            lbnom.text = ""
            lbaltura.text = ""
            lbpeso.text = ""
            mostrarAlerta(title: "Datos Agregados", message: "Se aggregaron con exito")        }
    }
    @IBOutlet weak var lbaltura: UITextField!
    @IBOutlet weak var lbpeso: UITextField!
    @IBOutlet weak var lbnom: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mensajelabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Lista"{
            let Lista = segue.destination as! TableViewController
            Lista.persona = persona
        }
    }
    
    func mostrarAlerta(title: String, message: String) {
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelar = UIAlertAction(title: "Aceptar", style: .default, handler: {(action) in self.mensajelabel.text = "" })
        alertaGuia.addAction(cancelar)
        present(alertaGuia, animated: true, completion: nil)
    }

}

