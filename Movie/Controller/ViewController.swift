//
//  ViewController.swift
//  Movie
//
//  Created by Mustafa on 21/06/2023.
//

import UIKit
import SDWebImage

class ViewController: UIViewController ,UICollectionViewDataSource , UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    
    var moviesArray:[Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        moviesArray = [Movie]()
        
        let url = URL(string:"https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies-2020s.json")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { data, UNNotification, error in
            do{
            
                guard let validData = data else {return}
                let movies = try JSONDecoder().decode(Movies.self,from: validData)
                
               self.moviesArray = movies
//                let json = try JSONSerialization.jsonObject(with: data! , options: .allowFragments) as! Array<Dictionary<String,Any>>
//                for rawMovie in json{
//                    let singleMovie = Movie()
//                    singleMovie.title = rawMovie["title"] as? String
//                    singleMovie.thumbnail = rawMovie["thumbnail"] as? String
//                    singleMovie.year = rawMovie["year"] as? Int
//
//                    self.moviesArray?.append(singleMovie)
//
//
 //               }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
                
                
            }catch{
                print("There is an error in serilization of data")
            }
            
        }
        task.resume()
        
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (moviesArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.movieTitle.text = moviesArray![indexPath.row].title
        let url = URL(string: moviesArray![indexPath.row].thumbnail!)
        cell.movieImage.sd_setImage(with: url , completed: nil)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsController
        
        vc.movieDetails = moviesArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    
    
    
    
}

