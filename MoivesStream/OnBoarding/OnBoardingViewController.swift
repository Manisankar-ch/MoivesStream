//
//  ViewController.swift
//  MoivesStream
//
//  Created by Mani Sankar on 06/07/24.
//

import UIKit

class OnBoardingViewController: UIViewController {
@IBOutlet weak var nextButton: UIButton!
@IBOutlet weak var pageControl: UIPageControl!
@IBOutlet weak var collectionView: UICollectionView!

    var colors: [UIColor] = [.red,.green,.gray, .black]
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == colors.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = colors.count
        
        collectionView.register(UINib(nibName: "OnBoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCollectionViewCell")
               
    }
    
    @IBAction func actionOnLogin(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(identifier: "NVC") as! UINavigationController
         controller.modalPresentationStyle = .fullScreen
         controller.modalTransitionStyle = .flipHorizontal
         present(controller, animated: true, completion: nil)
    }
    
    @IBAction func actionOnNextButton(_ sender: UIButton) {
        if currentPage == colors.count - 1,
           let controller = storyboard?.instantiateViewController(identifier: "NVC") as? UINavigationController {
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}
extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell", for: indexPath) as! OnBoardingCollectionViewCell
        cell.setCellData(color: colors[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
