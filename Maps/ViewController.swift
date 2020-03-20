//
//  ViewController.swift
//  Maps
//
//  Created by HariharasSudhan on 16/09/19.
//  Copyright © 2019 Indium. All rights reserved.
//

import UIKit
import MapKit
import  CoreLocation
class ViewController: UIViewController,MKMapViewDelegate,UITextViewDelegate,CLLocationManagerDelegate{
    let newPin = MKPointAnnotation()
    var startPoint: CGPoint?
    var locationManager: CLLocationManager?


    @IBOutlet weak var txtViewNormal: UITextView!
    @IBOutlet weak var txtViewAttr: HBVLinkedTextView!
    @IBOutlet weak var mapView: MKMapView!
    var words = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var str =  "This should put you back in the state you were before staging all your changes files. Allowing you to stage changed files individually before you commit."
        let new = SplitString(stringToBeSplitted: str, By: 13)
        let sentence = new.joined(separator: "\n")  // "Hello World"
        var squareString = "\n\nFill in the table with whole numbers to make 26 in three different ways.<br>\n\nTens     Ones<br>2   +   [9]<br>[1]    +  [16]<br>[0]    +   26<br><br><br>"
        
         let trimmedString2 = squareString.replacingOccurrences(of: "\\[[\\w\\[^)]*.]*\\]", with: "___", options: .regularExpression)
        let hr = trimmedString2.htmlToString

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        let string = "Find\\ the\\ cube\\ root\\ of\\ given\\ number:\\\\ $$\\sqrt[3]{64}$$ =[4]"
        let trimmedString1 = string.replacingOccurrences(of: "[]", with: "___", options: .regularExpression)
        
        let trimmedString = string.replacingOccurrences(of: "\\[[\\w\\.]*\\]", with: "___", options: .regularExpression)
        
        
        mapView.delegate = self
        addAnnotation()

        
    }
    
    func SplitString(stringToBeSplitted:String, By:Int) -> [String]
        {
            var newArray = [String]()
            var newStr = String()
            for char in stringToBeSplitted
            {
                newStr += String(char)
                if newStr.count == By
                {
                    newArray.append(newStr)
                    newStr = "\n"
                }

            }
            return newArray
        }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }

   
    
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            
            let touchLocation = theTouch.location(in: self.view)
            let x = touchLocation.x
            let y = touchLocation.y
            
//            xCoord.text = ("x = \(x)")
//            yCoord.text = ("y = \(y)")
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            
            let endPoint = theTouch.location(in: self.view)
            let x = endPoint.x
            let y = endPoint.y
            
//            xCoord.text = ("x = \(x)")
//            yCoord.text = ("y = \(y)")
        }
    }
    func addAnnotation(){
        /*
        
        2  Kaminarimon -
        3. Nakamise Dori - ,
        4. Paintings -
        5. Hozomon -
        6. Goju no to -
        7. Kannon do -
        8, Nitenmon -
        9.  -
         
         //leura
         "19.0562529",
         "72.7637869"
         
         
         19.056568
         72.833908
         
         
         
         //s2
         12.989478
         80.25654900000001
 */
        let annot1 = MKPointAnnotation()
        //annot1.title = "Vasara Kimono"
        annot1.coordinate = CLLocationCoordinate2D(latitude: 19.056568, longitude: 72.833908)

//        let annot2 = MKPointAnnotation()
//        annot2.title = "Noren Kimono"
//        annot2.coordinate = CLLocationCoordinate2D(latitude: 35.711957, longitude: 139.797561)
//
//        let annot3 = MKPointAnnotation()
//        annot3.title = "Denbouin Dori"
//        annot3.coordinate = CLLocationCoordinate2D(latitude: 35.713003, longitude: 139.795943)
//
//        let annot4 = MKPointAnnotation()
//        annot4.title = "Shin Nakamise"
//        annot4.coordinate = CLLocationCoordinate2D(latitude: 35.712271, longitude: 139.794859)
//
//        let annot5 = MKPointAnnotation()
//        annot5.title = "Hoppy Dori"
//        annot5.coordinate = CLLocationCoordinate2D(latitude: 35.713846, longitude: 139.794303)
//
//        let annot6 = MKPointAnnotation()
//        annot6.title = "Marugoto Nippon"
//        annot6.coordinate = CLLocationCoordinate2D(latitude: 35.714203, longitude: 139.793807)
        
       
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.0562529, longitude: 72.7637869), span: span)
        
        //mapView.setRegion(region, animated: true)
        mapView.showAnnotations([annot1], animated:true)
        
        
        
    }
    
    
    
        
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKPointAnnotation else { return nil }
//
//        let identifier = "Annotation"
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//        if annotationView == nil {
//            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView!.canShowCallout = true
//            annotationView?.tintColor = UIColor.black
//            annotationView?.image = UIImage(named: "point")
//            annotationView?.canShowCallout = true
//            let btn = UIButton(type: .infoDark)
//            annotationView?.rightCalloutAccessoryView = btn
//             //annotation.title = "dasda"
//
//        } else {
//            annotationView!.annotation = annotation
//        }
//
//        return annotationView
//    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotationTitle = view.annotation?.title
        {
            print("User tapped on annotation with title: \(annotationTitle!)")
        }
        let annotationTitle = view.annotation?.title
        if annotationTitle == "Hoppy Dori"{
            self.view.backgroundColor = UIColor.red
        }
        else if annotationTitle == "Noren Kimono"{
            print("sffsf")
        }
    }
}

class CustomAnnotationView : MKPinAnnotationView
{
    let helloLabel:UILabel = UILabel.init(frame:CGRect(x: 0, y: 0, width: 100, height: 20)) //your desired frame
    
    func showLabel(title : String)
    {
        helloLabel.text = title
        helloLabel.textAlignment = .center
        //set further properties
        self.addSubview(helloLabel)
    }
    
    func hideLabel() {
    helloLabel.removeFromSuperview()
    }
}

extension String {
    private func regExprOfDetectingStringsBetween(str1: String, str2: String) -> String {
        return "(?:\(str1))(.*?)(?:\(str2))"
    }

    func replacingOccurrences(from subString1: String, to subString2: String, with replacement: String) -> String {
        let regExpr = regExprOfDetectingStringsBetween(str1: subString1, str2: subString2)
        return replacingOccurrences(of: regExpr, with: replacement, options: .regularExpression)
    }
    
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var checkcontainEmoji: Bool {
        for ucode in unicodeScalars {
            switch ucode.value {
            case 0x3030, 0x00AE, 0x00A9,
                 0x1D000...0x1F77F,
                 0x2100...0x27BF,
                 0xFE00...0xFE0F,
                 0x1F900...0x1F9FF:
                return true
            default:
                continue
            }
        }
        return false
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
