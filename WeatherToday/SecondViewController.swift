//
//  SecondViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/14.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var cityView: UITableView!
    var cityName: String?
    var cities: [City] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.cities.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell {
            
            let city: City = self.cities[indexPath.row]
            let img = UIImage(named: "rainy.jpg")
            cell.weatherImg.image = img
            //cell.textLabel?.text = country.korean_name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "fr") else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.cityView.reloadData()
        //updateUI()
        // Do any additional setup after loading the view.
    }
    /*
    func updateUI() {
        if let cityName = self.cityName {
            foodLabel.text = cityName
        }
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().barTintColor = UIColor.red
        UITabBar.appearance().barTintColor = UIColor.blue
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class CityCell: UITableViewCell {
    @IBOutlet weak var weatherImg: UIImageView!
}
