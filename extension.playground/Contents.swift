import UIKit

var greeting = "Hello, playground"
/* Расширьте класс Int, добавив в него свойства asDouble, asFloat и asString, возвращающие исходное целое число в преобразованном к другому типу данных виде (к Double, к Float, к String)
 Пример
 [Int] 12.asDouble -> [Double] 12*/
extension Int {
    var asDouble: Double {return Double(self)}
    var asFloat: Float {return Float(self)}
    var asString: String {return String(self)}
}

/* Напишите расширение к классу String, которое содержит метод, возвращающий закодированную строку по следующим правилам:
 – Первый символ каждого слова в строке меняется на Кодовую точку (набор цифр) данного символа в UTF
 – второй символ в каждом слове меняется местами с последним
 Пример
 "Я учу Swift".crypt() -> "1071 1091уч 83tifw"
 кодовые точки в данном случае представлены в десятиричной системе счисления
 */
extension String {
    func crypt() -> String{
        let strArr = self.split(separator:" ")
        var resultStr = ""
        for w in strArr {
            // Преобразуем Substring в String
            var word = String(w)
            //меняем второй и последний символ местами
            if word.count >= 3 {
                // получаем индекс второго символа
                let secondCharIndex = word.index(after: word.startIndex)
                // записываем второй символ во временную переменную
                let tmp_secondChar = word[secondCharIndex]
                // получаем индекс последнего символа
                let lastCharIndex = word.index(before: word.endIndex)
                // меняем местами символы
                word.replaceSubrange(
                    secondCharIndex..<word.index(after: secondCharIndex),
                    with: String(word[lastCharIndex]))
                word.replaceSubrange(
                    lastCharIndex..<word.index(after: lastCharIndex),
                    with: String(tmp_secondChar))
            }
            //заменяем первый символ на его кодовую точку
            let codePoint = word.unicodeScalars[word.startIndex].value
            word.replaceSubrange(
               word.startIndex..<word.index(after: word.startIndex),
               with: String(codePoint))
            resultStr += "\(word) "
        }
        //удаляем последний лишний пробел
        resultStr.remove(at: resultStr.index(before: resultStr.endIndex))
        //возвращаем результат
        return resultStr
    }
}
"Я учу Swift".crypt()

/* Ваша программа оперирует числовыми данными, характеризующими расстояние. При это вам необходимо работать исключительно с сантиметрами, но данные могут быть указаны и в любых других единицах измерения (миллиметрах, метрах, километрах)
 Напишите расширение для структуры Double, добавляющее в тип свойства, с помощью которых можно перевести указанную длину в сантиметры следующим образом:

 Double(102).m //10200
 1.2.km //120000
 900.sm //900
 Свойство указывает в каких единицах определено расстояние, и переводит его в сантиметры*/

extension Double {
    var km: Double {return self * 100000.0}
    var m: Double {return self * 100.0}
    var sm: Double {return self}
    var mm: Double {return self / 10}
}
/* В дополнении к предыдущему заданию напишите расширение для структуры Double, чтобы оно позволяло переводить число из сантиметров в миллиметры, сантиметры, метры, километры, используя следующий синтаксис:

100.1.toM // 1.001
Double(5).km.toM // 5000
Double(150).m.toKM // 0.15 */

extension Double {
    var toMM: Double { return self*10 }
    var toSM: Double { return self }
    var toM: Double { return self/100 }
    var toKM: Double { return self/100000 }
}
/* Напишите расширение для типа Int, добавляющее в него метод iterator(count:closure:), принимающий два параметра:
 – count – количество раз, которые необходимо повторить переданное замыкание
 – замыкание, модифицирующее значение типа Int

 К примеру:

 //3 раза умножить число 2 на 5
 var a = 2
 a.iterator(count: 3) {$0 * 5}
 a // 250*/
extension Int {
    mutating func iterator(count: Int, closure: (Int) -> Int) {
        for _ in 1...count {
            self = closure(self)
        }
    }
}
var a = 2
a.iterator(count: 3, closure: {$0 * 5})
print(a)

/* Напишите расширение для типа Int, которое добавляет сабскрипт, возвращающий указанную в числе цифру или nil, если цифры с таким порядковым номером не существует
 Например:*/


extension Int {
    subscript(digitNumber: Int) -> Int? {
        guard String(self).count >= digitNumber, digitNumber > 0 else {
            return nil
        }
        var mutableNumber = self
        var res = 0
        for _ in digitNumber...String(self).count {
            res = mutableNumber % 10
            mutableNumber /= 10
        }
        return res
    }
}








