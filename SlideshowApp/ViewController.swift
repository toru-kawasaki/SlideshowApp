//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI556 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playorstopButton: UIButton!
    @IBOutlet weak var progressButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    let imageArray:[String] = ["いか01.png","いか02.jpeg","いか03.png"]
    var index:Int = 0 //画像配列のインデックス
    var timer:Timer! //再生タイマー
    @IBOutlet weak var image: UIImageView!
    @IBAction func progress(_ sender: Any) {
        if(index == 2){
            index = 0
        }
        else {
            index += 1
        }
        // 画像を設定
        outputImage()
    }
    @IBAction func back(_ sender: Any) {
        if(index == 0){
            index = 2
        }
        else {
            index -= 1
        }
        // 画像を設定
        outputImage()
    }
    @objc func updateTimer(_ timer: Timer) {
        if(index == 2){
            index = 0
        }
        else {
            index += 1
        }
        // 画像を設定
        outputImage()
    }
    @IBAction func playorstop(_ sender: Any) {
        // self.timerの有無で再生中・停止中を判断する。停止中であればタイマーをスタートし、ボタンラベルを停止に変更する。
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            playorstopButton.setTitle("停止", for: .normal)
            progressButton.isEnabled = false
            backButton.isEnabled = false
        }
        else {
            self.timer.invalidate() 
            self.timer = nil
            playorstopButton.setTitle("再生", for: .normal)
            progressButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 画像を設定
        outputImage()

    }
    func outputImage(){
        // 画像を設定
        let sampleImage = UIImage(named: imageArray[index])
        image.image = sampleImage
    }
    @IBAction func tapImageAction(_ sender: Any) {
        performSegue(withIdentifier: "toBigImageView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let bigImageViewController:BigImageViewController = segue.destination as! BigImageViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        //bigImageViewController.image = "いか01.png"
        bigImageViewController.image = imageArray[index]
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
}

