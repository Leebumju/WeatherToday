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
    ///
    var assetName: String?
    ///

    @IBOutlet weak var cityView: UITableView!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
   // let img = UIImage(named: "flag_\(country.asset_name).jpg")
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cityCell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell {
            let city: City = self.cities[indexPath.row]
            var weatherName: String = ""
            cityCell.cityLabel?.text = city.city_name
            cityCell.FahrenheitLabel?.text = "화씨" + String((city.celsius * 9/5) + 32) + "도"
            cityCell.celsiusLabel?.text = "섭씨 " + String(city.celsius) + "도 / "
            cityCell.rainfallLabel?.text = "강수확률 " + String(city.rainfall_probability) + "%"
            
            if city.state == 10 {
                weatherName = "sunny"
            } else if city.state == 11 {
                weatherName = "cloudy"
            } else if city.state == 12 {
                weatherName = "rainy"
            } else if city.state == 13 {
                weatherName = "snowy"
            }
            
            let img = UIImage(named: "\(weatherName).jpg")
            cityCell.weatherImg.image = img
           
            return cityCell
        } else {
            return UITableViewCell()
        }
    }
    //celsius == 섭씨
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cityLabel.text = self.cityName
        var a: String = ""
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        if let city = assetName {
            a = city
        }
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "\(a)") else {
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
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var FahrenheitLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
}
/*
/"city_name":"도쿄",
"state":12,
"celsius":2.3,
"rainfall_probability":40
*/
