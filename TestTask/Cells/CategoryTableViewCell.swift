//
//  CategoryTableViewCell.swift
//  TestTask
//
//  Created by Vardan Sargsyan on 14.03.22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell{

    @IBOutlet weak var itemsCollectionView: UICollectionView!
    

    var items = [Item]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemsCollectionView.allowsMultipleSelection = true
    }


}


extension CategoryTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath ) as! ItemCollectionViewCell
        cell.setData(item: items[indexPath.row])
            return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath) {
                collectionView.deselectItem(at: indexPath, animated: true)
                return false
            }
        }
        return true
    }
    
    
    
}
