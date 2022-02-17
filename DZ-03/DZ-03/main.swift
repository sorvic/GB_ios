//
//  main.swift
//  DZ-03
//
//  Created by Viktor S on 14.02.2022.
//

import Foundation

//MARK: - Задание 1-2
/* 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна,
заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна,
погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры
в зависимости от действия.
*/

enum CarType {
    case SportCar, TrunkCar
}

enum CarBrand {
    case Audi, BMW, Mersedes, Scania, Volvo
}

enum TrunkType {
    case sport, trunk
}

enum Transmission {
    case auto, manual
}

enum DoorStatus {
    case open, close
}

enum WindowStatus {
    case open, close
}

enum TrunkStatus {
    case free, middle, full
}

enum EngineStatus {
    case start, stop
}

struct Car {
    let carType: CarType // грузовой или легковой
    let carBrand: CarBrand
    let year: Int
    var trunkType: TrunkType { // зависимость кузова от типа авто
        get {
            if carType.self == CarType.SportCar {
                return TrunkType.sport
            } else {
                return TrunkType.trunk
            }
        }
    }
    let trunkVolume: Int // Объем кузова
    let color: String
    let audio: Bool
    let transmission: Transmission
    var km: Int
    var doorStatus: DoorStatus // Статус дверей
    var windowStatus: WindowStatus { // Статус окон
        didSet {
            if windowStatus == .open {
                print("Окно открыто")
            } else {
                print("Окно закрыто")
            }
        }
    }
    var trunkStatus: TrunkStatus { // Статус кузова
        get {
            if cargo == 0 {
                return TrunkStatus.free
            } else if cargo == trunkVolume {
                return TrunkStatus.full
            } else {
                return TrunkStatus.middle
            }
        }
    }
    var engineStatus: EngineStatus { // Статус двигателя
        didSet {
            if engineStatus == .start {
                print("Двигатель заведен")
            } else {
                print("Двигатель заглушен")
            }
        }
    }
    var cargo: Int { // Объем груза
        willSet { // что было до
            print("Состояние груза поменялось с \(cargo) на \(newValue)")
        }
    }
    var trunkFree: Int { // Объем свободного места
        get {
            trunkVolume - cargo
        }
        set {
            cargo = trunkVolume - newValue
        }
    }
    // Открываем/закрываем окно
    mutating func openWindow(_ windowStatus: WindowStatus) {
        self.windowStatus = windowStatus
        print("Изменен статус окна на \(self.windowStatus)\n")
    }
    // Открываем/закрываем двери
    mutating func openDoor(_ doorStatus: DoorStatus) {
        self.doorStatus = doorStatus
        print("Изменен статус двери на \(self.doorStatus)\n")
    }
    // Запускаем двигатель
    mutating func startEngine(_ engineStatus: EngineStatus) {
        self.engineStatus = engineStatus
        print("Изменен статус двигателя на \(self.engineStatus)\n")
    }
}


//MARK: - 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car1 = Car(carType: CarType.SportCar, carBrand: CarBrand.Audi, year: 2021, trunkVolume: 150, color: "Black", audio: true, transmission: Transmission.auto, km: 0, doorStatus: DoorStatus.close, windowStatus: WindowStatus.close, engineStatus: EngineStatus.stop, cargo: 0)

var car2 = Car(carType: CarType.SportCar, carBrand: CarBrand.BMW, year: 2020, trunkVolume: 170, color: "Red", audio: true, transmission: Transmission.auto, km: 0, doorStatus: DoorStatus.close, windowStatus: WindowStatus.close, engineStatus: EngineStatus.stop, cargo: 0)

var car3 = Car(carType: CarType.TrunkCar, carBrand: CarBrand.Volvo, year: 2019, trunkVolume: 1500, color: "Blue", audio: true, transmission: Transmission.auto, km: 100, doorStatus: DoorStatus.close, windowStatus: WindowStatus.close, engineStatus: EngineStatus.stop, cargo: 50)

var car4 = Car(carType: CarType.TrunkCar, carBrand: CarBrand.Scania, year: 2019, trunkVolume: 1500, color: "Blue", audio: true, transmission: Transmission.auto, km: 100, doorStatus: DoorStatus.close, windowStatus: WindowStatus.close, engineStatus: EngineStatus.stop, cargo: 50)




//MARK: - 6. Вывести значения свойств экземпляров в консоль.
print("--------------------------------")
car4.cargo = 550
print("Свободного места в кузове осталось - \(car4.trunkFree)")
print("Статус наполнения кузова - \(car4.trunkStatus)")
print("--------------------------------")
car3.cargo = car3.cargo - 50
print("Свободного места в кузове осталось - \(car3.trunkFree)")
print("Статус наполнения кузова - \(car3.trunkStatus)")

print("--------------------------------")
car1.openWindow(.open)
car1.openWindow(.close)

car2.openDoor(.open)

car3.startEngine(.start)

print("У автомобиля марки \(car1.carBrand) \(car1.year) года выпуска двери \(car1.doorStatus),  окна \(car1.windowStatus), пробег \(car1.km) км")
print("У автомобиля марки \(car2.carBrand) \(car2.year) года выпуска двери \(car2.doorStatus),  окна \(car2.windowStatus), пробег \(car1.km) км")
print("У автомобиля марки \(car3.carBrand) \(car3.year) года выпуска двери \(car3.doorStatus),  окна \(car3.windowStatus), имеет кузов  объемом \(car3.trunkVolume), статус заполнения \(car3.trunkStatus)")
print("У автомобиля марки \(car4.carBrand) \(car4.year) года выпуска двери \(car4.doorStatus),  окна \(car4.windowStatus), имеет кузов  объемом \(car4.trunkVolume), статус заполнения \(car4.trunkStatus)")
