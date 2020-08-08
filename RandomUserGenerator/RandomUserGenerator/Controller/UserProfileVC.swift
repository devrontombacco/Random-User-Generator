//
//  ViewController.swift
//  RandomUserGenerator
//
//  Created by Devron Tombacco on 05/08/2020.
//  Copyright © 2020 dtomswift. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {

    // Label Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var telephoneNoLabel: UILabel!
    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var cityCountyAddressLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    // Image Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    // Button Outlets
    @IBOutlet weak var generateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        configureImage()
    }
    
    func configureImage(){
        photoImageView.layer.cornerRadius = 15
        generateButton.layer.cornerRadius = 8
    }
    
    @IBAction func generateButtonPressed(_ sender: UIButton) {
        makeRequest()
    }


    func makeRequest() {
        
        let baseUrl = URL(string: "https://randomuser.me/api?results=1")
        
        guard let url = baseUrl else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        //ensure data is not nil
        guard let data = data , error == nil else {
            print("something went wrong")
            return
        }
                    
        // parse json and convert to object
        var result: RandomPerson?

        do {
                result = try JSONDecoder().decode(RandomPerson.self, from: data)
            } catch {
                print("Error: \(error)")
            }

            guard let InfoToDisplay = result else { return }
            
            // Take info from json and use it to update UI
            DispatchQueue.main.async {
                self.nameLabel.text = InfoToDisplay.results[0].name.first
                self.lastnameLabel.text = InfoToDisplay.results[0].name.last
                self.genderLabel.text = InfoToDisplay.results[0].gender
                self.dobLabel.text = InfoToDisplay.results[0].dob.date
                self.nationalityLabel.text = InfoToDisplay.results[0].nat
                self.emailLabel.text = InfoToDisplay.results[0].email
                self.telephoneNoLabel.text = InfoToDisplay.results[0].phone
                self.streetAddressLabel.text =
                "\(InfoToDisplay.results[0].location.street.number) \(InfoToDisplay.results[0].location.street.name)"
                self.cityCountyAddressLabel.text =
                "\(InfoToDisplay.results[0].location.city), \(InfoToDisplay.results[0].location.country)"
                self.usernameLabel.text = InfoToDisplay.results[0].login.username
            }
            
            let photo: String = InfoToDisplay.results[0].picture.large
            
            let url = URL(string: photo)

            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.photoImageView.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
}
