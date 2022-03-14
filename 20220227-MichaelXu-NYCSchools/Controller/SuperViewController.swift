//
//  SuperViewController.swift
//  20220227-MichaelXu-NYCSchools
//
//  Created by Michael Xu on 2022/2/28.
//

import UIKit
import JGProgressHUD

class SuperViewController: UIViewController {

    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showHUD() {
        hud.show(in: self.view)
    }
    
    func hideHUD() {
        hud.dismiss()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: {_ in
            
        }))
        self.present(alert, animated: true, completion: nil)
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
