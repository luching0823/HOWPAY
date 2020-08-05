//
//  mapViewController.swift
//  HOWPAY
//
//  Created by 廖昱晴 on 2020/8/5.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController, CLLocationManagerDelegate {
    
    var myLocationManager: CLLocationManager!
    var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //建立一個CLLocationManager
        myLocationManager = CLLocationManager()
        //設置委任對象
        myLocationManager.delegate = self
        //距離篩選器 設置移動多少距離才觸發委任方法更新位置
        myLocationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        //取得自身定位位置的精確度
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //印出目前位置座標
        let currentLocation: CLLocation = locations[0] as CLLocation
        print("\(currentLocation.coordinate.latitude)")
        print("\(currentLocation.coordinate.longitude)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //首次使用 向使用者詢問定位權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            //取得定位服務授權
            myLocationManager.requestWhenInUseAuthorization()
            //開始定位
            myLocationManager.startUpdatingLocation()
        } //使用者拒絕權限
        else if CLLocationManager.authorizationStatus() == .denied {
            //提示可以至設定中開啟權限
            let alertController = UIAlertController(title: "定位權限已關閉", message: "如要變更權限，請至設定>隱私權>定位服務 開啟", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } //使用者已同意定位權限
        else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            //開始定位
            myLocationManager.startUpdatingLocation()
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //停止更新位置
        myLocationManager.stopUpdatingLocation()
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
