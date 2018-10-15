/// Copyright 2012-2018 (C) Butterfly Network, Inc.

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(didPressLogin(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override var inputAccessoryView: UIView? {
        return loginButton
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.becomeFirstResponder()
    }

    @objc
    func didPressLogin(_ sender: Any) {
        guard
            !(usernameField.text ?? "").isEmpty,
            !(passwordField.text ?? "").isEmpty
        else { return }

        performSegue(withIdentifier: "showDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetail" else { return super.prepare(for: segue, sender: sender) }

        if let destination = segue.destination as? DetailViewController {
            destination.detailItem = usernameField?.text
        }
    }

}

