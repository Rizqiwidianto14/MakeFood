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
    var repo = Repository()
    var foodDataSource = [Meals]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        cell.foodImage.sd_setImage(with: URL(string: foodDataSource[indexPath.row].mealImage ?? ""), placeholderImage: UIImage(named: "arabiata"))
//        cell.employeeImageView.sd_setImage(with: URL(string: successorResult[indexPath.row].empl_photo ?? ""), placeholderImage: UIImage(named: "placeholder-image"))

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(120)
        return height
    }
    
    
}


