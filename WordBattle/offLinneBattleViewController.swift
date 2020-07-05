//
//  offLinneBattleViewController.swift
//  WordBattle
//
//  Created by 佐々木徳哉 on 2020/06/07.
//  Copyright © 2020 佐々木徳哉. All rights reserved.
//

import UIKit

class offLinneBattleViewController: UIViewController {

    @IBOutlet weak var timeOutLabel: UILabel!
//    var test = TrendGet.trendSearchUrl()
    

    var timer : Timer = Timer()
    
    //制限時間
    var time: Int = 10
    
    
    override func viewDidLoad() {
        initSetting()
        super.viewDidLoad()
        createTimer()

        
    }
    
    func initSetting() {
        timeOutLabel.layer.borderWidth = 2.0
        timeOutLabel.layer.borderColor = UIColor.black.cgColor
        timeOutLabel.layer.cornerRadius = 20
        timeOutLabel.clipsToBounds = true
        timeOutLabel.text = String(10)
        
        //search
        let url: URL = URL(string: "http://127.0.0.1:10080/api/v1/nowtrend")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            // コンソールに出力
            print("data: \(String(describing: data))")
            print("response: \(String(describing: response))")
            print("error: \(String(describing: error))")
            do{
                let couponData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: Any]
                let decoder = JSONDecoder()
//                let couponDecodeData = try decoder.decode(String.self, from: couponData)
                print(couponData) // Jsonの中身を表示
//                print(couponDecodeData)
            }
            catch {
                print(error)
            }
        })
        task.resume()

    }
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector( mainTimeAction), userInfo: nil, repeats: true)
        }
    
    @objc func mainTimeAction(){
        time -= 1
        if(time > 0){
        //例えばLabeに表示や時間を加えたり減らしたりなどなど
        timeOutLabel.text = "\(time)"
        } else {
//            let storyboard: UIStoryboard = self.storyboard!
            let TimeUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimeUpViewController") as! TimeUpViewController
            self.present(TimeUpViewController, animated: true, completion: nil)
            timeOutLabel.text = "終了"
            timer.invalidate()
        }
    }
}
        
    

    /*
    // MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


