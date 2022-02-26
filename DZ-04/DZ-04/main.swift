//
//  main.swift
//  DZ-04
//
//  Created by Viktor S on 23.02.2022.
//

import Foundation

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
*/
print("--------- Задание 1 ---------")

enum CarType {
    case SportCar
    case TrunkCar
}

enum CarBrand {
    case Audi
    case BMW
    case Mersedes
    case Scania
    case Volvo
}

enum Transmission {
    case auto
    case manual
}

enum DoorStatus {
    case open
    case close

    /// Открываем двери
    mutating func openDoor() {
        self = .open
        print("Открываем двери")
    }

    /// Закрываем двери
    mutating func closeDoor() {
        self = .open
        print("Закрываем двери")
    }
}

enum WindowStatus: String {
    case open = "Открыто"
    case close = "Закрыто"

    /// Открываем окно
    mutating func openWindow() {
        self = .open
        print("Открываем окно")
    }

    /// Закрываем окно
    mutating func closeWindow() {
        self = .close
        print("Закрываем окно")
    }
}

enum TrunkStatus {
    case free
    case middle
    case full
}

enum EngineStatus {
    case start
    case stop
}


class Car {
    let carBrand: CarBrand
    let year: Int
    let trunkVolume: Int // Объем кузова
    let audio: Bool
    let transmission: Transmission
    var km: Int
    var doorStatus: DoorStatus // Статус дверей
    var windowStatus: WindowStatus { // Статус окон
        didSet {
            if windowStatus == .open {
                print("Окно открыто\n")
            } else {
                print("Окно закрыто\n")
            }
        }
    }
    var engineStatus: EngineStatus { // Статус двигателя
        didSet {
            if engineStatus == .start {
                print("Двигатель заведен\n")
            } else {
                print("Двигатель заглушен\n")
            }
        }
    }

    init (carBrand: CarBrand,
          year: Int,
          trunkVolume: Int,
          audio: Bool,
          transmission: Transmission,
          km: Int,
          doorStatus: DoorStatus,
          windowStatus: WindowStatus,
          engineStatus: EngineStatus)
    {
        self.carBrand = carBrand
        self.year = year
        self.trunkVolume = trunkVolume
        self.audio = true
        self.transmission = transmission
        self.km = km
        self.doorStatus = doorStatus
        self.windowStatus = windowStatus
        self.engineStatus = engineStatus
    }

    // Если добавляем 3-мя слешами - то у нас будет всплывать это в подскаpках, при вызове данной функции
    /// Запускаем двигатель
    func startEngine(_ engineStatus: EngineStatus) {
        self.engineStatus = engineStatus
        print("Изменен статус двигателя на \(self.engineStatus)\n")
    }

    // вывод на печать
    func printCar () {
        print("-----")
        print("Марка: \(carBrand)")
        print("Год выпуска: \(year)")
        print("Пробег: \(km)")
        print("Состояние двигателя: \(engineStatus)")
        print("Состояние окон: \(windowStatus)")
        print("Объем багажника: \(trunkVolume)\n")
    }
}



/*
 2. Описать пару его наследников trunkCar и sportСar.
  Подумать, какими отличительными свойствами обладают эти автомобили.
  Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем.
 Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
*/
print("--------- Задание 2-4 ---------")
final class sportCar: Car {
    let carType: CarType // ввели новую константу - тип авто - .sport
// конструктор - перечисляем все свойства
    init (carBrand: CarBrand,
          year: Int,
          trunkVolume: Int,
          audio: Bool,
          transmission: Transmission,
          km: Int,
          doorStatus: DoorStatus,
          windowStatus: WindowStatus,
          engineStatus: EngineStatus,
          carType: CarType = .SportCar)
    { self.carType = carType // инициализируем новое свойство
        //используем конструктор из родителя, чтобы завершить инициализацию
        super.init (carBrand: carBrand,
              year: year,
              trunkVolume: trunkVolume,
              audio: audio,
              transmission: transmission,
              km: km,
              doorStatus: doorStatus,
              windowStatus: windowStatus,
              engineStatus: engineStatus
            )
    }

    // вывод на печать
    override func printCar () {
        print("-----")
        print("Марка: \(carBrand)")
        print("Тип авто: \(carType)")
        print("Год выпуска: \(year)")
        print("Пробег: \(km)")
        print("Состояние двигателя: \(engineStatus)")
        print("Состояние окон: \(windowStatus)")
        print("Объем багажника: \(trunkVolume)\n")
    }
}

final class trunkCar: Car {
    let carType: CarType // ввели новую константу - тип авто - .sport
    var cargo: Int // объем кузова
    var freeCargo: Int { // высчитываем объем свободного места в кузове
        get {
            trunkVolume - cargo
        }
        set {
            cargo = trunkVolume - newValue
        }
    }
// конструктор - перечисляем все свойства
    init (carBrand: CarBrand,
          year: Int,
          trunkVolume: Int,
          audio: Bool,
          transmission: Transmission,
          km: Int,
          doorStatus: DoorStatus,
          windowStatus: WindowStatus,
          engineStatus: EngineStatus,
          carType: CarType = .TrunkCar,
          cargo: Int
        )
    { // инициализируем новые свойства
        self.carType = carType
        self.cargo = cargo
        //используем конструктор из родителя, чтобы завершить инициализацию
        super.init (carBrand: carBrand,
              year: year,
              trunkVolume: trunkVolume,
              audio: audio,
              transmission: transmission,
              km: km,
              doorStatus: doorStatus,
              windowStatus: windowStatus,
              engineStatus: engineStatus
            )
    }

    override func printCar () {
        super.printCar()
        print("Тип авто: \(carType)")
        print("Объем груза: \(cargo)")
        print("Объем свободного места: \(freeCargo)\n")
    }

    /// Погрузка груза в грузовой авто
    func loading(_ cargo: Int) {
        freeCargo -= cargo
        print("В кузов загружено \(cargo)")
        print("Свободного места \(freeCargo)")
    }
}



/*
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
*/
print("--------- Задание 5 ---------")
// Обычное авто
var autoOne = Car(carBrand: .Volvo, year: 2021, trunkVolume: 150, audio: true, transmission: .auto, km: 0, doorStatus: .close, windowStatus: .close, engineStatus: .stop)

// Спортивное авто
var autoTwo = sportCar(carBrand: .Audi, year: 2021, trunkVolume: 100, audio: true, transmission: .auto, km: 0, doorStatus: .close, windowStatus: .close, engineStatus: .stop)

// Грузовое авто
var autoThree = trunkCar(carBrand: .Scania, year: 2015, trunkVolume: 10_000, audio: true, transmission: .auto, km: 50_000, doorStatus: .open, windowStatus: .close, engineStatus: .stop, cargo: 0)




/*
 6. Вывести значения свойств экземпляров в консоль.
*/

print("--------- Задание 6 ---------")

autoOne.printCar()
autoTwo.printCar()
autoThree.printCar()

print("Загружаем в \(autoThree.carBrand) 7 000 груза")
autoThree.loading(7_000)

autoOne.windowStatus.openWindow()
autoOne.windowStatus.closeWindow()
autoTwo.doorStatus.openDoor()
print("Статус дверей \(autoTwo.carBrand) -  \(autoTwo.doorStatus)")
