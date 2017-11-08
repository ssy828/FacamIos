//
//  SYCalendar.swift
//  MyCalendar

import UIKit
// 외부에서 보여지게 할 것이므로
// 스토리보드, 코드 가능!
// 내부적으로 코드로 만들 것
class SYCalendar: UIView {

    // MARK: 프로퍼티
    
    // 외부에서 받을 데이터
    var data: Data?
    
    // 컬렉션 뷰: 외부에서 건들 수 없음 -> 클로저 형태
    // 컬렉션 뷰 인스턴스만 생성
    private var contentView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 혹시 몰라서 수직으로 함
        // 한 화면이므로 스크롤이 안되는 것이 좋음 -> 막아두기
        
        // frame : 오토레이아웃으로 쓸 것이므로 필요없다
        // init할때 self가 아직 만들어지지 않음
       let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        
        // 콜렉션 뷰 속성 추가 기능
//        collection.delegate = self
//        // 셀프가 아직 초기화 전이기때문에
//        self.addsubView // 이것도 불가능!
        collection.backgroundColor = .clear
        
        return collection
    }()
    
    // 셀의 ID
    private let cellID = "cell"
    
    override func awakeFromNib() {
        // init 부분이나 이쪽에 만들 것
        setUpUI()
        // updateLayout( ) 이곳에서 실행해도 됨 대신
        // setUpUI() 안에 있는 것을 지우기
    }
    
    // MARK: init
    // 코드용
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    // 스토리보드용!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI() // 둘의 용도가 그때 그때 다르므로
    }
    
    
  
}

// MARK: Delegate
extension SYCalendar : UICollectionViewDelegate
{
  
    // MARK: UI관련 준비하는 곳
   private func setUpUI()
    {
        self.addSubview(contentView) // 컬렉션뷰 추가
        contentView.delegate = self
        contentView.dataSource = self
        
        // 등록해야함!
        contentView.register(CustomCell.self, forCellWithReuseIdentifier: cellID)
    
        // 만들어지고 난 다음에 실행
        updateLayout()
        // 이상태로는 불가능함! translatesAutoresizingMaskIntoConstraints 필요!
        
    }
    
    // MARK: 컬렉션뷰의 레이아웃잡기
    private func updateLayout( )
    {

        contentView.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0 )
        // self: SYCalendar
        
    }
    
}

// MARK: DataSource

extension SYCalendar : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCell
        cell.titleLb.text = "\(indexPath.row)"
        
        return cell
    }
    
}

// MARK: 컬렉션 뷰에 올릴 라벨?
class CustomCell: UICollectionViewCell
{
    // awakeFromNib이 일어날 필요 없음. 자동적으로 만들어지므로
    
    // 클로저 -> 내부에서 바로 쓸 것이므로
    // 연산 프로퍼티: 외부에서 불리는 것이므로 안됨
    var titleLb: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        
    }
    // MARK: addSubview먼저하고
    // 오토레이아웃 잡기!
    private func setUpUI()
    {
        self.addSubview(titleLb) // 라벨추가
        updateLBLayout( )
    }
    
    // MARK: 라벨 레이아웃잡기
    private func updateLBLayout( )
    {

        titleLb.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0 )
        // self: CustomCell
    }

    // 스토리보드용!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: 간격? 구하는 메소드
extension UIView
{
    // MARK: constraint메소드 
    func constraint(targetView: UIView, topConstant: CGFloat?, bottomConstant: CGFloat?, leftConstant: CGFloat?, rightConstant: CGFloat? )
    {
        self.translatesAutoresizingMaskIntoConstraints = false
        // 오토레이아웃 적용
        
        if let constant = topConstant{
            self.topAnchor.constraint(equalTo: self.topAnchor, constant: constant).isActive = true
        }
        if let constant = rightConstant{
            self.rightAnchor.constraint(equalTo: self.rightAnchor, constant: constant).isActive = true
        }
        if let constant = bottomConstant{
            self.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constant).isActive = true
        }
        if let constant = leftConstant{
            self.leftAnchor.constraint(equalTo: self.leftAnchor, constant: constant).isActive = true
        }
    }
}
