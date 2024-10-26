//
//  HomeViewController.swift
//  MoivesStream
//
//  Created by Mani Sankar on 06/07/24.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var verticalTableView: UITableView!
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    
    @IBOutlet weak var pagerController: UIPageControl!
    
    var videoData: [VideoModel] = []
    var timer: Timer?
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedVideos = MoviesStreamHelper.loadJSON() {
            videoData = loadedVideos
            loadVideoData()
        }
        view.backgroundColor = .white
        verticalTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        horizontalCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        verticalTableView.showsVerticalScrollIndicator = false
        
        if let layout = horizontalCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .zero
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 0
        }
        pagerController.numberOfPages = 5
        loadVideoData()
        startAutoScroll()
    }
    
    func startAutoScroll() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    @objc func autoScroll() {
        let totalItems = horizontalCollectionView.numberOfItems(inSection: 0)

        if totalItems > 0 {
            currentIndex = (currentIndex + 1) % totalItems
            pagerController.currentPage = currentIndex
            let indexPath = IndexPath(item: currentIndex, section: 0)
            horizontalCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

    
    deinit {
        timer?.invalidate()
    }
    
    func loadVideoData() {
        verticalTableView.reloadData()
        horizontalCollectionView.reloadData()
    }
}
