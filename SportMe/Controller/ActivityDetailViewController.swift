//
//  ActivityDetailViewController.swift
//  SportMe
//
//  Created by Sapphire Duffy on 17/09/2018.
//  Copyright © 2018 Sapphire Duffy. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    let activity: Activity
    @IBOutlet weak var activityNameLabel: UILabel!
    @IBOutlet weak var activityLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initActivityDetails()
        // Do any additional setup after loading the view.
    }
    
    func initActivityDetails() {
        self.activityNameLabel.text = activity.name
        self.activityLocationLabel.text = activity.location
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
