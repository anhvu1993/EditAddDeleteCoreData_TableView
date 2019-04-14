//
//  TableViewController.swift
//  NewCoreData
//
//  Created by Anh vũ on 4/11/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var user:[Entity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    func getEntity() {
        do { guard let userdata = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] else {return}
            self.user = userdata
        } catch {
            print("loi data")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getEntity()
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        tableView.isScrollEnabled = true
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "Detail":
            guard  let detailViewController = segue.destination as? DetailViewController else {return}
            if let indexPath = tableView.indexPathForSelectedRow {
                let data = user[indexPath.row]
                detailViewController.indexPath = indexPath
                detailViewController.user = data
            }
        default:
            return
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let listUser = user[indexPath.row]
        cell.name.text = listUser.name
        cell.age.text  = listUser.age
        cell.avatar.image = listUser.image
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let user = self.user.remove(at: indexPath.row)
            AppDelegate.context.delete(user)
            AppDelegate.saveContext()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
