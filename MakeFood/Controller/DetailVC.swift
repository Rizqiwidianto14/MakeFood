//
//  DetailVC.swift
//  MakeFood
//
//  Created by Rizqi Imam on 31/05/21.
//

import UIKit
import SDWebImage

class DetailVC: BaseVC {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodIngredients: UILabel!
    @IBOutlet weak var foodInstruction: UILabel!
    
    
    
    var id = ""
    var repo = Repository()
    var foodDataSource = [Meals]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading(msg: "Loading")
        
        repo.getFoodDetail(id: id) { (result) in
            if result.count > 0{
                DispatchQueue.main.async {
                    self.loadView.hide()
                    self.loadingView.removeFromSuperview()
                    self.foodDataSource = result
                    
                    let ingredients = "\(self.foodDataSource[0].ingredient1 ?? "")  (\(self.foodDataSource[0].measurement1 ?? "")), \(self.foodDataSource[0].ingredient2 ?? "")  (\(self.foodDataSource[0].measurement2 ?? "")), \(self.foodDataSource[0].ingredient3 ?? "")  (\(self.foodDataSource[0].measurement3 ?? "")), \(self.foodDataSource[0].ingredient4 ?? "")  (\(self.foodDataSource[0].measurement4 ?? "")), \(self.foodDataSource[0].ingredient5 ?? "")  (\(self.foodDataSource[0].measurement5 ?? "")), \(self.foodDataSource[0].ingredient6 ?? "")  (\(self.foodDataSource[0].measurement6 ?? "")), \(self.foodDataSource[0].ingredient7 ?? "")  (\(self.foodDataSource[0].measurement7 ?? "")), \(self.foodDataSource[0].ingredient8 ?? "")  (\(self.foodDataSource[0].measurement8 ?? "")), \(self.foodDataSource[0].ingredient9 ?? "")  (\(self.foodDataSource[0].measurement9 ?? "")), \(self.foodDataSource[0].ingredient10 ?? "")  (\(self.foodDataSource[0].measurement10 ?? "")), \(self.foodDataSource[0].ingredient11 ?? "")  (\(self.foodDataSource[0].measurement11 ?? "")), \(self.foodDataSource[0].ingredient12 ?? "") (\(self.foodDataSource[0].measurement12 ?? "")), \(self.foodDataSource[0].ingredient13 ?? "")  (\(self.foodDataSource[0].measurement13 ?? "")), \(self.foodDataSource[0].ingredient14 ?? "")  (\(self.foodDataSource[0].measurement14 ?? "")), \(self.foodDataSource[0].ingredient15 ?? "")  (\(self.foodDataSource[0].measurement15 ?? "")), \(self.foodDataSource[0].ingredient16 ?? "")  (\(self.foodDataSource[0].measurement16 ?? "")), \(self.foodDataSource[0].ingredient17 ?? "")  (\(self.foodDataSource[0].measurement17 ?? "")), \(self.foodDataSource[0].ingredient18 ?? "")  (\(self.foodDataSource[0].measurement18 ?? "")), \(self.foodDataSource[0].ingredient19 ?? "")  (\(self.foodDataSource[0].measurement19 ?? "")), \(self.foodDataSource[0].ingredient20 ?? "")  (\(self.foodDataSource[0].measurement20 ?? ""))"
                    
                    let parsedIngredients =  ingredients.replacingOccurrences(of: "( ),", with: "")
                    let parsedIngredients2 =  parsedIngredients.replacingOccurrences(of: "(),", with: "")
                    let parsedIngredients3 =  parsedIngredients2.replacingOccurrences(of: "( )", with: "")
                    let parsedIngredients4 =  parsedIngredients3.replacingOccurrences(of: "()", with: "")
                    
                    self.foodImage.sd_setImage(with: URL(string: self.foodDataSource[0].mealImage ?? ""), placeholderImage: UIImage(named: "arabiata"))
                    self.foodTitle.text = self.foodDataSource[0].mealName
                    self.foodInstruction.text = self.foodDataSource[0].instruction
                    self.foodIngredients.text = parsedIngredients4
        
                }
            }
        } onFailed: { (error) in
            DispatchQueue.main.async {
                self.loadView.hide()
                self.loadingView.removeFromSuperview()
            }
        }

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .clear
            navBarAppearance.backgroundImage = UIImage()
            navBarAppearance.shadowImage = UIImage()
            self.navigationController!.navigationBar.tintColor = UIColor.white

            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController!.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.isTranslucent = true
         
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            
        } else {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "FirstColor")
        }
    }
    
}
