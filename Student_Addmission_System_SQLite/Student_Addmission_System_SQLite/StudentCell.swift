

import UIKit

class StudentCell: UITableViewCell {

    private let myLable:UILabel={
        let label = UILabel()
        label.font = .boldSystemFont(ofSize:22)
        return label
    }()
    
    func setupNameCellWith(employee stud: Student){
        contentView.addSubview(myLable)
        myLable.frame=CGRect(x: 20 , y: 20, width: 200, height:40)
        myLable.text=stud.name
    }
}
