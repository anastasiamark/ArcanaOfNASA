//
//  ViewController.swift
//  ArcanaOfNASA
//
//  Created by Eugenity on 31.07.18.
//  Copyright © 2018 AnastasiaMark. All rights reserved.
//

import UIKit
import SDWebImage

class APODViewController: UIViewController {
    
    var apod: AstronomyPictureOfTheDay? {
        didSet {
            self.apodCollectionView.reloadData()
        }
    }
    var marsPhotos: [MarsRoverPhoto?] = []
    
    @IBOutlet weak var apodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        receiveAPOdForCurrentDate()
        receiveMarsPhotos(earthDate: "2015-06-03")
    }
    
    // MARK: Helper functions
    
    func receiveMarsPhotos(earthDate: String) {
        let networkManager = NetworkManager()
        networkManager.fetchMarsPhotosForEarthDate(earthDate: earthDate) { [weak self] marsPhotos, error in
            self?.marsPhotos = marsPhotos
            for photo in marsPhotos {
                if let marsPhoto = photo {
                    print(marsPhoto.photoURL)
                }
            }
        }
    }
    
    func receiveAPOdForCurrentDate() {
        let networkManager = NetworkManager()
        networkManager.fetchAPOD { [weak self] apod, error in
            if let apod = apod {
                self?.apod = apod
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func receiveAPODForDate(date: String) {
        let networkManager = NetworkManager()
        networkManager.fetchAPODForDate(date: "2018-08-15") { [weak self] apod, error in
            if let apod = apod {
                self?.apod = apod
            } else if let error = error {
                print(error)
            }
        }
    }
    
}

extension APODViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}

extension APODViewController: UICollectionViewDelegate {
    
}

extension APODViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "APODCollectionViewCell", for: indexPath) as! APODCollectionViewCell
        if let apod = apod, let url = apod.url {
            cell.apodImageView.sd_setImage(with: URL(string: url), placeholderImage: nil)
        }
        
        return cell
    }
    
    
}
