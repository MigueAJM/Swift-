//
//  ViewControllerVd.swift
//  IMC
//
//  Created by MIGUEL ANGEL JIMENEZ MELENDEZ on 20/02/20.
//  Copyright © 2020 MIGUEL ANGEL JIMENEZ MELENDEZ. All rights reserved.
//

import UIKit

class ViewControllerVd: UIViewController {
    @IBOutlet weak var lbimc: UILabel!
    var imc : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        lbimc.text = String(imc)
        // Do any additional setup after loading the view.
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
