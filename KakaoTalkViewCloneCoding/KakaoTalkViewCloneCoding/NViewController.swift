//
//  NViewController.swift
//  KakaoTalkViewCloneCoding
//
//  Created by 조영준 on 2023/05/29.
//

import UIKit
import SnapKit
import Then

class NViewController: UIViewController {
    
    let label = UILabel().then {
        $0.text = "하하하하하ㅏ핳"
        $0.textColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    override func viewDidLayoutSubviews() {
        self.view.addSubview(label)
        makeConstraints()
    }
    func makeConstraints() {
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}
