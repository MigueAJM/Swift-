//
//  ViewController.swift
//  TableView
//
//  Created by MIGUEL ANGEL JIMENEZ MELENDEZ on 21/02/20.
//  Copyright © 2020 MIGUEL ANGEL JIMENEZ MELENDEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtDomicilio: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    var cliente = [Cliente]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAgrega(_ sender: UIButton) {
        if txtClave.text!.isEmpty || txtNombre.text!.isEmpty || txtDomicilio.text!.isEmpty {
            alerta(title: "No deje campos en blanco", message: "Complete lo que se pide")
            txtClave.becomeFirstResponder()
        }else{
            cliente.append(Cliente(cvt: txtClave.text!, nom: txtNombre.text!,dom: txtDomicilio.text!))
            txtClave.text = ""
            txtNombre.text = ""
            txtDomicilio.text = ""
            alerta(title: "Acción exitosa", message: "Se guardaron los datos")
        }
    }
    
    @IBAction func btnConsulta(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgLista", sender: self)
    }
    
    func alerta(title: String, message: String){
        let alertGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertaOK = UIAlertAction(title: "Aceptar", style: .default){
            (action) in self.self
        }
        let alertCancelar = UIAlertAction(title: "Cancelar", style: .default, handler:{
            (action) in self.self
        })
        alertGuia.addAction(alertaOK)
        alertGuia.addAction(alertCancelar)
        present(alertGuia, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgLista" {
            let Lista = segue.destination as! TableViewController
            
        }
    }
}

