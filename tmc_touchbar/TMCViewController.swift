import Cocoa

class TMCViewController: NSViewController , NSTouchBarDelegate{
  
  @IBOutlet weak var bkg: NSView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.wantsLayer = true
  }
  
  override func viewWillAppear() {
    bkg.layer?.backgroundColor = NSColor(red:0.08, green:0.31, blue:0.55, alpha:1.00).cgColor
    
  }

  override var representedObject: Any? {
    didSet {
    }
  }

}

