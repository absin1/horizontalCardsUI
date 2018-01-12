//
//  ViewController.swift
//  horizontalCardsUI
//
//  Created by absin on 1/11/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    @IBOutlet weak var cards: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cards.dequeueReusableCell(withReuseIdentifier: "quote", for: indexPath)
        return cell
    }
    

    override func viewDidLoad() {
        cards.delegate = self
        cards.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth:Float = Float(scrollView.frame.width)
        let currentOffset:Float = Float(scrollView.contentOffset.x)
        print(currentOffset)
        let targetOffset:Float = Float(targetContentOffset.pointee.x)
        print(targetOffset)
        var newTargetOffset:Float = 0
        if(targetOffset>currentOffset){
            newTargetOffset = ceilf(currentOffset/pageWidth)*pageWidth;
        } else {
            newTargetOffset = floorf(currentOffset/pageWidth)*pageWidth
        }
        if(newTargetOffset<0){
            newTargetOffset = 0;
        } else if(newTargetOffset>Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        targetContentOffset.pointee.x = CGFloat(currentOffset)
        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: 0), animated: true)
    }
}

