//
//  TrafficLightsProvider.swift
//  MVP
//
//  Created by Joan Molinas Invokers on 22/01/2020.
//  Copyright © 2020 Atlabs Digital S.L. All rights reserved.
//

struct TrafficLightsProvider {
    
    private let lights = [
        TrafficLight(color: .red, description: "My red light"),
        TrafficLight(color: .yellow, description: "My yellow light"),
        TrafficLight(color: .green, description: "My green light"),
    ]
    
    func trafficLight(color: Color, _ completion: (TrafficLight?) -> Void) {
        let foundLight = lights.first(where: { $0.color == color })
        completion(foundLight)
    }
}
