//
//  ActivityDetailViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 17/09/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit
import MapKit

class ActivityDetailViewController: UIViewController {
    
    let activity: Activity
    @IBOutlet weak var activityLocationLabel: UILabel!
    @IBOutlet weak var activityDesc: UITextView!
    @IBOutlet weak var activityHost: UILabel!
    @IBOutlet weak var activityMap: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initActivityDetails()
        self.navigationController?.title = "\(activity.name.capitalized)"
        // Do any additional setup after loading the view.
      
      let geo = CLGeocoder()
      geo.geocodeAddressString(activity.location) { (placemarks, error) in
        if error == nil {
          if let placemark = placemarks?[0] {
            
            let location = placemark.location!
            var mapRegion = MKCoordinateRegion()
            let annotation = MKPointAnnotation()
            var coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            mapRegion.center = coordinate
            mapRegion.span.latitudeDelta = 0.1
            mapRegion.span.longitudeDelta = 0.1
            annotation.coordinate = coordinate
            annotation.title = self.activity.name
            self.activityMap.addAnnotation(annotation)
            self.activityMap.setRegion(mapRegion, animated: true)
            return
          }
        }
      }
      
    }
    
    func initActivityDetails() {
        self.activityLocationLabel.text = activity.location
        self.activityDesc.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        self.activityHost.text = self.activity.user
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, activity: Activity) {
        self.activity = activity
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
  
  @IBAction func checkInToActivity(_ sender: Any) {
    print("USER CHECKED IN")
  }
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
