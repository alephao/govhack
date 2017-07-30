import UIKit

class PrescriptionCell: BaseTableViewCell {
    
    private let circleView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10
        return v
    }()
    
    private let insideCircleView: UIView = {
        let v = UIView()
        v.backgroundColor = .hex(0xcccccc)
        v.layer.cornerRadius = 5
        return v
    }()
    
    private let dateLabel = UILabel.body17ptBlack()
    
    private let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.shadowOpacity = 0.5
        v.layer.shadowColor = UIColor.gray.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 1)
        v.layer.cornerRadius = 4
        return v
    }()
    
    override func initialize() {
        self.selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(circleView)
        circleView.addSubview(insideCircleView)
        
        addSubview(dateLabel)
        addSubview(containerView)
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7).isActive = true
        circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        insideCircleView.translatesAutoresizingMaskIntoConstraints = false
        insideCircleView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor).isActive = true
        insideCircleView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        insideCircleView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        insideCircleView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    public func setup(_ prescription: Prescription) {
        dateLabel.text = prescription.dateIssuedString()
    }
    
}
