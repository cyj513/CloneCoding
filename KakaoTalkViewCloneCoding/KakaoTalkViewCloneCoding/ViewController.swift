
import UIKit
import Then
import SnapKit

class ViewController: UIViewController {
    
    var images: [UIImage] = [
        UIImage(named: "1")!
    ]
    
    
    let tableView = UITableView().then {
        $0.backgroundColor = .systemBackground
        $0.allowsSelection = true
        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    let plusButton = UIButton(type: .system).then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    let chattingLabel = UILabel().then {
        $0.text = "채팅"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    let searchButton = UIButton(type: .system).then {
        $0.setTitle("s", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    let settingButton = UIButton(type: .system).then {
        $0.setTitle("s", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 90
        plusButton.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(nextPageButton), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }
    func addSubView() {
      [
        tableView,
        searchButton,
        plusButton,
        settingButton,
        chattingLabel
      ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.view).inset(90)
            $0.bottom.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        searchButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(80)
            $0.top.equalToSuperview().inset(30)
        }
        plusButton.snp.makeConstraints {
            $0.right.equalTo(searchButton.snp.left).inset(60)
            $0.top.equalToSuperview().inset(30)
        }
        settingButton.snp.makeConstraints {
            $0.right.equalTo(plusButton.snp.left).inset(60)
            $0.top.equalToSuperview().inset(30)
        }
        chattingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.left.equalToSuperview().inset(25)
        }
    }
    
    @objc func didClickButton() {
        let images2 = UIImage(named: "1")!
        images.append(images2)
        tableView.reloadData()
    }
    @objc func nextPageButton() {
        self.navigationController?.pushViewController(NViewController(), animated: true)
        }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView coul no dequeue a CustomCell in ViewController")
        }
        let image = self.images[indexPath.row]
        cell.configure(with: image, and: "조영준")
        return cell
    }
    
    //스와이프해서 삭제
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            tableView.beginUpdates()
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    //여기까지
}
