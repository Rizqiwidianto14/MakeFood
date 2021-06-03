//
//  ProfileVC.swift
//  MakeFood
//
//  Created by Rizqi Imam on 02/06/21.
//

import UIKit
import Photos

protocol ProfileDataDelegate{
    func profileData(userName: String, userImage: UIImage)
}

class ProfileVC: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var userName = ""

    private var isButtonEditing = false
    var delegate: ProfileDataDelegate?
    var profileAvatar = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.tintColor = UIColor.white
        profileImageCircle()
        nameTextField.isHidden = true
        nameLabel.text = userName
        profileImage.image = profileAvatar
        profileImage.contentMode = .scaleToFill

        let profileImageTapped = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        profileImage.addGestureRecognizer(profileImageTapped)
        profileImage.isUserInteractionEnabled = true
        
        
    }
    
 
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.profileData(userName: userName, userImage: profileAvatar)
    }
    
    
    func profileImageCircle(){
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
    }
    @IBAction func editDidTapped(_ sender: UIButton) {
        
        if isButtonEditing == true{
            nameTextField.isHidden = true
            nameLabel.isHidden = false
            editButton.titleLabel?.text = "Edit User Name"
            nameLabel.text = nameTextField.text
            userName = nameTextField.text ?? ""
           
            
            isButtonEditing = false
      
            
        } else if isButtonEditing == false {
            nameTextField.isHidden = false
            nameLabel.isHidden = true
            editButton.titleLabel?.text = "OK"
            
        
            
            isButtonEditing = true
        
        }
        
        
        
    }
    



}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
           let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.mediaTypes = ["public.image"]
            self.present(imagePickerController, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImage.image = image
        profileAvatar = image
        profileImage.contentMode = .scaleToFill

        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.userName = nameTextField.text ?? ""
    }
    
    
}

