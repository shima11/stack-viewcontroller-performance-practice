//
//  ViewController1.swift
//  presented-viewcontroller-performance-practice
//
//  Created by jinsei_shima on 2020/11/25.
//


import UIKit

// UIPopoverPresentationControllerの実験

class ViewController1: UIViewController {

  let button = UIButton(type: .system)

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(button)

    if #available(iOS 14.0, *) {
      button.addAction(.init(handler: { (action) in

        let actionController = ContentViewController()
        actionController.preferredContentSize = .init(width: 100, height: 100)
        actionController.modalPresentationStyle = .popover

        let tooltip = TooltipView()
        tooltip.frame = .init(x: 0, y: 0, width: 100, height: 100)
        tooltip.backgroundColor = .darkGray
        tooltip.center = .init(x: self.button.center.x, y: self.button.center.y - 100)
        self.view.addSubview(tooltip)

      }), for: .touchUpInside)
    } else {
      // Fallback on earlier versions
    }
    button.setTitle("Button", for: .normal)
    button.setTitleColor(.darkText, for: .normal)
    button.sizeToFit()

    button.center = view.center

  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }
}


class TooltipView: UIView {

  let label = UILabel()

  init() {
    super.init(frame: .zero)

    label.text = "tooltip"
    label.textColor = .white
    addSubview(label)
    label.sizeToFit()

  }

  override func layoutSubviews() {
    super.layoutSubviews()
    label.center = .init(x: bounds.width / 2, y: bounds.height / 2)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
