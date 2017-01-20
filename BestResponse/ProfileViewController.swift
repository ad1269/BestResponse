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

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var Reveals: UILabel!
    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var BioTextView: UITextView!
    @IBOutlet weak var chartView: BarChartView!
    
    let user: User = User()
    
    var months: [String]!
    
    func setChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
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
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [-10.0, -4.0, 2.0, 8.0, 12.0, 14.0, 4.0, 12.0, 2.0, -4.0, -5.0, 1.0]
        
        setChart(dataPoints: months, values: unitsSold)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
