//
//  ViewController.swift
//  Gukora
//
//  Created by Arnold Gihozo on 2021-01-13.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//       reminders.textLabel?.text = names[indexPath.row]
//        return reminders
//    }
    

    
    
    @IBOutlet var tableViewVariable: UITableView!
    var eventStore: EKEventStore! // store the reference to the calendar database
    var reminders: [EKReminder]!
    
    let names = [
        "Yo assfas",
        "yoasaf asfsas",
        "asfas asaf",
        "oasoa pasaf"]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewVariable.delegate = self
        //tableViewVariable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.eventStore = EKEventStore()
        self.reminders = [EKReminder]()
        self.eventStore.requestAccess(to: .reminder) { (granted, error) in
            if let error = error{
                print(error)
                return
            }
            if granted{
                var predicate: NSPredicate? = self.eventStore.predicateForReminders(in: nil)
                if let aPredicate = predicate{
                    self.eventStore.fetchReminders(matching: aPredicate, completion: {(_ reminders: [Any]?) -> Void in
                        for reminder: EKReminder? in self.reminders ?? [EKReminder?]() {
                            
                        }
                    }
                )}
//                let predicate = self.eventStore.predicateForReminders(in: T##[EKCalendar]?)
//                self.eventStore.fetchReminders(matching: predicate) { (_: [EKReminder]?) -> Void in
//                    self.reminders = self.reminders
//                    dispatch_async(dispatch_get_main_queue()){
//                        self.tableView.reloadData()
//                    }
//                }
//
        }
    }


}




// Delegate functions are used to handle interaction of cells
//extension ViewController: UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//}
//
//extension ViewController: UITableViewDataSource{
//
//    // here is the number of rows we want to show in the table (row is a table cell)
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return names.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // using the template cell over and over and simply swap the data in the table view (which helps with performance). Use same template over anad over and swap up the data
//
//        // dequeuing is the process to see if there is a previous avaialble cell and using it as template for the new cell
//
//        // index path is the position in the table. A table is compromised of sections (ie:columns) and rows. A table can have an n amount of section and each section can
//        // have n amount of rows. if you dont say the number of sections, then it is 1.
//        cell.textLabel?.text = names[indexPath.row]
//        return cell
//    }
//}


}
