//
//  ViewController.swift
//  DoNotOpen
//
//  Created by Tommy Smale on 11/20/20.
//

import UIKit

//UIInputView
//lower opacity and add blur 

class PasswordViewController: UIViewController {
    
    weak var statusLock : UIImageView!
    weak var enterPasswordLabel : UILabel!
    var circles = [UIImageView]()
    var naturalNumbers = [UIButton]()
    weak var zeroButton : UIButton!
    weak var deleteButton : UIButton!
    
    let passcode : String = "1234"
    var buttonsTapped = 0
    var maxAttempts = 7
    var attempts = 0
    var guess : String = ""
    
    let config = UIImage.SymbolConfiguration(pointSize: 50)
    let circleConfig = UIImage.SymbolConfiguration(pointSize: 25)
    
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let lock = UIImage(systemName: "lock.fill", withConfiguration: config)
        let statusLock = UIImageView(image: lock)
        statusLock.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(statusLock)
        
        NSLayoutConstraint.activate([
            statusLock.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            statusLock.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
        
        self.statusLock = statusLock
        
        let enterPasswordLabel = UILabel()
        enterPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(enterPasswordLabel)
        
        NSLayoutConstraint.activate([
            enterPasswordLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            enterPasswordLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            enterPasswordLabel.topAnchor.constraint(equalTo: statusLock.bottomAnchor, constant: 8),
            enterPasswordLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.enterPasswordLabel = enterPasswordLabel
        
        let circle = UIImage(systemName: "circle", withConfiguration: circleConfig)
        
        for i in 0...3 {
            circles.append(UIImageView(image: circle))
            circles[i].translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(circles[i])
        }
        
        NSLayoutConstraint.activate([
            circles[0].leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            circles[0].topAnchor.constraint(equalTo: enterPasswordLabel.bottomAnchor, constant: 8),
            circles[0].widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.25),
    
            circles[1].leadingAnchor.constraint(equalTo: circles[0].trailingAnchor),
            circles[1].widthAnchor.constraint(equalTo: circles[0].widthAnchor),
            circles[1].firstBaselineAnchor.constraint(equalTo: circles[0].firstBaselineAnchor),
            
            circles[2].leadingAnchor.constraint(equalTo: circles[1].trailingAnchor),
            circles[2].widthAnchor.constraint(equalTo: circles[0].widthAnchor),
            circles[2].topAnchor.constraint(equalTo: circles[0].topAnchor),
            
            circles[3].leadingAnchor.constraint(equalTo: circles[2].trailingAnchor),
            circles[3].widthAnchor.constraint(equalTo: circles[0].widthAnchor),
            circles[3].lastBaselineAnchor.constraint(equalTo: circles[2].lastBaselineAnchor),
            circles[3].trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        for number in 0...8 {
            naturalNumbers.append( UIButton(type: .custom) )
            naturalNumbers[number].translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(naturalNumbers[number])
        }
        
        let topConstraints : [AnyObject] = [circles[0], naturalNumbers[1], naturalNumbers[4]]
        
        var x = 0
        for i in 0...2 {
            x = i + (2*i) + 1
            NSLayoutConstraint.activate([
                //naturalNumbers[0].leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8),
                naturalNumbers[x-1].trailingAnchor.constraint(equalTo: naturalNumbers[x].leadingAnchor, constant: -8),
                naturalNumbers[x-1].topAnchor.constraint(equalTo: naturalNumbers[x].topAnchor),
                naturalNumbers[x-1].bottomAnchor.constraint(equalTo: naturalNumbers[x].bottomAnchor),
                naturalNumbers[x-1].heightAnchor.constraint(equalTo: naturalNumbers[x].heightAnchor),
                naturalNumbers[x-1].widthAnchor.constraint(equalTo: naturalNumbers[x].widthAnchor),
            
                naturalNumbers[x].centerXAnchor.constraint(equalTo: margins.centerXAnchor),
                naturalNumbers[x].topAnchor.constraint(equalTo: topConstraints[i].bottomAnchor, constant: 8),
                naturalNumbers[x].heightAnchor.constraint(equalToConstant: 100),
                naturalNumbers[x].widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.33),

                naturalNumbers[x+1].leadingAnchor.constraint(equalTo: naturalNumbers[x].trailingAnchor, constant: 8),
                //naturalNumbers[2].trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -8),
                naturalNumbers[x+1].topAnchor.constraint(equalTo: naturalNumbers[x].topAnchor),
                naturalNumbers[x+1].bottomAnchor.constraint(equalTo: naturalNumbers[x].bottomAnchor),
                naturalNumbers[x+1].heightAnchor.constraint(equalTo: naturalNumbers[x].heightAnchor),
                naturalNumbers[x+1].widthAnchor.constraint(equalTo: naturalNumbers[x].widthAnchor)
            ])
        }
        
        let zeroButton = UIButton(type: .custom)
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(zeroButton)
        
        NSLayoutConstraint.activate([
            zeroButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            zeroButton.topAnchor.constraint(equalTo: naturalNumbers[7].bottomAnchor, constant: 8),
            zeroButton.heightAnchor.constraint(equalTo: naturalNumbers[7].heightAnchor),
            zeroButton.widthAnchor.constraint(equalTo: naturalNumbers[7].widthAnchor)
        ])
        
        self.zeroButton = zeroButton
        
        let deleteButton = UIButton(type: .custom)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            deleteButton.topAnchor.constraint(equalTo: zeroButton.bottomAnchor, constant: 8),
            deleteButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
        
        self.deleteButton = deleteButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true 
        
        statusLock.contentMode = .scaleAspectFill
                
        enterPasswordLabel.backgroundColor = .white
        enterPasswordLabel.text = "Enter Password"
        enterPasswordLabel.textAlignment = .center
        
        for i in 0...3 {
            circles[i].contentMode = .scaleAspectFit
        }
        
        for number in 0...8 {
            naturalNumbers[number].backgroundColor = .white
            naturalNumbers[number].setTitle(String(number+1), for: .normal)
            naturalNumbers[number].setTitleColor(UIColor.black, for: .normal)
            naturalNumbers[number].addTarget(self, action: #selector(numberTapped), for: .touchDown)
        }
    
        zeroButton.backgroundColor = .white
        zeroButton.showsTouchWhenHighlighted = true
        zeroButton.setTitle("0", for: .normal)
        zeroButton.setTitleColor(UIColor.black, for: .normal)
        zeroButton.addTarget(self, action: #selector(numberTapped), for: .touchDown)
        
        deleteButton.backgroundColor = .white
        deleteButton.setTitle("Backspace", for: .normal)
        deleteButton.setTitleColor(UIColor.black, for: .normal)
        deleteButton.addTarget(self, action: #selector(backspaceTapped), for: .touchDown)

    }

    @objc func numberTapped(sender: UIButton) {
        
        if attempts >= maxAttempts {
            print("Max attempts reached")
            let alert = UIAlertController(title: "Intruder detected", message: "Authorities have been notificed", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if buttonsTapped == 0 {
            statusLock.image = UIImage(systemName: "lock.fill", withConfiguration: config)
            for i in 0..<circles.count {
                circles[i].image = UIImage(systemName: "circle", withConfiguration: circleConfig)
            }
        }
        
        print("User tapped \(String(describing: sender.currentTitle))")

        guess += sender.currentTitle!
        circles[buttonsTapped].image = UIImage(systemName: "circle.fill", withConfiguration: circleConfig)
        buttonsTapped += 1

        if buttonsTapped == passcode.count {
            if(guess == passcode) {
                statusLock.image = UIImage(systemName: "lock.open.fill", withConfiguration: config)
                print("Correct passcode")
                self.navigationController?.pushViewController(ConfidentalViewController(), animated: true)
                //self.present(ConfidentalViewController(), animated: true, completion: nil)
                return 
            }
            attempts += 1
            print("\(guess) is incorrect. \(maxAttempts-attempts) attempts remaining")
            guess = ""
            buttonsTapped = 0
            statusLock.image = UIImage(systemName: "lock.slash.fill", withConfiguration: config)

        }
        
    }

    @objc func backspaceTapped(sender: UIButton) {
        print("Backspace tapped")

        if buttonsTapped == 0 || buttonsTapped == passcode.count {
            return
        }
        guess.remove(at: guess.index(before: guess.endIndex))
        circles[buttonsTapped-1].image = UIImage(systemName: "circle", withConfiguration: circleConfig)
        buttonsTapped -= 1
        
    }
}

