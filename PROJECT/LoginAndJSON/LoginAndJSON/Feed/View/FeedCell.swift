import UIKit

class FeedCell: UITableViewCell {

    // MARK: UI
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var idLB: UILabel!
    @IBOutlet weak var contentsLB: UILabel!
    
    
    // MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
