//
//  ViewController.swift
//  LFSGoogleMaps
//
//  Created by Kyo.L on 5/2/16.
//  Copyright © 2016 Kyo.L. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    @IBAction func takePhoto(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .Camera
        
        [self .presentViewController(picker, animated: true, completion: nil)]
        
    }
    
    @IBAction func selectPhoto(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .PhotoLibrary
        
        [self .presentViewController(picker, animated: true, completion: nil)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if ([UIImagePickerController.isSourceTypeAvailable(.Camera)] != true) {
            let myAlertView = UIAlertController(title: "Error", message: "Device has no Camera", preferredStyle: .ActionSheet)
            
            myAlertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
                
                self.presentViewController(myAlertView, animated: true, completion: nil)
        }
        // Google API Tutorial
//        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
//                                                          longitude: 151.20, zoom: 6)
//        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
//        mapView.myLocationEnabled = true
//        self.view = mapView
//        
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.imageView.image = chosenImage
        
        [picker .dismissViewControllerAnimated(true, completion: nil)]
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        [picker .dismissViewControllerAnimated(true, completion: nil)]
    }
}

