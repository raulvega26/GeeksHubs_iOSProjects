//
//  TrafficLightsViewController.swift
//  MVP
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

import UIKit

class TrafficLightsViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    lazy var presenter = TrafficLightsPresenter(provider: TrafficLightsProvider(), delegate: self)
    
    @IBAction func redLightWasPressed(_ sender: UIButton) {
        presenter.trafficLightColorSelected(color: .red)
    }
   
    @IBAction func yellowLightWasPressed(_ sender: UIButton) {
        presenter.trafficLightColorSelected(color: .yellow)
    }
    
    @IBAction func greenLightWasPressed(_ sender: UIButton) {
        presenter.trafficLightColorSelected(color: .green)
    }
}

extension TrafficLightsViewController: TrafficLigthDelegate {
    func displayLightTraffic(description: String) {
        descriptionLabel.text = description
    }
}
