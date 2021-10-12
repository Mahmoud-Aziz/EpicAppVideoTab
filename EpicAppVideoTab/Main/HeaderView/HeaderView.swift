//
//  HeaderView.swift
//  EpicAppVideoTab
//
//  Created by Mahmoud Aziz on 12/10/2021.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
}
