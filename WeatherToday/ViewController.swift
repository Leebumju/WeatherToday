//
//  ViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var countryView: UITableView!
    
    //@IBOutlet weak var cityWeatherView: UITableView!
    let cellIdentifier: String = "cell"
    //var city: [CityWeather] = []
    var countries: [Country] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        /*let img = UIImage(named: "flag_jp.png")
        
        let country: Country = self.countries[indexPath.row]
        cell.textLabel?.text = country.korean_name
        cell.countryImg.image = img
        //cell.detailTextLabel?.text = String(country.celsius)*/
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell{
            let country: Country = self.countries[indexPath.row]
            let img = UIImage(named: "flag_\(country.asset_name).jpg")
            cell.countryImg.image=img
            cell.textLabel?.text = country.korean_name
            //cell.bountyLabel.text="\(bountyList[indexPath.row])"
            return cell
        }else{
            return UITableViewCell()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //json data asset이용하기
        //json Decoder 선언
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do {
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.countryView.reloadData()
    }


}

class Cell: UITableViewCell {
    @IBOutlet weak var countryImg: UIImageView!
}
