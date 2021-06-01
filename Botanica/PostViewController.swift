//
//  PostViewController.swift
//  Botanica
//
//  Created by Vidya Raghvendra Admin on 5/16/21.
//

import UIKit
import Parse

class PostViewController: UIViewController {


    
    @IBOutlet weak var postField: UITextView!
        
    @IBAction func onSubmit(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["textPost"] = postField.text!
        post["author"] = PFUser.current()!
        
        post.saveInBackground { (success, error) in if success {
            self.dismiss(animated: true, completion: nil)
            print("saved!")
        } else {
            print("error!")
        }
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
