//
//  ViewController.swift
//  RandomUserGenerator
//
//  Created by Devron Tombacco on 05/08/2020.
//  Copyright © 2020 dtomswift. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {

    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telephoneNoLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        configureImage()
    }
    
    func configureImage(){
        // add cornerRadius to uiimageview here
    }
    
    @IBAction func generateButtonPressed(_ sender: UIButton) {
        makeRequest()
    }
    
    func makeRequest() {
        // Code for API call
    }
}

