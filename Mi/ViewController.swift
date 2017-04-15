//
//  ViewController.swift
//  Mi
//
//  Created by Syed Askari on 15/04/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mergeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mergeImage.image = self.mergedImageWith(frontImage: UIImage.init(named: "image2.png"), backgroundImage: UIImage.init(named: "image1.png"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mergedImageWith(frontImage:UIImage?, backgroundImage: UIImage?) -> UIImage{
        
        if (backgroundImage == nil) {
            return frontImage!
        }
        
        let size = self.view.frame.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        backgroundImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        frontImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height).insetBy(dx: size.width * 0.2, dy: size.height * 0.2))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }


}

