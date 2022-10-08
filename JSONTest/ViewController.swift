//
//  ViewController.swift
//  JSONTest
//
//  Created by Zhao-Rong Lai on 2022/10/9.
//

import UIKit

class ViewController: UIViewController {

    var pointsArray: [Placess.Places.Place.Point] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData(){
            let urlString = "https://gis.taiwan.net.tw/XMLReleaseALL_public/scenic_spot_C_f.json"
            
            guard let url = URL(string: urlString) else{
                print("inValid URL!!!")
                return
            }
            
            var requesut = URLRequest(url: url)
//            requesut.setValue("application/json", forHTTPHeaderField: "accept")
//            requesut.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: requesut) { data, response, error in
                
                if let error = error{
                    fatalError(error.localizedDescription)
                }
                
                guard let data = data else {
                    return
                }
                do{
                    
                        let points = try JSONDecoder().decode(Placess.self, from: data)
                        
                    //                    DispatchQueue.main.async {
                        for p in points.XML_Head.Infos.Info{
                            self.pointsArray.append(p)
                            print(".")
//                            //                        }
//                            print("===")
//
//
                        }
                    
                        print("END")
                }catch let jsonError{
                    print("ERROR!!!")
                    print(jsonError)
                }
                
//                print(String(decoding: data, as: UTF8.self))
            }.resume()
            
        }
    
    
    
    @IBAction func printButton(_ sender: Any) {
        print(pointsArray)
    }
    
}

