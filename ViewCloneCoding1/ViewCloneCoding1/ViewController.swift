//
//  ViewController.swift
//  ViewCloneCoding1
//
//  Created by 조영준 on 2023/05/19.
//

import UIKit
import SnapKit
import Then
import Alamofire

class ViewController: UIViewController {
    let httpClient = HTTPClient()
    
    let imageView = UIImageView().then {
        $0.image = UIImage(named: "mainLogo")
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
        $0.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 24
    }
    let passwordTextField = UITextField().then {
        $0.backgroundColor = UIColor(named: "textFieldColor")
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.layer.cornerRadius = 24
    }
    //    let nameTextField = UITextField().then {
    //        $0.backgroundColor = UIColor(named: "textFieldColor")
    //        $0.attributedPlaceholder = NSAttributedString(string: "이름", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    //        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
    //        $0.leftViewMode = .always
    //        $0.layer.cornerRadius = 24
    //    }
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
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
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
        //        self.view.addSubview(nameTextField)
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
        //        nameTextField.snp.makeConstraints {
        //            $0.centerX.equalToSuperview()
        //            $0.top.equalTo(self.passwordTextField).inset(55)
        //            $0.left.equalToSuperview().inset(50)
        //            $0.height.equalTo(50)
        //        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            //            $0.top.equalTo(self.nameTextField).inset(55)
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
    @objc func didClickLoginButton() {
        guard let id = idTextField.text,
              let password = passwordTextField.text else {
            return
        }

        login(id: id , password: password)
    }
}

extension ViewController {
    func login(id: String, password: String) {
        print("통신함")
        httpClient.post(
            url: "/user/login",
            parmas: [
                "account_id": id,
                "password": password
            ],
            header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                let decorder = JSONDecoder()
                do {
                    let data = try decorder.decode(LoginModel.self, from: res.data!)
                    print("로그인 성공")
                    print(data.access_token)
                    print(data.refresh_token)
                } catch {
                    print("로그인 실패")
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
    }
}
}
