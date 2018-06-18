//
//  CategoryViewController.swift
//  Todokg
//
//  Created by yiğit on 17.06.2018.
//  Copyright © 2018 Ghost35. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
        
        
    }
    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let categoryItem = categoryArray[indexPath.row]
        
        cell.textLabel?.text = categoryItem.name
        
        return cell
        
    }
    
    
    
    //MARK: - Tableview Manipulation Methods

    func saveItems() {
        
        do {
            try context.save()
            
        } catch {
            print("Error saving context , \(error)")
            
        }
        tableView.reloadData()
        
    }
    
    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {


        do {
            categoryArray = try context.fetch(request)
        }
        catch {
            print("Error reading context , \(error)")
        }

        tableView.reloadData()


    }

    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            // What will happen add button pressed 

            let newCategory = Category(context: self.context)

            newCategory.name = textField.text!

            self.categoryArray.append(newCategory)

            self.saveItems()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Category"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    //MARK: - Data Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexpath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexpath.row]
        }
    }
    
    
    
}
