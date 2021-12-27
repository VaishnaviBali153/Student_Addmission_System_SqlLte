

import UIKit

class MainAdmin: UIViewController {

    private let lbl:UILabel = {
        let labl = UILabel()
        labl.text = "Student System"
        labl.font = UIFont(name: "Cochin", size: 40.0)
        labl.textAlignment = .center
        labl.textColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return labl
    }()
    private let tool:UIToolbar = {
        let tul = UIToolbar()
        let add = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(SearchStud))
        tul.items = [add]
        tul.backgroundColor = .init(red: 0.921, green: 0.941, blue: 0.953, alpha: 0.3)
        tul.clipsToBounds = true
        tul.layer.cornerRadius = 18
        return tul
    }()
    //    private let btn1:UIButton = {
    //        let btnx = UIButton()
    //        btnx.setTitle("Student", for: .normal)
    //        btnx.layer.cornerRadius = 8
    //        btnx.addTarget(self, action: #selector(studentClicked), for: .touchUpInside)
    //        btnx.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
    //        return btnx
    //    }()
    //
    //    private let btn2:UIButton = {
    //        let btnx = UIButton()
    //        btnx.setTitle("Notice", for: .normal)
    //        btnx.layer.cornerRadius = 8
    //        btnx.addTarget(self, action: #selector(noticeClicked), for: .touchUpInside)
    //        btnx.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
    //        return btnx
    //    }()
    private let StudentInfoImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "s1")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.black.cgColor
        imgview.layer.borderWidth = 5
        imgview.tintColor = .white
        return imgview
    }()
    
    private let NoticeBoardImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "n1")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.black.cgColor
        imgview.layer.borderWidth = 5
        imgview.tintColor = .white
        return imgview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbl)
        view.addSubview(tool)
        //        view.addSubview(btn1)
        //        view.addSubview(btn2)
        view.addSubview(StudentInfoImageView)
        view.addSubview(NoticeBoardImageView)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(studentClicked))
        StudentInfoImageView.isUserInteractionEnabled = true
        StudentInfoImageView.addGestureRecognizer(singleTap)
        
        let singleTap1 = UITapGestureRecognizer(target: self, action: #selector(noticeClicked))
        NoticeBoardImageView.isUserInteractionEnabled = true
        NoticeBoardImageView.addGestureRecognizer(singleTap1)
        let additem = UIBarButtonItem(image: UIImage(named: "logout"), style: .plain, target: self, action: #selector(logoutclicked))
        additem.width = 10
        navigationItem.setRightBarButton(additem, animated: true)
        
        view.backgroundColor = .white
        
    }
    @objc private func logoutclicked(){
        UserDefaults.standard.set(false, forKey: "uname")
        UserDefaults.standard.set(false, forKey: "pass")
        UserDefaults.standard.synchronize()
        navigationController?.popToRootViewController(animated: true)
        
    }
    @objc private func SearchStud(){
        let vc = SearchStudVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lbl.frame = CGRect(x: 20, y: Int(view.height/6), width: Int(view.width-40), height: 40)
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 10.0
        tool.frame=CGRect(x: 300, y: 45, width: view.frame.size.width, height: toolBarHeight)
        //        btn1.frame = CGRect(x: 80, y: Int(view.height/4)+140, width: Int(view.width-160), height: 40)
        //        btn2.frame = CGRect(x: 80, y: Int(view.height/4)+240, width: Int(view.width-160), height: 40)
        StudentInfoImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 170, width: 200, height: 200)
        
        NoticeBoardImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 400, width: 200, height: 200)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    @objc private func studentClicked(){
        let vc = MainStudent()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func noticeClicked(){
        let vc = MainNoticeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
