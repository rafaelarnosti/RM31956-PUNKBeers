//
//  ViewController.swift
//  RM31956
//
//  Created by rafael on 26/11/17.
//  Copyright © 2017 rafael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UILabel!
    @IBOutlet weak var tfTagLine: UILabel!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var tfabv: UILabel!
    @IBOutlet weak var tfibu: UILabel!
    @IBOutlet weak var ivBeers: UIImageView!
    
    
    var beer: Beer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if beer != nil{
            tfName.text = beer.name
            tfTagLine.text = beer.tagline
            tvDescription.text = beer.description
            tfabv.text = "Teor Alcoolico: \(beer.abv)"
            tfibu.text = "Escala de Amargor: \(beer.ibu ?? 0)"
            
            let url = URL(string: beer.image_url)            
            ivBeers.kf.setImage(with: url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

