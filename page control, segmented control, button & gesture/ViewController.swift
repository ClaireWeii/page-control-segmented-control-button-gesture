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
    
    //定義產品圖片的Array
    let images = ["MacBook Air", "MacBook Pro 13", "MacBook Pro 14"]
    //定義產品名稱的Array
    let names = ["MacBook Air", "MacBook Pro 13", "MacBook Pro 14"]
    //定義產品介紹的Array
    let introduceLabels = [
        "Apple M1 晶片 / 8 核心CPU / 最多可達 8 核心GPU / 最多可達 16GB 統一記憶體 / 2TB(最多可訂製的儲存空間) / 13.3 吋 Retina 顯示器 / 最長可達 18 小時電池使用時間 / 720p FaceTime HD 相機 / 1.29 公斤 重量 / Touch ID",
        "Apple M1 晶片 / 8 核心CPU / 8 核心GPU / 最多可達 16GB 統一記憶體 / 2TB(最多可訂製的儲存空間) / 13.3 吋 Retina 顯示器 / 最長可達 20 小時電池使用時間 / 720p FaceTime HD 相機 / 1.4 公斤 重量 / 觸控列和 Touch ID",
        "Apple M1 Pro 晶片或 Apple M1 Max 晶片 / 最多可達 10 核心CPU / 最多可達 32 核心GPU / 最多可達 64GB 統一記憶體 / 8TB(最多可訂製的儲存空間) / 14.2 吋或 16.2 吋 Liquid Retina XDR 顯示器 / 最長可達 21 小時電池使用時間 / 720p FaceTime HD 相機 / 1.6 公斤或 2.1 公斤 重量 / Touch ID"]
    // 先定義當前的索引(頁面)為0
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        background()
    }
    
    //先定義須更換的元件為Function，包含產品圖片、產品名稱、產品介紹、segment、pagecontrol，等等就呼叫行這個Function就好
    func change(){
        segment.selectedSegmentIndex = index
        productImageView.image = UIImage(named: images[index])
        name.text = names[index]
        introduceLabel.text = introduceLabels[index]
        pageControl.currentPage = index
    }
    //用segment切換
    @IBAction func selectSegment(_ sender: Any) {
        index = segment.selectedSegmentIndex
        change()
    }
    //用按鈕切換上一頁(因為右滑Gesture的功能與上一頁按鈕相同，因此共用同段程式)
    @IBAction func pre(_ sender: Any) {
        index = ( index + images.count - 1 ) % images.count
        change()
    }
    //用按鈕切換下一頁(因為左滑Gesture的功能與下一頁按鈕相同，因此共用同段程式)
    @IBAction func next(_ sender: Any) {
        index = ( index + 1 ) % images.count
        change()
    }
    //用pageControl切換
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

