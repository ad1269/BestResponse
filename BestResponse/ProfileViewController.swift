//
//  ProfileViewController.swift
//  BestResponse
//
//  Created by Nabeel Mamoon on 1/19/17.
//  Copyright © 2017 AD Mohanraj. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Reveals: UILabel!
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var BioTextView: UITextView!
    
    // Change from a bar chart to other type
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet weak var topCommentsTableView: UITableView!
    
    let user: User = User()
    
    // Array that is displayed by the table (Change to contain Post objects)
    var topComments: [String] = ["Comment 1", "Comment 2", "Comment 3"]
    
    // Chart customization function
    func setChart(values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])

            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "BRScore")
        chartDataSet.colors = ChartColorTemplates.vordiplom()

        let chartData = BarChartData(dataSet: chartDataSet)
        chartView.data = chartData
        
        chartView.chartDescription?.text = ""
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        profileLabel.text = user.username
        BioTextView.text = user.bio
        Score.text = String(user.upvoteScore)
        ProfilePicture.image = user.profilePic
        Reveals.text = String(user.revealNum)
        
        // Set up chart
        let unitsSold = [-10.0, -4.0, 2.0, 8.0, 12.0, 14.0, 4.0, 12.0, 2.0, -4.0, -5.0, 1.0]
        setChart(values: unitsSold)
        
        // Register UITableView class
        // This sets the identifier name for the cell to be used later
        topCommentsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View Management functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topComments.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = topCommentsTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = topComments[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Comments"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
