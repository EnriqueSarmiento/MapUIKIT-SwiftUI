//
//  ViewController.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 23/4/24.
//

import UIKit
import MapKit
import SwiftUI

class ViewController: UIViewController {

   @IBOutlet weak var mapaUIKIT: MKMapView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
   }
   @IBSegueAction func segueSwiftUI(_ coder: NSCoder) -> UIViewController? {
      return UIHostingController(coder: coder, rootView: MapSwiftUI())
   }
}

