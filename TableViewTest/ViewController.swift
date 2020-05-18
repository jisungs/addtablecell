//
//  ViewController.swift
//  TableViewTest
//
//  Created by The book Air on 2020/05/14.
//  Copyright © 2020 The book Air. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var guestNameArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            
        ])
    }
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.separatorColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
        cell.backgroundColor = UIColor.white
        //cell.textField.placeholder = "guest Name"
        cell.dayLabel.text = "Day\(indexPath.row + 1)"
        cell.addButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    
    @objc func buttonAction(_ sender: UIButton!){
        let buttonPosition = sender.convert(CGPoint.zero , to: tableView)
        let indexPath = tableView.indexPathForRow(at: buttonPosition)
        let cell = tableView.cellForRow(at: indexPath!) as! ThirtyDayCell
      
        if let guestName = cell.textField.text {
            guestNameArray.append(guestName)
        }
    }
    
}

