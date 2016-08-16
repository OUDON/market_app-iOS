import UIKit
import WebImage

class CategoryCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func update(withCategory category: Category) {
        nameLabel.text = category.name
        thumbnailImageView.sd_setImageWithURL(category.imageURL)
    }
    
    static let height: CGFloat = 96
}
