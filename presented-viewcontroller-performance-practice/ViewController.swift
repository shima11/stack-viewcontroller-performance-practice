//
//  ViewController.swift
//  presented-viewcontroller-performance-practice
//
//  Created by jinsei_shima on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let action1 = UIAction { (action) in

      print("action1")
    }
    let action2 = UIAction { (action) in

      print("action2")
    }

    let button1 = UIButton()
    button1.setTitle("present", for: .normal)
    button1.setTitleColor(.darkText, for: .normal)
    button1.addAction(action1, for: .touchUpInside)

    let button2 = UIButton()
    button2.setTitle("push", for: .normal)
    button2.setTitleColor(.darkText, for: .normal)
    button2.addAction(action2, for: .touchUpInside)

    let stackView = UIStackView(arrangedSubviews: [
      button1,
      button2,
    ])
    stackView.axis = .vertical

    view.addSubview(stackView)

    stackView.frame = .init(x: 100, y: 100, width: 100, height: 200)

  }

}

