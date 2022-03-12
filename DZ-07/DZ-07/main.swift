//
//  main.swift
//  DZ-07
//
//  Created by Viktor S on 11.03.2022.
//

import Foundation

/*
1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?.
 Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
*/

final class Family {

    private var familys = ["Mom": 45, "Dad": 47, "Sister": 44, "Son": 19]

    func age(name: String) -> Int? {
        return familys[name]
    }

    // Средний возраст
    func generalAge() -> Int {

        if familys.count > 0 {
            var totalAge = 0
            for family in familys {
                totalAge += family.value
            }
            return totalAge / familys.count
        } else {
            return 0
        }
    }
}

let famaly = Family()

if let age = famaly.age(name: "Sister") {
    print(age)
} else {
    print("Wrong family member entered")
}

print(famaly.generalAge())

/*
2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций.
 Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
*/

enum WarehouseError: Error {
    case errorInventoryName
    case errorCount
    case errorManyCash
}

struct Item {
    let price: Int
    var count: Int
    let product: Names
}

struct Names {
    let name: String
}

final class MaterialWarehouse {

    var material = ["Wood": Item(price: 100, count: 3, product: Names(name: "Wood")),
                     "Metall": Item(price: 120, count: 12, product: Names(name: "Metall")),
                     "Plastic": Item(price: 315, count: 0, product: Names(name: "Plastic"))]

    var moneyCash = 0

    func warehouse(itemNeed name: String) throws -> Names {

        guard let item = material[name] else { throw WarehouseError.errorInventoryName }
        guard item.count > 0 else { throw WarehouseError.errorCount }
        guard item.price <= moneyCash else { throw WarehouseError.errorManyCash }

        var newItem = item
        newItem.count -= 1
        material[name] = newItem

        print("Material was sklad \(name)")

        return newItem.product
    }
}

let money = MaterialWarehouse()
money.moneyCash = 0

do {
    let product = try money.warehouse(itemNeed: "Wood")
    print(product.name)
} catch let error {
    print(error)
}
// errorManyCash

money.moneyCash = 100

do {
    let product = try money.warehouse(itemNeed: "Wood")
    print(product.name)
} catch let error {
    print(error)
}
//Material was sklad Wood
//Wood

money.moneyCash = 100

do {
    let product = try money.warehouse(itemNeed: "Plastic")
    print(product.name)
} catch let error {
    print(error)
}
// errorCount
