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

    let action1 = UIAction { [unowned self] (action) in
      let controller = PresentedViewController()
      self.present(controller, animated: true, completion: nil)
    }

    let action2 = UIAction { [unowned self] (action) in
      let controller = PushedViewController()
      self.navigationController?.pushViewController(controller, animated: true)
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

    stackView.frame = .init(x: 0, y: 0, width: 100, height: 200)

    stackView.center = view.center

  }

}

let images: [UIImage] = [
  UIImage(named: "dog")!,
  UIImage(named: "s")!,
  UIImage(named: "m")!,
  UIImage(named: "l")!,
]

class PresentedViewController: UIViewController {

  init() {
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = .currentContext

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    let image = images.randomElement()
    let imageView1 = UIImageView(image: image)
    imageView1.frame = view.bounds

    view.addSubview(imageView1)

//    let image1 = UIImage(named: "dog")
//    let image2 = UIImage(named: "s")
//    let image3 = UIImage(named: "m")
//    let image4 = UIImage(named: "l")
//    let imageView1 = UIImageView(image: image1)
//    let imageView2 = UIImageView(image: image2)
//    let imageView3 = UIImageView(image: image3)
//    let imageView4 = UIImageView(image: image4)
//    imageView1.frame = .init(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView2.frame = .init(x: view.bounds.width/2, y: 0, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView3.frame = .init(x: 0, y: view.bounds.height/2, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView4.frame = .init(x: view.bounds.width/2, y: view.bounds.height/2, width: view.bounds.width/2, height: view.bounds.height/2)
//
//    view.addSubview(imageView1)
//    view.addSubview(imageView2)
//    view.addSubview(imageView3)
//    view.addSubview(imageView4)

    let action1 = UIAction { [unowned self] (action) in
      let controller = PresentedViewController()
      self.present(controller, animated: true, completion: nil)
    }

    let button = UIButton()
    button.setTitle("present", for: .normal)
    button.setTitleColor(.darkText, for: .normal)
    button.sizeToFit()
    button.backgroundColor = .white

    button.addAction(action1, for: .touchUpInside)
    button.center = view.center

    view.addSubview(button)

    let action2 = UIAction { [unowned self] (action) in
      self.dismiss(animated: true, completion: nil)
    }

    let button2 = UIButton()
    button2.setTitle("dismiss", for: .normal)
    button2.setTitleColor(.darkText, for: .normal)
    button2.sizeToFit()
    button2.backgroundColor = .white

    button2.addAction(action2, for: .touchUpInside)
    button2.center = .init(x: view.center.x, y: view.center.y + 40)

    view.addSubview(button2)


  }

}

class PushedViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    let image = images.randomElement()
    let imageView1 = UIImageView(image: image)
    imageView1.frame = view.bounds

    view.addSubview(imageView1)

//    let image1 = UIImage(named: "dog")
//    let image2 = UIImage(named: "s")
//    let image3 = UIImage(named: "m")
//    let image4 = UIImage(named: "l")
//    let imageView1 = UIImageView(image: image1)
//    let imageView2 = UIImageView(image: image2)
//    let imageView3 = UIImageView(image: image3)
//    let imageView4 = UIImageView(image: image4)
//    imageView1.frame = .init(x: 0, y: 0, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView2.frame = .init(x: view.bounds.width/2, y: 0, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView3.frame = .init(x: 0, y: view.bounds.height/2, width: view.bounds.width/2, height: view.bounds.height/2)
//    imageView4.frame = .init(x: view.bounds.width/2, y: view.bounds.height/2, width: view.bounds.width/2, height: view.bounds.height/2)
//
//    view.addSubview(imageView1)
//    view.addSubview(imageView2)
//    view.addSubview(imageView3)
//    view.addSubview(imageView4)

    let action1 = UIAction { [unowned self] (action) in
      let controller = PushedViewController()
      self.navigationController?.pushViewController(controller, animated: true)
    }

    let button = UIButton()
    button.setTitle("push", for: .normal)
    button.setTitleColor(.darkText, for: .normal)
    button.sizeToFit()
    button.backgroundColor = .white

    button.addAction(action1, for: .touchUpInside)
    button.center = view.center

    view.addSubview(button)

    let action2 = UIAction { [unowned self] (action) in
      self.navigationController?.popViewController(animated: true)
    }

    let button2 = UIButton()
    button2.setTitle("pop", for: .normal)
    button2.setTitleColor(.darkText, for: .normal)
    button2.sizeToFit()
    button2.backgroundColor = .white

    button2.addAction(action2, for: .touchUpInside)
    button2.center = .init(x: view.center.x, y: view.center.y + 40)

    view.addSubview(button2)

  }

}

