//
//  ListaCervejaTableViewController.swift
//  RM31956
//
//  Created by rafael on 01/12/17.
//  Copyright © 2017 rafael. All rights reserved.
//

import UIKit
import Kingfisher

class ListaCervejaTableViewController: UITableViewController {
    
    var beers:[Beer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "beerSegue"{
            let vc = segue.destination as! ViewController
            vc.beer = beers[tableView.indexPathForSelectedRow!.row]
        }
    }

    
    func loadBeers(){
        REST.loadBeers { (beers:[Beer]?) in
            if let beers = beers{
                self.beers = beers
                
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBeers()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let beer = beers[indexPath.row]

        let url = URL(string: beer.image_url)
        
        cell.textLabel?.text = beer.name
        cell.detailTextLabel?.text = "\(beer.abv)"
        cell.imageView?.kf.setImage(with: url)
        

        return cell
    }
    

}
