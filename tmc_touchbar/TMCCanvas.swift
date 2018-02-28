import Cocoa

class TMCCanvas: NSImageView {
    @objc var timer:Timer? = nil

    @objc var imageLoaded:Bool = false;

    @objc var xPosition: CGFloat = -680 {
        didSet {
            self.frame = CGRect(x: xPosition, y: 0, width: 680, height: 30)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        self.animates = true
        
        if(self.timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.move), userInfo: nil, repeats: true)
        }

        self.image = NSImage(named: NSImage.Name(rawValue: "tmc.png"))
        self.canDrawSubviewsIntoLayer = true
        self.frame = CGRect(x: xPosition, y: 0, width: 680, height: 30)
    }
    
    override func touchesBegan(with event: NSEvent) {
        // Calling super causes the cat to jump back to its original position 🤔
        //super.touchesBegan(with: event)
    }
    
    override func didAddSubview(_ subview: NSView) {
        
    }
    
    @objc public func move() {
        if (xPosition < 0) {
            xPosition += 1
        }
    }

    override func touchesMoved(with event: NSEvent) {
        if #available(OSX 10.12.2, *) {
            let current = event.allTouches().first?.location(in: self).x ?? 0
            let previous = event.allTouches().first?.previousLocation(in: self).x ?? 0
        
            let dX = (current - previous)
            
            xPosition += dX
        } else {
            // Fallback on earlier versions
        }
    }
    
}
