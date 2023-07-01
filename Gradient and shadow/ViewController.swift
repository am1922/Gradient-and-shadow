import UIKit

class ViewController: UIViewController {
    var shadowView: UIView!
    var squareView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a shadow view
        shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shadowView)

        // Set constraints for the shadow view
        NSLayoutConstraint.activate([
            shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            shadowView.widthAnchor.constraint(equalToConstant: 100),
            shadowView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Create a square view
        squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.addSubview(squareView)

        // Set constraints for the square view
        NSLayoutConstraint.activate([
            squareView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            squareView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            squareView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Round the corners of the square view
        let cornerRadius = squareView.bounds.width / 6
        squareView.layer.cornerRadius = cornerRadius
        squareView.layer.masksToBounds = true

        // Apply shadow to the shadow view
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowRadius = 4

        // Add gradient to the square view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        squareView.layer.addSublayer(gradientLayer)
    }
}
