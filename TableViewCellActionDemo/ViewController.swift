//
//  ViewController.swift
//  TableViewCellActionDemo
//
//  Created by Dong on 2018/3/10.
//  Copyright © 2018年 Dong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showValueLabel: UILabel!
    private var value: Int = 0 {
        didSet {
            self.showValueLabel.text = "\(value)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MyCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        if cell.stepperChanged == nil {
            cell.stepperChanged = { [weak self] (stepperStatus) in
                switch stepperStatus {
                case .plus:
                    self?.value += 1
                case .minus:
                    self?.value -= 1
                }
            }
        }
        
        return cell
    }
}

