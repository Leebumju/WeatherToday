//
//  ViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cityWeatherView: UITableView!
    let cellIdentifier: String = "cell"
    var city: [CityWeather] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let cityWeather: CityWeather = self.city[indexPath.row]
        cell.textLabel?.text = cityWeather.city_name
        cell.detailTextLabel?.text = String(cityWeather.celsius)
        return cell
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //json data asset이용하기
        //json Decoder 선언
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "fr") else {
            return
        }
        
        do {
            self.city = try jsonDecoder.decode([CityWeather].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.cityWeatherView.reloadData()
    }


}

