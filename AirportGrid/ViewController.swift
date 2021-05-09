//
//  ViewController.swift
//  AirportGrid
//
//  Created by CHI on 2021/5/4.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var airports: [Airport] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        collectionView.delegate = self
        collectionView.dataSource = self
        // start here...
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return airports.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AirportCell", for: indexPath) as! AirportCollectionViewCell
        let airport = airports[indexPath.row]
        cell.photoimageview.image = UIImage (named: airport.imageName)
        cell.photoimageview.layer.cornerRadius = 5
        cell.iatalabel.text = airport.IATA
        return cell
    }
}

extension ViewController {
    private func fetchData() {
        guard let path = Bundle.main.path(forResource: "airports", ofType: "plist"),
              let xml = FileManager.default.contents(atPath: path),
              let airports = try? PropertyListDecoder().decode([Airport].self, from: xml) else {
            return
        }
        self.airports = airports
    }
}
