import SwiftUI

class ViewController: UIHostingController<SwiftyView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftyView())
    }
}
