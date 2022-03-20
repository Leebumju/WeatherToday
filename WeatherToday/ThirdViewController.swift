//
//  ThirdViewController.swift
//  WeatherToday
//
//  Created by 이범준 on 2022/03/20.
//

import UIKit

class ThirdViewController: UIViewController {
    var fahrenheit: Double?
    var celsius: Double?
    var state: Int?
    var rainfall: Int?

    
    
    @IBOutlet weak var weatherImg: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var rainfallLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingLabel()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func settingLabel() {
        var weatherName: String = ""
        if let existCelsius = celsius, let existFahrenheit = fahrenheit {
            celsiusLabel.text = "섭씨" + String(existCelsius) + "도 / " + "화씨" + String(existFahrenheit) + "도"
        }
        if let existRainfall = rainfall {
            rainfallLabel.text = "강수확률" + String(existRainfall) + "%"
        }
        
        if state == 10 {
            weatherLabel.text = "맑음"
            weatherName = "sunny"
        } else if state == 11 {
            weatherLabel.text = "구름"
            weatherName = "cloudy"
        } else if state == 12 {
            weatherLabel.text = "비"
            weatherName = "rainy"
        } else if state == 13 {
            weatherLabel.text = "눈"
            weatherName = "snowy"
        }
        
        let img = UIImage(named: "\(weatherName).jpg")
        weatherImg.image = img
    }

}
