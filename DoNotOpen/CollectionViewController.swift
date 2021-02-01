//
//  ConfidentalViewController.swift
//  DoNotOpen
//
//  Created by Tommy Smale on 11/22/20.
//

import UIKit

class ConfidentalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var collectionView : UICollectionView!
    var selectedImage = UIImage()
    let x = 5 
    var contentCount = 0;
    let picker = UIImagePickerController()
    //var data: [Int] = Array(0..<10)
    
    override func loadView() {
        super.loadView()

        let margins = self.view.safeAreaLayoutGuide
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: margins.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
        ])
        
        self.collectionView = collectionView
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        //self.navigationController?.hidesBarsOnTap = true
        self.navigationController?.hidesBarsOnSwipe = false

        //self.navigationController?.barHideOnSwipeGestureRecognizer.addTarget(self, action: #selector(swipeGesture))
        self.navigationItem.hidesBackButton = true
        let addButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(self.addContent))
        let cameraButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(useCamera))
        self.navigationItem.setRightBarButtonItems([addButton, cameraButton], animated: true)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(ConfidentalCollectionViewCell.self, forCellWithReuseIdentifier: ConfidentalCollectionViewCell.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
        /*
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewContent(_:))) //_ bc parameter is unamed
        self.collectionView.addGestureRecognizer(tap)
        */
        
        self.picker.delegate = self

    }
    
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.data.count
        return contentCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfidentalCollectionViewCell.identifier, for: indexPath)  as? ConfidentalCollectionViewCell else {
            fatalError("CollectionViewCell not recognized by CollectionView")
        }
        
        /*
        let data = self.data[indexPath.item]
        cell.textLabel.text = String(data)
         */
        //cell.imageView.layer.borderWidth = 1
        //cell.imageView.layer.borderColor = UIColor.white.cgColor
        //cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = selectedImage
        return cell
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConfidentalCollectionViewCell.identifier, for: indexPath)  as? ConfidentalCollectionViewCell else {
            fatalError("CollectionViewCell not recognized by CollectionView")
        }
        */
        //self.selectedImage = cell.imageView.image
        self.navigationController?.pushViewController(PresentViewController(), animated: false)
    }
    
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /*
         // We subtract 16 because there are 2 inter item spaces like:
         // [CELL] [spacing:8] [CELL] [spacing:8] [CELL]
         let usableWidth = collectionView.frame.width - (2 * 8)

         let cellWidth: CGFloat = usableWidth / 3
         let cellHeight: CGFloat = cellWidth

         return CGSize(width: cellWidth, height: cellHeight)
         */
        return CGSize(width: (collectionView.bounds.width/3-1), height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    @objc func addContent() {
        print("add content")

        picker.sourceType = .photoLibrary

        present(picker, animated: true, completion: nil)
        //self.collectionView.insertItems(at: [IndexPath(item: 101, section: 0)])
        
        //self.collectionView.reloadData()
    }
    
    @objc func useCamera() {
        print("use camera")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            if let availableMediaTypes = UIImagePickerController.availableMediaTypes(for: .camera) {
                picker.mediaTypes = availableMediaTypes
            }
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }else {
            let alert = UIAlertController(title: "Camera not detected", message: "Camera functionality is disabled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            self.navigationItem.rightBarButtonItems?[1].isEnabled = false
        }
    }
 
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let confidentalCollectionViewCell = ConfidentalCollectionViewCell()
            confidentalCollectionViewCell.imageView.image = selectedImage
            //self.collectionView.reloadItems(at: [IndexPath(item: contentCount, section: 0)])
            self.selectedImage = selectedImage
            contentCount += 1
            self.collectionView.insertItems(at: [IndexPath(item: 0, section: 0)])

        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
