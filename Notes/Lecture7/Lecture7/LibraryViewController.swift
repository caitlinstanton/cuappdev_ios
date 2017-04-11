//
//  LibraryViewController.swift
//  Lecture7
//
//  Created by Caitlin Stanton on 4/10/17.
//  Copyright © 2017 Caitlin Stanton. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var photos = [UIImage]()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photos"
        
        view.backgroundColor = .white
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        let cameraBarButton = UIBarButtonItem(title: "Camera", style: .plain, target: self, action: #selector(cameraButtonPressed))
        navigationItem.rightBarButtonItem = cameraBarButton
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    func cameraButtonPressed() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
        } else {
            imagePickerController.sourceType = .photoLibrary
        }
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func pullToRefresh() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer: Timer) in
            collectionView.reloadData()
            collectionView.refreshControl?.endRefreshing()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Reuse", for: indexPath)
        cell.backgroundView = UIImageView(image: photos[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let separator: CGFloat = 3
        let itemWidth = (view.frame.width - separator * 3)/4
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photos.append(photo)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}
