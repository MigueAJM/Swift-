//
//  ViewController.swift
//  TableView
//
//  Created by MIGUEL ANGEL JIMENEZ MELENDEZ on 21/02/20.
//  Copyright © 2020 MIGUEL ANGEL JIMENEZ MELENDEZ. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    @IBOutlet weak var txtDomicilio: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtNombre: UITextField!
    var cliente = [Cliente]()
    var db : OpaquePointer? //SQLITE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SQLITE
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("DBSQLiteClientes.sqlite")
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            alerta(title: "Error", message: "No se enconntraron los datos")
            return
        }
        let creteTable = "Create Table If Not Exists Cliente(cveCliente Integer Primary Key, nomCliente Text, domCliente Text)"
        if sqlite3_exec(db, creteTable, nil, nil, nil) != SQLITE_OK {
            alerta(title: "Exito", message: "Se creo la tabla")
            return
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAgrega(_ sender: UIButton) {
        if txtClave.text!.isEmpty || txtNombre.text!.isEmpty || txtDomicilio.text!.isEmpty {
            alerta(title: "No en blanco", message: "Complete lo que se pide")
            txtClave.becomeFirstResponder()
        }else{
            let cve = txtClave.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let nom = txtNombre.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            var stmt : OpaquePointer?
            let sentencia = "Insert into Cliente(cveCliente, nomCliente, domCliente) Values()"
            if  sqlite3_prepare(db, sentencia, -1, &stmt, nil) != SQLITE_OK {
                
            }
               
           // cliente.append(Cliente(cvt: txtClave.text!, nom: txtNombre.text!,dom:
           // txtDomicilio.text!))
           // txtClave.text = ""
           // txtNombre.text = ""
           // txtDomicilio.text = ""
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

