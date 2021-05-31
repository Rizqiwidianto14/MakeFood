//
//  ViewController.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import UIKit
import SDWebImage

class SearchFoodVC: BaseVC {
    @IBOutlet weak var searchFoodTable: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchField: UITextField!

    var repo = Repository()
    var foodDataSource = [Meals]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.tintColor = UIColor(named: "FirstColor")
        
        

      
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
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
        
        
    }
    

    
    @IBAction func actSearch(_ sender: Any) {
        var name = searchField.text
        print(name)
        self.showLoading(msg: "Loading")
        repo.getFoodList(name: name!) { (result) in
                if result.count > 0{
                    DispatchQueue.main.async {
                        
                        self.loadView.hide()
                        self.loadingView.removeFromSuperview()
                        self.foodDataSource = result
                        self.searchFoodTable.reloadData()
            
                    }
                }
        } onFailed: { (error) in
            DispatchQueue.main.async {
                self.loadView.hide()
                self.loadingView.removeFromSuperview()
            }
        }

        
    }
    

}

extension SearchFoodVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchField.text = ""
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

       let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        vc.id = foodDataSource[indexPath.row].id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
  
    
    
}


