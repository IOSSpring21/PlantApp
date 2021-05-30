//
//  GridViewController.swift
//  Botanica
//
//  Created by Vidya Raghvendra Admin on 5/23/21.
//

import UIKit
import Parse
import AlamofireImage

class GridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var posts = [PFObject]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2)/3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pic = PFObject(className: "plantPics")
        pic["text"] = "this is a random comment"
        pic["author"] = PFUser.current()!

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantGridCell", for: indexPath) as! PlantGridCell

        let plantURL = URL(string: "https://source.unsplash.com/user/feeypflanzen")
        cell.plantView.af_setImage(withURL: plantURL!)

        return cell
    }
    
//    var imagesArray: [UIImage]
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imagesArray.count
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UploadDocsImagesCollectionViewCell
//
//
//            cell.plantView.image = imagesArray[indexPath.row]
//
//
//        return cell
//    }
    
    
    @IBOutlet weak var plantView: UIImageView!
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        }
        else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.editedImage] as! UIImage
//        let size = CGSize(width: 300, height: 300)
//        let scaledImage = image.af_imageScaled(to: size)
//
//        imageView.image = scaledImage
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
