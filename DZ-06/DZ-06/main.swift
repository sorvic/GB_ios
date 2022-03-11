//
//  main.swift
//  DZ-06
//
//  Created by Viktor S on 06.03.2022.
//

import Foundation

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/
struct Name {
    var name: String
    var lastName: String
    var age: Int
}

struct Phone {
    var phone: String
}

struct Queue<T> {

    private var queue = [T]()

    // кол-во элементов
    var size: Int {
        return queue.count
    }

    // добавляем элемент в конец очереди
    mutating func add (_ element: T) {
        queue.append(element)
    }

    // удаляем первый элемент из очереди
    mutating func pop() -> T? {
        return queue.removeFirst()
    }

    // фильтр поиска - не заработал у меня
    // никак не могу его осилить( Буду еще читать/смотреть
//    public func filter(_ value: (T) -> Bool) -> [T] {
//        var array = [T]()
//        for i in queue where value(i) {
//            array.append(i)
//        }
//        return array
//    }

    func forPrint (element: (T) -> Bool) -> Queue<T> {

        var newQueue = Queue<T>()
        for i in queue {
            if element(i) {
                newQueue.queue.append(i)
            }
        }
        return newQueue
    }

    // Выводим по индексу, начиная с 1
    subscript(index: Int) -> (T?) {
        if index > size || index < 1 {
            return nil
        } else {
            let newIndex = index - 1
            return queue[newIndex]
        }

    }
}

var name = Queue<Name>()
var phone = Queue<Phone>()


name.add(Name(name: "Petr", lastName: "Petrov", age: 25))
//print("Ваша позиция в очереди \(name.count)")
phone.add(Phone(phone: "79855654561"))
name.add(Name(name: "Ivan", lastName: "Ivanov", age: 35))
phone.add(Phone(phone: "79851233212"))
phone.add(Phone(phone: "71233212"))
name.add(Name(name: "Fedr", lastName: "Fedorov", age: 15))

//var filteredQueue = phone.filter{ $0.contains("71233212")}
//print(filteredQueue)

print(name)
print(name.size)
print(phone.size)
print(phone)

// Выводы в консоль:
// Queue<Name>(queue: [DZ_06.Name(name: "Petr", lastName: "Petrov", age: 25), DZ_06.Name(name: "Ivan", lastName: "Ivanov", age: 35), DZ_06.Name(name: "Fedr", lastName: "Fedorov", age: 15)])
// Queue<Phone>(queue: [DZ_06.Phone(phone: "79855654561"), DZ_06.Phone(phone: "79851233212"), DZ_06.Phone(phone: "71233212")])
// 3
// 3

// Выводим по индексу, начиная с 1
print(name[2])
// Optional(DZ_06.Name(name: "Ivan", lastName: "Ivanov", age: 35))
print(name[4])
// nil

name.pop()
phone.pop()
print(name)
print(phone)
phone.pop()
print(phone.size)
print(phone)

// Выводы в консоль:
// Queue<Name>(queue: [DZ_06.Name(name: "Ivan", lastName: "Ivanov", age: 35), DZ_06.Name(name: "Fedr", lastName: "Fedorov", age: 15)])
// Queue<Phone>(queue: [DZ_06.Phone(phone: "79851233212"), DZ_06.Phone(phone: "71233212")])
//1
// Queue<Phone>(queue: [DZ_06.Phone(phone: "71233212")])
