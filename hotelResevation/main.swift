import Foundation

class Hotel {
    var myMoney = 0
    var roomNumber:[String] = []
    var reservationList: [(roomNumber: Int, checkInDate: String, checkOutDate: String)] = []
    
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
        let roomPrices = [Int.random(in: 10...50) * 1000,
                              Int.random(in: 40...90) * 1000,
                              Int.random(in: 90...110) * 1000,
                              Int.random(in: 110...150) * 1000,
                              Int.random(in: 200...400) * 1000,
                              Int.random(in: 550...900) * 1000]
        
        for (index, price) in roomPrices.enumerated() {
                print("\(index + 1)번방은 \(price)원 입니다.")
            }
            print("7번방은 선물 입니다. ^^")
        }
    
    func reservation() {
        print("")
        print("-------------------------------")
        print("방 번호, 체크인 날짜, 체크아웃 날짜를 각각 입력해주세요.")
        print("-------------------------------")
        print("방 번호를 입력하세요")
        
        if let roomInput = readLine(), let roomNumber = Int(roomInput) {
            if roomNumber >= 1 && roomNumber <= 6 {
                print("체크인 날짜를 입력하세요 (예: 2023-07-21)")
                
                var checkInDate = ""
                
                while true {
                    if let Input = readLine() {
                        if isDate(Input) {
                            checkInDate = Input
                            print(checkInDate)
                            break
                        } else {
                            print("올바른 날짜 형식이 아닙니다. 다시 입력 해주세요 (ex: 2023-07-01)")
                        }
                    }
                }
                
                print("체크아웃 날짜를 입력하세요 (예: 2023-07-25)")
                
                var checkOutDate = ""
                        
                while true {
                    if let Input = readLine() {
                        if isDate(Input) {
                            checkOutDate = Input
                            print(checkOutDate)
                            break
                        } else {
                            print("올바른 날짜 형식이 아닙니다. 다시 입력 해주세요 (ex: 2023-07-01)")
                        }
                    }
                }
                reservationList.append((roomNumber: roomNumber, checkInDate: checkInDate, checkOutDate: checkOutDate))
                print("호텔 방 \(roomNumber) 예약이 완료되었습니다.")
                
            } else {
                print("존재하지 않는 방 번호입니다.")
            }
        } else {
            print("유효하지 않은 입력입니다.")
        }
    }
    
    func viewMyReservationList() {
        print("나의 예약 목록")
        if reservationList.isEmpty {
            print("예약한 객실이 없습니다.")
        } else {
            for (index, reservation) in reservationList.enumerated() {
                print("예약 번호: \(index + 1), 방 번호: \(reservation.roomNumber), 체크인 날짜: \(reservation.checkInDate), 체크아웃 날짜: \(reservation.checkOutDate)")
            }
        }
    }
    func backToMenu() {
        print("")
        print("뒤로 가시려면 10을 입력해주세요")
        while true {
            if let input = readLine(), let selectNumber = Int(input) {
                if selectNumber == 10 {
                    showMenu()
                    break
                } else {
                    print("뒤로 가시려면 10을 입력해주세요")
                }
            }
        }
    }

    //    func backToMenu () { // 함수내에서 자신을 다시 호출하는 재귀함수 호출스택이 쌓이게되면 메모리 사용량이 증가할 수 있고 오버플로우의 위험이 있음
    //        if let back = readLine(), let backNumber = Int(back) {
    //            if backNumber == 10 {
    //                showMenu()
    //            } else {
    //                print("뒤로 가시려면 10을 입력해주세요")
    //                backToMenu()
    //            }
    //        }
    //    }
    
    func isDate(_ date: String) -> Bool {
        let yymmdd = DateFormatter()
        yymmdd.dateFormat = "yyyy-MM-dd"
        if let realDate = yymmdd.date(from: date) {
            return true
        } else {
            return false
        }
    }
}


let hotel = Hotel()

var menu = true

hotel.showMenu()

while menu {
    
    
    if let input = readLine(), let selectNumber = Int(input) {
        switch selectNumber {
        case 1:
            hotel.giveMoney()
            hotel.backToMenu()
        case 2:
            hotel.viewRooms()
            hotel.backToMenu()
        case 3:
            hotel.reservation()
            hotel.backToMenu()
        case 4:
            hotel.viewMyReservationList()
            hotel.backToMenu()
        case 10:
            print("서비스를 종료합니다")
            menu = false
        default:
            print("유효하지 않은 번호입니다. 다시 선택 해주세요")
        }
    }
}



