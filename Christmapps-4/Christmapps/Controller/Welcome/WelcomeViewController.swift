//
//  WelcomeViewController.swift
//  Christmapps
//
//  Created by Joan Molinas Invokers on 19/12/2019.
//  Copyright © 2019 Atlabs. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Properties
    private let dataRetriver = URLSessionDataRetriever()
    var topLabel: UILabel = {
        let label = UILabel()
        label.text = "🎅🏻 MERRY CHRISTIMAPPS 🎅🏻"
        label.textColor = .red
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 27)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var disclaimerLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Esta app está diseñada para ser lo más parecido a un caso de uso real y que podréis encontrar vuestro día a día. Os vais a descargar unos datos en formato JSON y los vais a mostrar por pantalla.
        Ya os he creado las carpetas y arquitectura básica para poder trabajar, pero no está todo completo, así que tendréis que trabajar para terminarlo, no esperéis que sea fácil por mucho hayáis empezado ya, deberéis ser lo más competentes posibles y aquí no va a ser menos.

        Ánimo.
        """
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var startButton: UIButton = {
        let b = UIButton(type: .custom)
        b.backgroundColor = .green
        b.setTitle("Empezar 🤩", for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(startWasPressed(_:)), for: .touchUpInside)
        return b
    }()
    
    let queue =  DispatchQueue(label: "pepitonaskjsdkjkhjdf")
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topLabel)
        view.addSubview(disclaimerLabel)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topLabel.heightAnchor.constraint(equalToConstant: 40),
            disclaimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            disclaimerLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            disclaimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            disclaimerLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant:60)
        ])
    }
    
    // MARK: - Actions
    @objc private func startWasPressed(_ sender: UIButton) {
        let posts = PostsTableViewController(dataRetriever: dataRetriver)
        let nav = UINavigationController(rootViewController: posts)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true)
    }
}
