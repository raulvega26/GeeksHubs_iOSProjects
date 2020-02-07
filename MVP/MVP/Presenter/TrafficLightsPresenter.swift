//
//  TrafficLightsPresenter.swift
//  MVP
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

class TrafficLightsPresenter {
    var provider: TrafficLightsProvider
    weak var delegate: TrafficLigthDelegate?
    
    init(provider: TrafficLightsProvider,
         delegate: TrafficLigthDelegate?) {
        self.provider = provider
        self.delegate = delegate
    }

    func trafficLightColorSelected(color: Color) {
        provider.trafficLight(color: color) { (light) in
            guard let l = light else { return }
            delegate?.displayLightTraffic(description: l.description)
        }
    }
}
