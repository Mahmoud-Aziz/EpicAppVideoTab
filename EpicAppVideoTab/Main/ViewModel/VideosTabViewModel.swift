//
//  VideosTabViewModel.swift
//  EpicAppVideoTab
//
//  Created by Mahmoud Aziz on 27/10/2021.
//

import Foundation

class VideosTabViewModel {
    
    static func HeaderViewTitle(headerView: HeaderView, indexPath: IndexPath, titles: [Title]) -> String {
        
        headerView.title = {
            switch indexPath.section {
            case 1:
                return titles[0].firstSectionTitle
            case 2:
                return titles[0].secondSectionTitle
            case 3:
                return titles[0].thirdSectionTitle
            case 4:
                return titles[0].fourthSectionTitle
            case 5:
                return titles[0].fifthSectionTitle
            case 6:
                return titles[0].sixthSectionTitle
            case 7:
                return titles[0].seventhSectionTitle
            case 8:
                return titles[0].eightsSectionTitle
            case 9:
                return titles[0].ninethSectionTitle
            default:
                return titles[0].defaultTitle
            }
        }()
        return headerView.title!
    }
}


struct Title {
    let firstSectionTitle: String
    let secondSectionTitle: String
    let thirdSectionTitle: String
    let fourthSectionTitle: String
    let fifthSectionTitle: String
    let sixthSectionTitle: String
    let seventhSectionTitle: String
    let eightsSectionTitle: String?
    let ninethSectionTitle: String?
    let defaultTitle = ""
}
