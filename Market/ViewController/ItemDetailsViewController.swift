import UIKit
import APIKit

class ItemDetailsViewController: UIViewController {
    var item: Item? = nil
    var itemID: Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let request = ItemRequest(id: itemID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.item = response
                self.update(response)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func update(item: Item) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
        imageView.sd_setImageWithURL(item.imageURL)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
