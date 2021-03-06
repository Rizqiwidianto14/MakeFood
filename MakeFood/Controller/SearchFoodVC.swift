//
//  ViewController.swift
//  MakeFood
//
//  Created by Rizqi Imam on 28/05/21.
//

import UIKit
import SDWebImage

class SearchFoodVC: BaseVC{
    @IBOutlet weak var searchFoodTable: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var blankStateLabel: UILabel!
    @IBOutlet weak var blankStateImage: UIImageView!
    
    let imageView = UIImageView(image: UIImage(named: "FotoRizqi"))
    var profileImage = UIImage(named: "FotoRizqi")
    
    var repo = Repository()
    var foodDataSource = [Meals]()
    var userName = "Rizqi Imam Gilang Widianto"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.tintColor = UIColor(named: "FirstColor")
        if foodDataSource.count == 0{
            searchFoodTable.isHidden = true
            blankStateLabel.textColor = UIColor(named: "FirstColor")
            blankStateImage.tintColor = UIColor(named: "FirstColor")
        }
    }
    
    
    
    
    private func setupUI() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = ProfileImagePosition.imageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -ProfileImagePosition.imageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -ProfileImagePosition.imageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: ProfileImagePosition.imageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let vc = self.storyboard?.instantiateViewController(identifier: "ProfileVC") as! ProfileVC
            vc.delegate = self
            vc.profileAvatar = profileImage!
            vc.userName = userName
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isTranslucent = true
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = UIColor(named: "FirstColor")
            setupUI()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.navigationBar.backgroundColor = UIColor(named: "FirstColor")
            setupUI()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func actSearch(_ sender: Any) {
        let name = searchField.text
        self.showLoading(msg: "Loading...")
        repo.getFoodList(name: name!) { (result) in
            if result.count > 0{
                DispatchQueue.main.async {
                    self.searchFoodTable.isHidden = false
                    self.loadView.hide()
                    self.loadingView.removeFromSuperview()
                    self.foodDataSource = result
                    self.searchFoodTable.reloadData()
                    
                }
            }
        } onFailed: { (error) in
            DispatchQueue.main.async {
                self.loadView.hide()
                self.searchFoodTable.isHidden = true
                self.blankStateLabel.text = "We don't have your favorite food recipe:("
                self.blankStateLabel.textColor = UIColor(named: "FirstColor")
                self.blankStateImage.tintColor = UIColor(named: "FirstColor")
                self.loadingView.removeFromSuperview()
            }
        }
    }
}

extension SearchFoodVC: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchField.placeholder = ""
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
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        vc.id = foodDataSource[indexPath.row].id ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension SearchFoodVC: ProfileDataDelegate{
    func profileData(userName: String, userImage: UIImage) {
        profileImage = userImage
        imageView.image = userImage
        self.userName = userName
    }
    
    
}

