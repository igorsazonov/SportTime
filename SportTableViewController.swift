//
//  SportTableViewController.swift
//  SportTime
//
//  Created by Игорь Сазонов on 02/02/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit
import CoreData

var myIndex = 0

class SportTableViewController: UITableViewController, AddSportViewControllerDelegate {

    var sports = [SportTime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportTimeCellIdentifier", for: indexPath)
        let sport = sports[indexPath.row]
        cell.textLabel?.text = sport.naem
        cell.textLabel?.text = sport.pabota
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        let navigationController = segue.destination as?
        UINavigationController
        let addSportViewController = navigationController?.topViewController as?
        AddSportViewController
        addSportViewController?.delegate = self
        
    }
    
    //MARK: - AddSportViewControllerDelegate
    
    func addSportViewController(_ addSportViewController: AddSportViewController, didAddSport sport: SportTime) {
        sports.append(sport)
        tableView.reloadData()
        
    }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
    performSegue(withIdentifier: "Seam", sender: self)
    
    }
 
    
    
    

}
