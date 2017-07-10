//
//  DetailViewController.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 7/4/17.
//  Copyright © 2017 Solde. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var recipeImageView: UIImageView!
    
    @IBOutlet weak var lblDetName: UILabel!
    @IBOutlet weak var lblDetTime: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var btnRating: UIButton!
    
    
    var recipe : Recipes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recipe.name

        self.recipeImageView.image = self.recipe.image
        self.lblDetName.text = self.recipe.name
        //self.lblDetTime.text = "Duracion: \(self.recipe.time!) min."
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.btnRating.setImage(UIImage(named: self.recipe.rating), for: .normal)
        
    }
    
    // Esta funcion para reactivar las flechas de retorno
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        var prefersStatusBarHidden : Bool {
            return true
        }
        
        
        
    }
    
   
   
    
    public func numberOfSections(in tableView: UITableView) -> Int {
       // para devolver una seccion solamente return 1
        
        return 3
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        switch section {
        case 0:
            return 3
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }

    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
        cell.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.KeyLabel.text = "Nombre:"
                cell.ValueLabel.text = self.recipe.name
            case 1:
                cell.KeyLabel.text = "Tiempo:"
                cell.ValueLabel.text = "\(self.recipe.time!) min."
            case 2:
                cell.KeyLabel.text = "Favorita:"
                if recipe.isFavourite {
                    cell.ValueLabel.text = "Si"
                } else {
                    cell.ValueLabel.text = "No"
                }
            default:
                break
            }
        case 1:
          /*  if indexPath.row == 0 {
                cell.KeyLabel.text = "Ingredientes:"
            } else {  */
                cell.KeyLabel.text = ""
            // }
        
            cell.ValueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
           /*  if indexPath.row == 0 {
                cell.KeyLabel.text = "Pasos:"
            } else { */
                cell.KeyLabel.text = ""
            //}
            
            cell.ValueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        
        return cell
        
    }
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        
        switch section {
        case 1:
            title = "Ingredientes"
        case 2:
            title = "Pasos"
        default:
            break
        }
        
        return title
    }
    
    

    @IBAction func close(segue: UIStoryboardSegue) {
    
        
        if let reviewVC = segue.source as? reviewViewController {
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                self.btnRating.setImage(UIImage(named: self.recipe.rating), for: .normal)
            }
        }
    }

}
