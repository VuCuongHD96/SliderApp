//
//  AllowNotificationTutorialViewController.swift
//  SliderApp
//
//  Created by Sun on 11/11/2022.
//

import UIKit

class AllowNotificationTutorialViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Property
    var viewModel: AllowNotificationTutorialViewModel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDataWhenDownloadDone()
    }
    
    // MARK: - View
    private func setupView() {
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Data
    private func getCurrentRow() -> Int {
        for cell in collectionView.visibleCells {
            if let row = collectionView.indexPath(for: cell)?.item {
                return row
            }
        }
        return 0
    }
    
    @objc private func setupSlider() {
        scrollToItem(calculator: +)
    }
    
    private func setupDataWhenDownloadDone() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(setupSlider), userInfo: nil, repeats: true)
        collectionView.reloadData()
    }
    
    // MARK: - Action
    private func scrollToItem(calculator: (Int, Int) -> Int) {
        let maxCount = viewModel.imageDataDictionary.count
        var currentRow = getCurrentRow()
        currentRow = calculator(currentRow, 1)
        currentRow = currentRow % maxCount
        let toIndexPath = IndexPath(row: currentRow, section: 0)
        collectionView.scrollToItem(at: toIndexPath, at: .centeredVertically, animated: true)
    }
}

extension AllowNotificationTutorialViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageStringItem = viewModel.imageStringArray[indexPath.row]
        let imageData = viewModel.imageDataDictionary[imageStringItem]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        cell.setContent(image: imageData)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageDataDictionary.count
    }
}

extension AllowNotificationTutorialViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
