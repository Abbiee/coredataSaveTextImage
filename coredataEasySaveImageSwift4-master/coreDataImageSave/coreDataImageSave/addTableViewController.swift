//
//  addTableViewController.swift
//  coreDataImageSave
//
//  Created by Bibin Mathew on 1/8/18.
//  Copyright © 2018 featherSoft. All rights reserved.
//

import UIKit

class addTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [BrowseImage] = []
    @IBOutlet weak var sampleTableView: UITableView!
    
    @IBOutlet weak var firstName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func fetchData() {
        
        do {
            items = try context.fetch(BrowseImage.fetchRequest())
            print(items)
            DispatchQueue.main.async {
                self.sampleTableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
        
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:customTableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! customTableCell
        let image : UIImage = UIImage(data: items.reversed()[indexPath.row].image!)!
        cell.customcellImage.image = image
        cell.firstNameLabel.text = items.reversed()[indexPath.row].firstName
        cell.aboutMeLabel.text = items.reversed()[indexPath.row].aboutMe
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
