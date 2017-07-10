//
//  ViewController.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 6/30/17.
//  Copyright © 2017 Solde. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipes] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Volver", style: .plain, target: nil, action: nil)
        
        
        var recipe = Recipes(name: "Torta de Patatas",
                             image: #imageLiteral(resourceName: "TortillaPatatas"),
                             time: 20,
                             ingredients: ["Patatas", "Huevos", "Cebollas"],
                             steps: ["Pelar patatas y cebolla", "Cortar patatas", "Cocinar por 2 minutos"])
        recipes.append(recipe)
        
        recipe = Recipes(name: "Pizza Margarita",
                         image: #imageLiteral(resourceName: "Pizza"),
                         time: 60,
                         ingredients: ["Aceite", "Sal", "Tomate", "Levadura", "Arina"],
                         steps: ["Hacer la masa", "Dejarla reposar 30 min", "extender la masa y añadir ingredientes", "Hornear 30 minutos"])
        recipes.append(recipe)
        
        recipe = Recipes(name: "Hamburguesa con queso",
                         image: #imageLiteral(resourceName: "Hamburguesa"),
                         time: 10,
                         ingredients: ["Pan", "Lechuga", "Cebollas", "Carne"],
                         steps: ["Poner al fuego la carne", "Montar la hamburguesa entre los panes", "Buen provecho"])
        recipes.append(recipe)
        
        recipe = Recipes(name: "Ensalada Cesar",
                         image: #imageLiteral(resourceName: "EnsaladaC"),
                         time: 15,
                         ingredients: ["Lechiga Romana", "Polllo", "Cebollas", "Tomate", "Gravy"],
                         steps: ["Cocer el pollo", "Cortar lechuga y tomate y cebolla", "Revolver Ingredientes"])
        recipes.append(recipe)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Si quisieramos el titulo se desapareciara al hacer swipe hacia arriba
        navigationController?.hidesBarsOnSwipe = true
        // Ojo que en el detailController se desaparecen los botones de retorno
        //Ver comandos ejecutados en detailViewcontroller
        
    }
    
    
    // MARK: UITableViewDataSource

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        /* Este codigo se utiliza cuando no tenemos una celda con configuracion personalizada, en el comando de arriba se añade la opcion as! Recipe cell por celda personalizada.
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image */
        
        cell.thumbnailImageView.image = recipe.image
        cell.lblName.text = recipe.name
        cell.lblTime.text = "\(recipe.time!) min"
        cell.lblIngredients.text = "Ingredientes: \(recipe.ingredients.count)"
        
        cell.thumbnailImageView.layer.cornerRadius = 42.0
        cell.thumbnailImageView.clipsToBounds = true
        
        
        if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let shareDdefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS 10"
            
            let activityController = UIActivityViewController(activityItems: [shareDdefaultText, self.recipes[indexPath.row].image], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        
        // Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor(colorLiteralRed: 30.0/255.0, green: 154.0/255.0, blue: 263.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(colorLiteralRed: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    
    // UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      /* Alerta que muestra si el platillo es favorito o no
        
        let recipe = self.recipes[indexPath.row]

        let alertController = UIAlertController(title: recipe.name, message: "Califica este platillo", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favAccTitle = "Favorito"
        var favAcccStyle = UIAlertActionStyle.default
        if recipe.isFavourite {
            favAccTitle = "No Favorito"
            favAcccStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favAccTitle, style: favAcccStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
            
        }
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil) */
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
    
}

