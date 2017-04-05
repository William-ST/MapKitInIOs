//
//  ViewController.swift
//  MapEnIOs
//
//  Created by alumno on 4/4/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let location = CLLocation(latitude: -12.102548, longitude: -77.025896)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        centrar(ubication: location)
        
        let marcador = Marcador(title: "Marcador 1", subtitle: "Descipción del marcador 1", coordinate: location.coordinate)
        mapView.addAnnotation(marcador)
        
        
        
        //let annotationView = MKAnnotationView()
        //annotationView.annotation?.title = marcador.nombre
        //annotationView.annotation?.coordinate = marcador.coordenada
        
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "marcador"
        var view: MKPinAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) {
        	dequeuedView.annotation = annotation
            view = dequeuedView as! MKPinAnnotationView
        } else {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
            view.canShowCallout = true
            
            view.calloutOffset = CGPoint(x: 10, y: -10)
            
            //view.image = UIImage(named: "ImagePng")
            //view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView!
            //let vista = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            //view.detailCalloutAccessoryView = vista
        }
        
        return view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func centrar(ubication: CLLocation) {
        let region = MKCoordinateRegion(center: ubication.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
        
        
    }
    
    
    @IBAction func mapValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            break;
        case 1:
            mapView.mapType = .satellite
            break;
        case 2:
            mapView.mapType = .hybrid
            break;
        default: break;
        }
        
    }
    

}

