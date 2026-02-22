//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Arda Özel on 25.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Great Wall of China")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Great Pyramid of Giza")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Machu Picchu")
        
      
        landmarkImages.append(UIImage(named: "Colosseo.jpg")!)
        landmarkImages.append(UIImage(named: "eiffel.jpg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpg")!)
        landmarkImages.append(UIImage(named: "pyramids.jpg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpg")!)
        landmarkImages.append(UIImage(named: "machu.jpg")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // old version -->
        //cell.textLabel?.text = "test"
        
        var content = cell.defaultContentConfiguration()
        
        content.text = landmarkNames[indexPath.row]
        //content.image = landmarkImages[indexPath.row]
        
        // table view line da 2.ci yazı content.secondaryText = "test"
        cell.contentConfiguration = content
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            
        }
    }
    //add the delete row function
   /* func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }*/
    
}

