//
//  ViewController.swift
//  page control, segmented control, button & gesture
//
//  Created by Wei Pan on 2022/5/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let images = ["MacBook Air", "MacBook Pro 13", "MacBook Pro 14"]
    let names = ["MacBook Air", "MacBook Pro 13", "MacBook Pro 14"]
    let introduceLabels = [
        "Apple M1 晶片 / 8 核心CPU / 最多可達 8 核心GPU / 最多可達 16GB 統一記憶體 / 2TB(最多可訂製的儲存空間) / 13.3 吋 Retina 顯示器 / 最長可達 18 小時電池使用時間 / 720p FaceTime HD 相機 / 1.29 公斤 重量 / Touch ID",
        "Apple M1 晶片 / 8 核心CPU / 8 核心GPU / 最多可達 16GB 統一記憶體 / 2TB(最多可訂製的儲存空間) / 13.3 吋 Retina 顯示器 / 最長可達 20 小時電池使用時間 / 720p FaceTime HD 相機 / 1.4 公斤 重量 / 觸控列和 Touch ID",
        "Apple M1 Pro 晶片或 Apple M1 Max 晶片 / 最多可達 10 核心CPU / 最多可達 32 核心GPU / 最多可達 64GB 統一記憶體 / 8TB(最多可訂製的儲存空間) / 14.2 吋或 16.2 吋 Liquid Retina XDR 顯示器 / 最長可達 21 小時電池使用時間 / 720p FaceTime HD 相機 / 1.6 公斤或 2.1 公斤 重量 / Touch ID"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background()
    }
    
    func change(){
        segment.selectedSegmentIndex = index
        productImageView.image = UIImage(named: images[index])
        name.text = names[index]
        introduceLabel.text = introduceLabels[index]
        pageControl.currentPage = index
    }
    
    @IBAction func selectSegment(_ sender: Any) {
        index = segment.selectedSegmentIndex
        change()
    }
    @IBAction func pre(_ sender: Any) {
        index = ( index + images.count - 1 ) % images.count
        change()
    }
    
    @IBAction func next(_ sender: Any) {
        index = ( index + 1 ) % images.count
        change()
    }
    
    @IBAction func pageControl(_ sender: Any) {
        index = pageControl.currentPage
        change()
    }
    
    func background(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
        gradientLayer.colors = [
            CGColor(red: 1, green: 1, blue: 1, alpha: 1),
            CGColor(red: 248/255, green: 248/255, blue: 1, alpha: 1),
            CGColor(red: 204/255, green: 229/255, blue: 1, alpha: 1)
        ]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

