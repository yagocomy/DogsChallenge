//
//  ViewController.swift
//  Dogs
//
//  Created by Yago De Moura Silva on 06/08/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private lazy var tableView = UITableView()

    var dogBreed = [Breed(breed: "Pinscher"),
                    Breed(breed: "Rottweiler"),
                    Breed(breed: "Poodle"),
                    Breed(breed: "Pastor Alemão"),
                    Breed(breed: "Labrador"),
                    Breed(breed: "Dogue-de-Bordéus"),
                    Breed(breed: "Cane Corso"),
                    Breed(breed: "Pit Bull"),
                    Breed(breed: "Beagle")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        dogBreed.shuffle()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogBreed.count
    }

    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let dogs = dogBreed[indexPath.row]
        cell.textLabel?.text = dogs.breed
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alertTitle = "Você clicou em"
        let message = dogBreed[indexPath.row].breed
        let alert = UIAlertController(title: alertTitle, message: String(message), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))

        present(alert, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
