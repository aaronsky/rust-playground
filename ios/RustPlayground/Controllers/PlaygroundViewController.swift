import UIKit

class PlaygroundViewController: UIViewController {
    
    @IBOutlet var codeView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageView = UIImageView(image: Images.rustLogo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
}
