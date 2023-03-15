//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI556 on 2023/03/15.
//

import UIKit

class BigImageViewController: UIViewController {
    var image : String = ""
    @IBOutlet weak var bigImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像を設定
        //let sampleImage = UIImage(named: image)
        let sampleImage = UIImage(named: image)
        bigImage.image = sampleImage
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
