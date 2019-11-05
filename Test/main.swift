//
//  main.swift
//  Test
//
//  Created by Oleksandr on 05.11.2019.
//  Copyright © 2019 Oleksandr. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//class Human {
//    var human: Human?
//
//    deinit {
//        print("KILLED")
//    }
//}
//
//var obj1: Human? = Human()
//var obj2: Human? = obj1
//obj2?.human = obj1
//obj1?.human = obj2
//
//obj1 = nil
//obj2 = nil // 0

// ----------------------

class AsyncPrinter {
    var name = "21312312323"

    var printClosure: (() -> Void)?

    deinit {
        print(#function)
    }

    init() {
        self.printClosure = { [weak self] in
            print(self?.name)
        }
    }

    func printSomewhen() {
        DispatchQueue.main
            .asyncAfter(deadline: .now() + 2,
                        execute: { [weak self] in
                            print(self?.name)
            })
    }
}

//var printer: AsyncPrinter? = AsyncPrinter() // 1
//printer?.printSomewhen() // 2
//printer = nil // 1
//print([1,2,3].map { String($0) }.joined())
//print("asdfasdfasd")

//var printer: AsyncPrinter? = AsyncPrinter() // 1
//printer?.printClosure?() // 2
//printer?.printClosure?() // 2
//printer?.printClosure = nil
//printer = nil // 1

func test() {
    var printer2: AsyncPrinter = AsyncPrinter() // + 1
    printer2.printClosure = { [name = printer2.name] in
        print(name)
    }
    printer2.printClosure?()
    printer2.name = "111"
    printer2.printClosure?()
}
test()
//printer2 = nil

RunLoop.main.run()
