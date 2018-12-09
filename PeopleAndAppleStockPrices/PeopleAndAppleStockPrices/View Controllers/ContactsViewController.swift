//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Elizabeth Peraza  on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
  
  private var contacts = [ContactsBrain]()
  
  @IBOutlet weak var contactsTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadContacts()
    contactsTableView.dataSource = self
    dump(contacts)
  }
  
  func loadContacts(){
    if let path = Bundle.main.path(forResource: "userinfo", ofType: "json"){
      let contactsURL = URL.init(fileURLWithPath: path)
      if let data = try? Data.init(contentsOf: contactsURL){
        do{
          self.contacts = try JSONDecoder().decode([ContactsBrain].self
            , from: data)
          
        } catch {
          print(error)
        }
      }
    }
  }
  
}

extension ContactsViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return contacts.count
    
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let currentContact = contacts[indexPath.row]
    cell.textLabel?.text = currentContact.name.first
    
    return cell
  }
}
