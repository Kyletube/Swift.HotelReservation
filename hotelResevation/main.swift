import Foundation

class Hotel {
    var myMoney = 0
    
    func showMenu() {
        print("")
        print("-------------------------------")
        print("")
        print("* 호텔 예약 관리 프로그램 입니다. *")
        print("1. 랜덤 금액 지급")
        print("2. 호텔 객실 정보 보기")
        print("3. 호텔 객실 예약하기")
        print("4. 나의 예약 목록 보기")
        print("5. 나의 예약 목록 체크인 날짜 순으로 보기")
        print("6. 예약 삭제하기")
        print("7. 예약 수정하기")
        print("8. 나의 입출금 내역 출력하기")
        print("9. 나의 잔액 보기")
        print("10. 프로그램 종료하기")
        print("")
        print("-------------------------------")
        print("")
        print("원하시는 기능의 번호를 입력해 주세요.")
        print("")
    }
    
    func giveMoney() {
        let randomMoney = Int.random(in: 10...50) * 10000
        myMoney += randomMoney
        print("지급된 금액은 \(randomMoney) 입니다")
        print("현재 나의 잔액은 \(myMoney) 입니다")
    }
    
    func viewRooms() {
        let price1 = Int.random(in: 10...50) * 1000
        let price2 = Int.random(in: 40...90) * 1000
        let price3 = Int.random(in: 90...110) * 1000
        let price4 = Int.random(in: 110...150) * 1000
        let price5 = Int.random(in: 200...400) * 1000
        let price6 = Int.random(in: 550...900) * 1000
        
        print("1번방은 \(price1)원 입니다.")
        print("2번방은 \(price2)원 입니다.")
        print("3번방은 \(price3)원 입니다.")
        print("4번방은 \(price4)원 입니다.")
        print("5번방은 \(price5)원 입니다.")
        print("6번방은 \(price6)원 입니다.")
        print("7번방은 선물 입니다. ^^")
    }
    
//    func reservation() {
//        print("")
//        print("-------------------------------")
//        print("방 번호, 체크인 날짜, 체크아웃 날짜를 각각 입력해주세요.")
//        print("-------------------------------")
//        print("방 번호를 입력하세요")
//    }
}


let hotel = Hotel()

var menu = true

hotel.showMenu()

while menu {
    
    
    if let input = readLine(), let selectNumber = Int(input) {
        switch selectNumber {
        case 1:
            hotel.giveMoney()
            hotel.showMenu()
        case 2:
            hotel.viewRooms()
            hotel.showMenu()
            
        case 10:
            print("서비스를 종료합니다")
            menu = false
        default:
            print("유효하지 않은 번호입니다. 다시 선택 해주세요")
        }
    }
}


