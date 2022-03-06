//
//  main.swift
//  DZ-05
//
//  Created by Viktor S on 02.03.2022.
//

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
*/
enum CarType: String {
    case SportCar = "Легковой автомобиль"
    case TrunkCar = "Грузовой автомобиль"
}

enum Transmission {
    case auto
    case manual
}

enum WindowStatus: String {
    case open = "Открыто"
    case close = "Закрыто"
}

protocol Car {
    var year: Int { get }
    var trunkVolume: Int { get } // Объем кузова
    var audio: Bool { get }
    var transmission: Transmission { get set}
    var km: Int { get }
    var windowStatus: WindowStatus { get set} // Статус окон

    mutating func openWindow()
    mutating func printCar ()
}


/*
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 */

extension Car {
    /// Открываем окно
    mutating func openWindow() {
        windowStatus = .open
        print("Открываем окно")
    }

    /// Закрываем окно
    mutating func closeWindow() {
        windowStatus = .close
        print("Закрываем окно")
    }

    /// вывод на печать
    mutating func printCar () {
        print("-----")
        print("Год выпуска: \(year)")
        print("Пробег: \(km)")
        print("Состояние окон: \(windowStatus)")
        print("Объем багажника: \(trunkVolume)\n")
    }

}


/*
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 */
// Спортивное авто
final class sportCar: Car, CustomStringConvertible {
    var description: String {
        return """
        -----
        Год выпуска: \(year)
        Пробег: \(km)
        Состояние окон: \(windowStatus)
        Объем багажника: \(trunkVolume)\n
        """
    }

    var year: Int
    var trunkVolume: Int
    var audio: Bool
    var transmission: Transmission
    var km: Int
    var windowStatus: WindowStatus
    let carType: CarType // ввели новую константу - тип авто - .sport
    // конструктор - перечисляем все свойства
    init (year: Int,
          trunkVolume: Int,
          audio: Bool,
          transmission: Transmission,
          km: Int,
          windowStatus: WindowStatus,
          carType: CarType = .SportCar) {
        self.carType = carType
        self.year = year
        self.trunkVolume = trunkVolume
        self.audio = audio
        self.transmission = transmission
        self.km = km
        self.windowStatus = windowStatus
    }
}

// Грузовое авто
final class trunkCar: Car {
    var year: Int
    var trunkVolume: Int
    var audio: Bool
    var transmission: Transmission
    var km: Int
    var windowStatus: WindowStatus
    // инициализируем новые свойства
    let carType: CarType
    var cargo: Int
// конструктор - перечисляем все свойства
    init (year: Int,
          trunkVolume: Int,
          audio: Bool,
          transmission: Transmission,
          km: Int,
          windowStatus: WindowStatus,
          carType: CarType = .TrunkCar,
          cargo: Int) {
        self.carType = carType
        self.year = year
        self.trunkVolume = trunkVolume
        self.audio = audio
        self.transmission = transmission
        self.km = km
        self.windowStatus = windowStatus
        self.cargo = cargo
    }

}

/*
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 */
extension trunkCar {

    var freeCargo: Int { // высчитываем объем свободного места в кузове
        get {
            trunkVolume - cargo
        }
        set {
            cargo = trunkVolume - newValue
        }
    }
}


/*
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль
*/
// Спортивное авто
var bmv = sportCar(year: 2021, trunkVolume: 150, audio: true, transmission: .auto, km: 0, windowStatus: .close)
bmv.printCar()

// Грузовое авто
var scania = trunkCar(year: 2005, trunkVolume: 15_000, audio: false, transmission: .auto, km: 90_000, windowStatus: .close, cargo: 0)
scania.printCar()
print(scania.freeCargo)
scania.cargo = 500
print(scania.freeCargo)

print(bmv.description)
