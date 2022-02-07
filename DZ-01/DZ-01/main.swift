//
//  main.swift
//  DZ-01
//
//  Created by Viktor S on 06.02.2022.
//

import Darwin
import Foundation

//1. Решить квадратное уравнение.
// Формула: ax2 + bx + c = 0
// Дескрименант D = b2 – 4ac
// корни x = (-b ± √(b^2-4ac))/2a
//При D > 0, уравнение имеет два корня;
// при D = 0, один корень -b/2a;
// при D ˂ 0, уравнение корней не имеет
print("Задание №1 - решение квадратного уравнения")

let a: Double = 2.0
let b: Double = 5.0
let c: Double = 2.0
let d: Double = pow(b, 2) - (4 * a * c)

// Находим корни
var x1: Double = (-b + sqrt(pow(b, 2) - (4 * a * c))) / (2 * a)
var x2: Double = (-b - sqrt(pow(b, 2) - (4 * a * c))) / (2 * a)


if d > 0 {
    print("Корни квадратного уравнения: ", x1, " ", x2)
} else if d == 0 {
    x1 = -b / (2 * a)
    print("Корень квадратного уравнения:", x1)
} else if d < 0 {
    print("Уравнение корней не имеет")
}


// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
print("\nЗадание №2 - Площадь, периметр и гипотенуза треугольника")

let cat1: Double = 2
let cat2: Double = 4
// Площадь треугольника
let s: Double = 1/2 * cat1 * cat2
print("Площадь треугольника со сторонами \(cat1) и \(cat1) равна: \(s)")
// Гипотенуза - через Теорему Пифагора pow(c) = pow(a) + pow(b) => с = sqrt(pow(a) + pow(b))
let gipo: Double = sqrt(pow(cat1,2) + pow(cat2,2))
print("Гипотенуза треугольника со сторонами \(cat1) и \(cat1) равна: \(round(gipo*100)/100)")
// Периметр
let p: Double = cat1 + cat2 + gipo
print("Периметр треугольника со сторонами \(cat1) и \(cat1) равен: \(round(p*100)/100)")


// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
print("\nЗадание №3 - Сложный процент в банке")
// Формула: x*(1+a/100)^n (x - вклад, a - процент, n - кол-во лет)

let sum: Double = 1000
let year: Double = 5
let percent: Double = 7

let vklad = sum * pow((1 + percent / 100), year)

print("Сумма вклада в размере \(sum) под \(Int(percent))%, через \(Int(year)) лет будет равна: \(round(vklad*100)/100)")
