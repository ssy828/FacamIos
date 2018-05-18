//
//  SYCalendar.swift
//  MyCalendar

import UIKit
// 외부에서 보여지게 할 것이므로
// 스토리보드, 코드 가능!
// 내부적으로 코드로 만들 것

// MARK: 프로토콜 생성
@objc protocol SYCalendarDelegate {
    @objc optional func calendar(_ caalendar: SYCalendar, didSelectedDate: Date)
}

class SYCalendar: UIView {

    // MARK: 프로퍼티
    // 델리게이트 받을 것
    var delegate: SYCalendarDelegate?
    
    // 라벨 년과 달
    var year: Int?
    var month: Int?
    
    // 외부에서 받을 데이터
    var date: Date?{
        // 데이터 값이 들어가면 willSet이 호출됨
        willSet{
            calendarData = SYCalendarDatamodel(date: newValue!)
            year = calendarData?.year
            month = calendarData?.month
            contentView.reloadData()
            // date 변수만 바끼면 가능!
        }
    }
    
    private var calendarData: SYCalendarDatamodel?
    
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
// MARK: 메소드
extension SYCalendar{
    func nextMonth(){
        
        // 데이트에 다음달 값을 할당: 데이터 모델을 이용해
//        date = SYCalendarManager.nextMonth(with: calendarData!)
        date = SYCalendarManager.nextMonth(with: date!)
    }
    func previousMonth(){
        date = SYCalendarManager.previousMonth(with: date!)
    }
}


// MARK: UICollectionViewDelegateFlowLayout : UICollectionViewDelegate 상속받음
extension SYCalendar : UICollectionViewDelegateFlowLayout {
  
    // MARK: UI관련 준비하는 곳
   private func setUpUI() {
        self.addSubview(contentView) // 컬렉션뷰 추가
    contentView.delegate = self as! UICollectionViewDelegate
        contentView.dataSource = self
        
        // 셀을 보일 클래스 등록해야함!
        contentView.register(CustomCell.self, forCellWithReuseIdentifier: cellID)
    
        // 만들어지고 난 다음에 실행
        updateLayout()
        // 이상태로는 불가능함! translatesAutoresizingMaskIntoConstraints 필요!
        
    }
    
    // MARK: 컬렉션뷰의 레이아웃잡기
    private func updateLayout( ){
        contentView.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0 )
        // self: SYCalendar
    }
    // MARK: 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let width = collectionView.frame.size.width / 7
        // insect,LineSpacing, InteritemSpacing 값을 빼주면 됨
        //  (collectionView.frame.size.width - (6*1)
        // 1이 insect,LineSpacing, InteritemSpacing 값
        return CGSize(width: collectionView.frame.size.width / 7, height: collectionView.frame.size.height / 6)
    }
    
    // MARK: 아이템끼리의 사이 간격: vertical로 설정해줬으므로
    // 기본적으로 10, 10이 주어지므로 -> 스토리보드상에서 보면 확인 가능!
    // 0으로 할당하면 셀 개수대로 나눠도 문제없음
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    // MARK: 아이템끼리 위아래 간격
    // 기본적으로 10, 10이 주어지므로 -> 스토리보드상에서 보면 확인 가능!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    // MARK: 셀을 선택했을 때 표시!
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
//        delegate?.calendar(self, didSelectedDate: cell.data)
        
         
    }

}

// MARK: DataSource
extension SYCalendar : UICollectionViewDataSource{
    
    // 섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 섹션안에서 셀의 개수 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 7
        }else{
            
            if let calendarData = calendarData {
                 // 캘린더 빈칸을 채워야하므로
                return calendarData.lastDayOFMonth + calendarData.startWeekOfMonth.rawValue
            }else{
                return 0
            }
            
        }
        
    }
    
    // 셀 재사용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CustomCell
        
        // 계속 셀을 더해서 날짜를 꺼내므로 한번 초기화해주고
        // 모든 셀이 클리어가 된 다음에 나와야 하므로 메소드를 아예 만들어주는게 좋다
//        cell.titleLb.text = ""
        cell.resetInit()
        
        if indexPath.section == 0
        {
            // 일 월 화 수 ...이렇게 시작하므로
           cell.titleLb.text = WeekDay(rawValue: indexPath.item)?.name
        }else{
           let changedIndex = indexPath.item - calendarData!.startWeekOfMonth.rawValue
            // ???
            if changedIndex >= 0 {
                let day = changedIndex + 1
                cell.titleLb.text = "\(day)"
            }
        }
        
//        cell.titleLb.text = "\(indexPath.row)" // 이부분이 있으면 0 1 2로 나옴
        return cell
    }
    
}

// MARK: CustomCell
class CustomCell: UICollectionViewCell {
    // awakeFromNib이 일어날 필요 없음. 자동적으로 만들어지므로
    
    // 클로저 -> 내부에서 바로 쓸 것이므로
    // 연산 프로퍼티: 외부에서 불리는 것이므로 안됨
    var titleLb: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.layer.borderColor = #colorLiteral(red: 1, green: 0.9967653155, blue: 0.9591305852, alpha: 1)
        lb.layer.borderWidth = 3
        lb.layer.cornerRadius = 10
        return lb
    }()
    
    // 데이트?
    var date: Date?
    
    func resetInit(){
        titleLb.text = ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
        
    }
    // MARK: addSubview먼저하고
    // 오토레이아웃 잡기!
    private func setUpUI() {
        self.addSubview(titleLb) // 라벨추가
        updateLBLayout( )
    }
    
    // MARK: 라벨 레이아웃잡기
    private func updateLBLayout( ){
        titleLb.constraint(targetView: self, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0 )
        // self: CustomCell
    }

    // 스토리보드용!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: 간격? 구하는 메소드
extension UIView{
    // MARK: constraint메소드 
    func constraint(targetView: UIView, topConstant: CGFloat?, bottomConstant: CGFloat?, leftConstant: CGFloat?, rightConstant: CGFloat? ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        // 오토레이아웃 적용
        
        if let constant = topConstant{
            self.topAnchor.constraint(equalTo: targetView.topAnchor, constant: constant).isActive = true
        }
        if let constant = rightConstant{
            self.rightAnchor.constraint(equalTo: targetView.rightAnchor, constant: constant).isActive = true
        }
        if let constant = bottomConstant{
            self.bottomAnchor.constraint(equalTo: targetView.bottomAnchor, constant: constant).isActive = true
        }
        if let constant = leftConstant{
            self.leftAnchor.constraint(equalTo: targetView.leftAnchor, constant: constant).isActive = true
        }
    }
}
