import UIKit

enum SwiftySideBarType {
    case standard
    case memo
    case custom
}

public enum GestureType {
    case pan
    case longGesture
}

@objc protocol SwiftySideBarDelegate {
    @objc optional func viewDidDrag(_ sender: UIView)
    @objc optional func viewEndDrag(_ sender: UIView)
}

@available(iOS 14.0,*)
open class SwiftycSideBar: UIView {
    
    var viewType: SwiftySideBarType?
    weak var delegate: SwiftySideBarDelegate?
    open var duration: TimeInterval = 0.1
    open var isEnabled: Bool = true {
        didSet {
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGesture()
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout
    private func setupView() {
        //baseView
        addSubview(baseView)
        baseView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        //sideBar
        baseView.addSubview(sideBar)
        sideBar.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        sideBar.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        
    }
    
    var panGesture: UIPanGestureRecognizer {
        return UIPanGestureRecognizer(target: self, action: #selector(drag))
    }
    
    var longGesture: UILongPressGestureRecognizer {
        return UILongPressGestureRecognizer(target: self, action: #selector(longPress))
    }
    
    
    private func setupGesture() {
        self.addGestureRecognizer(panGesture)
        self.addGestureRecognizer(longGesture)
    }
    
    
    //MARK: Executed Gesture
    @objc func drag(_ sender: UIPanGestureRecognizer) {
        sender.translation(in: self)
        
        switch sender.state {
        case .began:
            print("began")
            panGesture.setTranslation(.zero, in: self)
        case .ended:
            print("ended")
            
        default:
            print("ended")
        }
    }
    
    @objc func longPress(_ sender: UILongPressGestureRecognizer) {
        print("Long Press")
        
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIPanGestureRecognizer) -> Bool {
        let velocity = gestureRecognizer.velocity(in: baseView)
        return abs(velocity.y) > abs(velocity.x)
    }
    //MARK: UI👽
    lazy var baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .red
        return view
    }()
    
    lazy var sideBar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
}
extension UIPanGestureRecognizer {
    func translateView(view: UIView) {
        let translation = self.translation(in: view)
        let xAxis = view.center.x + translation.x
        let yAxis = view.center.y + translation.y
        view.center = CGPoint(x: xAxis, y: yAxis)
        setTranslation(.zero, in: view)
    }
}
