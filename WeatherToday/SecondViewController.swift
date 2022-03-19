//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/19.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var cityName: String?
    var cities: [City] = []

    

    @IBOutlet weak var cityView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
   // let img = UIImage(named: "flag_\(country.asset_name).jpg")
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell {
            let city: City = self.cities[indexPath.row]
            
            
            let img = UIImage(named: "kr.jpg")
            cityCell.weatherImg.image = img
            cityCell.textLabel?.text = city.city_name
            
        
            return cityCell
            
        } else {
            return UITableViewCell()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cityLabel.text = self.cityName

        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "\(cityName!)") else {
            return
        }
       
        
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        self.cityView.reloadData()
    }

}


class CityCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherImg: UIImageView!
}


