//
//  Demo2ViewController.swift
//  Mis Recetas
//
//  Created by Oscar G. Solares on 7/3/17.
//  Copyright © 2017 Solde. All rights reserved.
//
// Este es otro ejemplo de tablas sin ser un UIVIEWTABLECONTROLLER
// Sino que se añade un table viw independiente


import UIKit

class Demo2ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes : [Recipes] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /* En caso de no quererlo hacer graficamente, es decir seleccionar la tabla
         presionar Ctrl y dirigirla al view Controller.
         
        self.tableView.dataSource = self
        self.tableView.delegate = self */
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    
    }
   
}

extension Demo2ViewController: UITableViewDataSource {
    
    // la instruccion override aqui no es requerida
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "fullRecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! fullRecipeCell
        
        cell.fullImageView.image = recipe.image
        cell.lblFullLabel.text = recipe.name
                
        return cell
    }
}
