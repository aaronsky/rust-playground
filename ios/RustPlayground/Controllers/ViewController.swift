import UIKit

class ViewController: UIViewController {
    @IBOutlet var rustLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rustLabel.text = ""
    }
}

