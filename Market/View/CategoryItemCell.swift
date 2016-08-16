import UIKit
import WebImage

class CategoryItemCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func update(withItem item: Item) {
        nameLabel.text = item.name
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }
}
