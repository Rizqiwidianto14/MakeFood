//
//  BaseVC.swift
//  MakeFood
//
//  Created by Rizqi Imam on 31/05/21.
//

import UIKit

class BaseVC: UIViewController {
     let loadingView: UIView = UIView()
     var loadView: Loading!
    
    func showLoading(msg: String) {
        loadView = Loading(text: msg)
        loadingView.frame = view.frame
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        loadingView.addSubview(loadView)
        view.addSubview(loadingView)
        loadView.show()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
