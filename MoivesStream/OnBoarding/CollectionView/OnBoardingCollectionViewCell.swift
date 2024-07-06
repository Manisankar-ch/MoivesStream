//
//  OnBoardingCollectionViewCell.swift
//  MoivesStream
//
//  Created by Mani Sankar on 06/07/24.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellData(color: UIColor) {
        self.mainView.backgroundColor = color
    }

}
