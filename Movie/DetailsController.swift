//
//  DetailsController.swift
//  Movie
//
//  Created by Mustafa on 25/06/2023.
//

import UIKit
import SDWebImage

class DetailsController: UIViewController {
    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    var movieDetails:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieDetails?.title
        if let rate = movieDetails?.rating{
            ratingLabel.text = "\(rate)"
        }
        if let year = movieDetails?.year{
            yearLabel.text = "\(year)"
            
        }
        
        let url = URL(string: (movieDetails?.thumbnail)!)
        detailsImage.sd_setImage(with: url , completed: nil)
        
        

        
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
