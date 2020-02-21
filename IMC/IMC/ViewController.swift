//
//  ViewController.swift
//  IMC
//
//  Created by MIGUEL ANGEL JIMENEZ MELENDEZ on 20/02/20.
//  Copyright © 2020 MIGUEL ANGEL JIMENEZ MELENDEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtpeso: UITextField!
    @IBOutlet weak var txtaltura: UITextField!
    @IBOutlet weak var lbresultado: UILabel!
    var alt : Double = 0.0
    var pso : Double = 0.0
    var imc : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        if txtpeso.text!.isEmpty || txtaltura.text!.isEmpty{
            alerta(title: "No deje campos vacios", message: "Complete lo que se pide")
            txtpeso.becomeFirstResponder()
        } else{
            pso = Double(txtpeso.text!)!
            alt = Double(txtaltura.text!)!
            imc = pso / (alt * alt)
            //lbresultado.text = String(imc)
            if imc < 25 {
                self.performSegue(withIdentifier: "sgAmarillo", sender: self)
            }else if imc >= 25 && imc < 30 {
                self.performSegue(withIdentifier: "sgVerde", sender: self)
            }else if imc > 30 {
                self.performSegue(withIdentifier: "sgRojo", sender: self)
            }
        }
    }
    
    func alerta(title: String, message: String){
        let alertGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertaMsn = UIAlertAction(title: "No deje campos vacios", style: .default){
            (action) in self.lbresultado.text = "Por favor complete los campos que se piden"
        }
        let alertOK = UIAlertAction(title: "Aceptar", style: .default, handler:{
            (action) in self.lbresultado.text = ""
        })
        alertGuia.addAction(alertaMsn)
        alertGuia.addAction(alertOK)
        present(alertGuia, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgAmarillo" {
            let sgam = segue.destination as! ViewControllerAm
            sgam.imc = imc
        }
        if segue.identifier == "sgVerde" {
            let sgvd = segue.destination as! ViewControllerVd
            sgvd.imc = imc
        }
        if segue.identifier == "sgRojo" {
            let sgrj = segue.destination as! ViewControllerRj
            sgrj.imc = imc
        }
    }
}

