//
//  ViewController.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import UIKit
import SDWebImage

class SearchFoodVC: UIViewController {
    @IBOutlet weak var searchFoodTable: UITableView!
    @IBOutlet weak var searchFoodBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    var repo = Repository()
    var foodDataSource = [Meals]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.tintColor = UIColor(named: "FirstColor")
        
        self.navigationController!.navigationBar.isTranslucent = true
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor(named: "FirstColor")
    
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "FirstColor")
        }
        
        
        repo.getFoodList(name: "Pizza") { (result) in
            self.foodDataSource = result
            self.searchFoodTable.reloadData()
            
        }
        
    }
    
    
}

extension SearchFoodVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchFoodCell", for: indexPath) as! SearchFoodCell
        cell.foodTitle.text = foodDataSource[indexPath.row].mealName
        cell.foodOrigin.text = foodDataSource[indexPath.row].mealOrigin
        cell.foodImage.sd_setImage(with: URL(string: foodDataSource[indexPath.row].mealImage ?? ""), placeholderImage: UIImage(named: "arabiata"))
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(120)
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    
}


