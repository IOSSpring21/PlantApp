//
//  DiscoverViewController.swift
//  Botanica
//
//  Created by Vidya Raghvendra Admin on 5/30/21.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantpics.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DiscoverCell", for: indexPath) as! DiscoverCell
        
        let plantpic = plantpics[indexPath.item]
        
        let baseUrl = ""
        let posterPath = plantpic["webformatURL"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.discoverView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var plantpics = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2)/3
        layout.itemSize = CGSize(width: width, height: width * 3/2)

        let url = URL(string: "https://pixabay.com/api/?key=21863393-25964d2b384a17ce0198b0a55&q=succulent+plant&image_type=photo&pretty=true")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

            self.plantpics = dataDictionary["hits"] as! [[String:Any]]
            
            self.collectionView.reloadData()
            print(self.plantpics)
           }
        }
        task.resume()
    }
    
}