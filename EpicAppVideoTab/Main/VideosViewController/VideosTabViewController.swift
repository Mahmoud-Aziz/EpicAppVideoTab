//
//  ViewController.swift
//  EpicAppVideoTab
//
//  Created by Mahmoud Aziz on 12/10/2021.
//


//MARK: Video tap UI using compositional layout collection view.

import UIKit

class VideosTabViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: "HeaderView")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    //MARK: Create UICollectionViewCompositionalLayout Method:
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (index, environ) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, enviroment: environ)
        }
        return layout
    }
    
    //MARK: Create section based on it's index number:
    func createSectionFor(index: Int, enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            return HeaderSection.createHeaderSection()
        case 1...9:
            return createRestOfSections()
        default:
            return createRestOfSections()
        }
    }

    //MARK: Create the rest of sections method:
    func createRestOfSections() -> NSCollectionLayoutSection {
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 8, bottom: 2.5, trailing: 8)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        //Supplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: "header",alignment: .top)
        
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

//MARK: CollectionView datasource methods:
extension VideosTabViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor(hue: drand48(), saturation: 1, brightness: 1, alpha: 1)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    //Header view contains the header title label for each secion based on it's index number.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
            return UICollectionReusableView()
        }

        let titles: [Title] = [Title(firstSectionTitle: "Top Picks: Videos", secondSectionTitle: "Pets", thirdSectionTitle: "Sports", fourthSectionTitle: "Arts, Crafts & DIY", fifthSectionTitle: "Science", sixthSectionTitle: "Adventure", seventhSectionTitle: "Fantasy & Science Fiction", eightsSectionTitle: "Laugh Out Loud", ninethSectionTitle: "Spooky")]

        view.title = VideosTabViewModel.HeaderViewTitle(headerView: view, indexPath: indexPath, titles: titles)
        return view
    }
}



