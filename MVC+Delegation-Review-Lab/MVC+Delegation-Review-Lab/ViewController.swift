//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, fontDelegate {
    var currentFontSize = 17
    var movies = Movie.allMovies
    @IBOutlet weak var tableViewOut: UITableView!
    
    func sizeUpdate(size: CGFloat) {
        currentFontSize = Int(size)
        tableViewOut.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOut.delegate = self
        tableViewOut.dataSource = self
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let fontVC = segue.destination as? settingsViewController else {
            fatalError("Unexpected segue VC")
        }
        fontVC.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOut.dequeueReusableCell(withIdentifier: "table", for: indexPath)
        cell.textLabel?.text =  movies[indexPath.row].name
        cell.detailTextLabel?.text = movies[indexPath.row].genre
        cell.textLabel?.font = UIFont.systemFont(ofSize: CGFloat(currentFontSize))
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: CGFloat(currentFontSize))
        return cell
    }
    
}

