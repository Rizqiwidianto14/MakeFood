//
//  ViewController.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import UIKit

class SearchFoodVC: UIViewController {
    @IBOutlet weak var searchFoodTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension SearchFoodVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchFoodCell", for: indexPath) as! SearchFoodCell

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(120)
        return height
    }
    
    
}


