//
//  main.swift
//  DZ-02
//
//  Created by Viktor S on 09.02.2022.
//

import Foundation

//MARK: - 1. Написать функцию, которая определяет, четное число или нет.
print("Задание №1")

func evenNumbers(number: Int) {
    if number % 2 == 0 {
        print("Число \(number) - четное")
    } else {
        print("Число \(number) - НЕчетное")
    }
}

evenNumbers(number: 4)
evenNumbers(number: 7)
evenNumbers(number: -12)

//MARK: -  2. Написать функцию, которая определяет, делится ли число без остатка на 3.
print("\nЗадание №2")

func divOnThree(_ number: Int) {
    if number % 3 == 0 {
        print("Число \(number) делится на 3")
    } else {
        print("Число \(number) НЕ делится на 3")
    }
}

divOnThree(4)
divOnThree(9)
divOnThree(-12)

//MARK: -  3. Создать возрастающий массив из 100 чисел.
print("\nЗадание №3")
var array = Array<Int>()

//1-й способ
for i in 1...100 {
    array.append(i)
}
print(array)

//2-й способ
var array1 = Array(1...100)
print(array1)

//MARK: - 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("\nЗадание №4")

var newArray: [Int] = []

for index in array {
    if (index % 2 != 0) && (index % 3 != 0) {
        newArray.append(index)
    }
}
print(newArray)


//MARK: -
/*
5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
*/
print("\nЗадание №5")

func fibonachiNumber() {
    var arrayFib = [0, 1]
    for i in 1...48 {
        arrayFib.append(arrayFib[i]+arrayFib[i-1])
    }
    print(arrayFib)
}

fibonachiNumber()


//MARK: -
/*
6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/
print("\nЗадание №6")


let arrayTemp = Array(1...100)
var p = 2 // первое простое число
var arrayNew: [Int] = []

print("Не успел сделать")
