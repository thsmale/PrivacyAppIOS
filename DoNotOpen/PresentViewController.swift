//
//  PresentViewController.swift
//  DoNotOpen
//
//  Created by Tommy Smale on 11/23/20.
//

import UIKit

class PresentViewController: UIViewController {
    
    weak var presentImageView : UIImageView!
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        //let defaultImage = UIImage(named: "daniellaSelfie")
        let presentImageView = UIImageView()
        presentImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(presentImageView)
        
        NSLayoutConstraint.activate([
            presentImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            presentImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            presentImageView.topAnchor.constraint(equalTo: margins.topAnchor),
            presentImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
        
        self.presentImageView = presentImageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        let confidentalViewController = ConfidentalViewController()
        
        presentImageView.image = confidentalViewController.selectedImage
        //print(presentImageView.image?.size)
        
        presentImageView.contentMode = .scaleAspectFit
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
