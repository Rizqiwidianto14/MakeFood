//
//  DetailVC.swift
//  MakeFood
//
//  Created by Rizqi Imam on 31/05/21.
//

import UIKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
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
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
               self.navigationController!.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.isTranslucent = true
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "FirstColor")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
