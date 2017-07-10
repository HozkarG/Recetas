//
//  reviewViewController.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 7/6/17.
//  Copyright © 2017 Solde. All rights reserved.
//

import UIKit

class reviewViewController: UIViewController {

    @IBOutlet var backgroundViewController: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    
    @IBOutlet var btnNoGuta: UIButton!
    @IBOutlet var btnSiGuta: UIButton!
    @IBOutlet var btnGutaMucho: UIButton!
    
    var ratingSelected : String?
    
    
   /* @IBOutlet var btngustar: [UIButton]! {        Cuando se hace una coleccion de objetos (botones)
        didSet {
            btngustar.forEach {
                $0.alpha = 0
            }
        }
    } */

    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        btnNoGuta.alpha = 0.0
        btnSiGuta.alpha = 0.0
        btnGutaMucho.alpha = 0.0
        backgroundViewController.addSubview(blurEffectView)
        
        
        // Escalar y animar los botones de rating
        
        // ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
       /* btngustar.forEach {
            $0.alpha = 0
        }*/

        
        // Si queremos correr mas de dos transfomaciones a la vez
     //   let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
      //  let translation = CGAffineTransform(translationX: 0.0, y: 200.0)
        
        // ratingStackView.transform = scale.concatenating(translation)
        

        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
               /*  UIView.animate(withDuration: 0.5, delay: 0.1, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (true) in
            print ("listo")
        }
         
         // Este se corrio con la coleccion de botones
        for i in btngustar {
            UIView.animate(withDuration: 2.0, delay: 0.1, options: [], animations: {
               i.alpha = 1
            })
        } */
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: {
            self.btnNoGuta.alpha = 1.0
        }) { (true) in
            self.DelbtnSiguta()
        }

    }
    
    func DelbtnSiguta() {
        
        UIView.animate(withDuration: 0.3, delay: 0.1, options: [], animations: {
            self.btnSiGuta.alpha = 1.0
        }) { (true) in
            self.DelbtnGutaMucho()
        }
    }
    
    func DelbtnGutaMucho () {
        UIView.animate(withDuration: 0.3) {
            self.btnGutaMucho.alpha = 1.0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
