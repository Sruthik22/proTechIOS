import UIKit

class mapOfSchool: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if self.imageView.image == nil {
            
            var data = UserDefaults.standard.object(forKey: "savedFloorPlan")
            
            if data != nil {
                data = data as! NSData
                imageView.image = UIImage(data: data as! Data)
            }
                
            else {
                let yourImage: UIImage = UIImage(named: "placeholder")!
                imageView.image = yourImage
            }
        }
    }
    
    var pressedPlaceTheShooter = false
    var alreadyMade = false
    
    @IBAction func placeTheShooter(_ sender: Any) {
        
        pressedPlaceTheShooter = true
    }
    
    var pressedPlaceUserLocation = false
    var alreadyMadeUser = false
    
    @IBAction func placeYourLocation(_ sender: Any) {
        
        pressedPlaceUserLocation = true
    }
    
    
    @IBOutlet weak var placeTheShooter: UIButton!
    @IBOutlet weak var floorPlanImageView: UIImageView!
    
    var pinImageView = UIImageView()
    
    var pinImageViewUser = UIImageView()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let position = touch.location(in: self.view)
            var positionArray = [position.x, position.y]
            
            if pressedPlaceTheShooter == true {
                
                
                // Now we can draw the pin, if the coordinates are in the image view, if not give the user a notification
                //Find coordinates of image view
                //var frm: CGRect = floorPlanImageView.frame
                
                //if (frm.origin.x <= positionArray[0] <= frm.size.width) {
                // if (frm.origin.y <= positionArray[1] <= frm.size.height) {
                // Then the point is within the uiimage view
                
                
                
                if (alreadyMade == false) {
                    let image = UIImage(named: "pin")
                    pinImageView = UIImageView(image: image!)
                    pinImageView.frame = CGRect(x: positionArray[0] - 25, y: positionArray[1] - 25, width: 50, height: 50)
                    view.addSubview(pinImageView)
                    
                    alreadyMade = true
                }
                    
                else {
                    pinImageView.frame = CGRect(x: positionArray[0] - 25, y: positionArray[1] - 25, width: 50, height: 50)
                    view.addSubview(pinImageView)
                }
                
                // }
                
                
                // else {
                // Make notification
                // }
                
                pressedPlaceTheShooter = false
                
            }
            
            if pressedPlaceUserLocation == true {
                
                // Now we can draw the pin, if the coordinates are in the image view, if not give the user a notification
                //Find coordinates of image view
                //var frm: CGRect = floorPlanImageView.frame
                
                //if (frm.origin.x <= positionArray[0] <= frm.size.width) {
                // if (frm.origin.y <= positionArray[1] <= frm.size.height) {
                // Then the point is within the uiimage view
                
                
                
                if (alreadyMadeUser == false) {
                    let whitePin = UIImage(named: "userPin")
                    pinImageViewUser = UIImageView(image: whitePin!)
                    pinImageViewUser.frame = CGRect(x: positionArray[0] - 25, y: positionArray[1] - 25, width: 50, height: 50)
                    view.addSubview(pinImageViewUser)
                    
                    alreadyMadeUser = true
                }
                    
                else {
                    pinImageViewUser.frame = CGRect(x: positionArray[0] - 25, y: positionArray[1] - 25, width: 50, height: 50)
                    view.addSubview(pinImageViewUser)
                }
                
                // }
                
                
                // else {
                // Make notification
                // }
                
                pressedPlaceUserLocation = false
            }
        }
        
    }
}


