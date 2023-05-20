//
//  ViewController.swift
//  ViewCloneCoding1
//
//  Created by 조영준 on 2023/05/19.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "mainLogo")
<<<<<<< HEAD
    }
    let label = UILabel().then {
        $0.text = "대학생활을 더 편하고 즐겁게"
        $0.textColor = .gray
    }
    let nameLabel = UILabel().then {
        $0.text = "에브리타임"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.textColor = UIColor(named: "baseColor")
    }
    let idTextField = UITextField().then {
        $0.backgroundColor = UIColor(named: "textFieldColor")
        $0.attributedPlaceholder = NSAttributedString(string: "    아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        $0.layer.cornerRadius = 24
    }
    let passwordTextField = UITextField().then {
        $0.backgroundColor = UIColor(named: "textFieldColor")
        $0.attributedPlaceholder = NSAttributedString(string: "    비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        $0.layer.cornerRadius = 24
    }
    let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "baseColor")
        $0.setTitle("에브리타임 로그인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 24
    }
    let searchButton = UIButton(type: .system).then {
        $0.backgroundColor = .clear
        $0.setTitle("아이디/비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    let signupButton = UIButton(type: .system).then {
        $0.backgroundColor = .clear
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }
    
    func addSubView() {
        self.view.addSubview(label)
        self.view.addSubview(nameLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signupButton)
        self.view.addSubview(searchButton)
        self.view.addSubview(imageView)
    }

    func makeConstraints() {
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(270)
        }
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.label).inset(20)
        }
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.nameLabel).inset(70)
            $0.left.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.idTextField).inset(55)
            $0.left.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.passwordTextField).inset(55)
            $0.left.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        searchButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.loginButton).inset(70)
            $0.left.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        signupButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.searchButton).inset(40)
            $0.left.equalToSuperview().inset(50)
            $0.height.equalTo(50)
        }
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view).inset(170)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
    }
=======
        }
        let label = UILabel().then {
            $0.text = "대학생활을 더 편하고 즐겁게"
            $0.textColor = .gray
        }
        let nameLabel = UILabel().then {
            $0.text = "에브리타임"
            $0.font = UIFont.boldSystemFont(ofSize: 25)
            $0.textColor = UIColor(named: "baseColor")
        }
        let idTextField = UITextField().then {
            $0.backgroundColor = UIColor(named: "textFieldColor")
            $0.attributedPlaceholder = NSAttributedString(string: "    아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
            $0.layer.cornerRadius = 24
        }
        let passwordTextField = UITextField().then {
            $0.backgroundColor = UIColor(named: "textFieldColor")
            $0.attributedPlaceholder = NSAttributedString(string: "    비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
            $0.layer.cornerRadius = 24
        }
        let loginButton = UIButton().then {
            $0.backgroundColor = UIColor(named: "baseColor")
            $0.setTitle("에브리타임 로그인", for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            $0.layer.cornerRadius = 24
        }
        let searchButton = UIButton().then {
            $0.backgroundColor = .clear
            $0.setTitle("아이디/비밀번호 찾기", for: .normal)
            $0.setTitleColor(UIColor.lightGray, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        }
        let signupButton = UIButton().then {
            $0.backgroundColor = .clear
            $0.setTitle("회원가입", for: .normal)
            $0.setTitleColor(UIColor.black, for: .normal)
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            label1()
            nameLabel1()
            idTextField1()
            passwordTextField1()
            loginButton1()
            searchButton1()
            signupButton1()
            imageView1()
        }
        
        func label1() {
            self.view.addSubview(label)
            label.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().inset(270)
            }
        }
        func nameLabel1() {
            self.view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.label).inset(20)
            }
        }
        func idTextField1() {
            self.view.addSubview(idTextField)
            idTextField.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.nameLabel).inset(70)
                $0.left.equalToSuperview().inset(50)
                $0.height.equalTo(50)
            }
        }
        func passwordTextField1() {
            self.view.addSubview(passwordTextField)
            passwordTextField.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.idTextField).inset(55)
                $0.left.equalToSuperview().inset(50)
                $0.height.equalTo(50)
            }
        }
        func loginButton1() {
            self.view.addSubview(loginButton)
            loginButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.passwordTextField).inset(55)
                $0.left.equalToSuperview().inset(50)
                $0.height.equalTo(50)
            }
        }
        func searchButton1() {
            self.view.addSubview(searchButton)
            searchButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.loginButton).inset(70)
                $0.left.equalToSuperview().inset(50)
                $0.height.equalTo(50)
            }
        }
        func signupButton1() {
            self.view.addSubview(signupButton)
            signupButton.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.searchButton).inset(40)
                $0.left.equalToSuperview().inset(50)
                $0.height.equalTo(50)
            }
        }
        func imageView1() {
            self.view.addSubview(imageView)
            imageView.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(self.view).inset(170)
                $0.width.equalTo(100)
                $0.height.equalTo(100)
            }
        }
>>>>>>> git
}

