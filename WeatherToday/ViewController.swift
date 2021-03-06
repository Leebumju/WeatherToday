//
//  ViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var countryView: UITableView!
    
    
    let cellIdentifier: String = "cell"
    
    var countries: [Country] = []
   
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondViewController =
                segue.destination as? SecondViewController else {
            return
        }
        
        
        let selectedPath = countryView.indexPathForSelectedRow
        
        //두번째 뷰로 데이터 넘기기
        nextViewController.cityName = countries[selectedPath!.row].korean_name
        nextViewController.assetName = countries[selectedPath!.row].asset_name
        nextViewController.navigationItem.title = countries[selectedPath!.row].korean_name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Cell {
            let country: Country = self.countries[indexPath.row]
            let img = UIImage(named: "flag_\(country.asset_name).jpg")
            cell.countryImg.image = img
            cell.countryName.text = country.korean_name
            
            return cell
        } else {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showSecondView", sender: indexPath.row)
    }

}

class Cell: UITableViewCell {
    @IBOutlet weak var countryImg: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
}
