import UIKit

// MARK: - Task 2
// 2. Определить две константы a и b типа Double, присвоить им любые значения. Вычислить среднее значение и сохранить результат в переменную avarage.

let a: Double = 3
let b: Double = 4
var avarage: Double = 0

func findAvarage(_ x1: Double, _ x2: Double) -> Double {
    
    return (x1 + x2) / 2
}
avarage = findAvarage(a, b)

//MARK: - Task 3
// 3. Создать кортеж, и задать два любых строковых значения с названиями firstName и lastName. Далее необходимо вывести в консоль строку в формате "Full name: [firstName] [lastName]".

var person = (firstName: "Vlad", lastName: "Bokin")
print("Full name: \(person.firstName) \(person.lastName)")

var person2 = ("Maria", "Ivanova", "Dmitrievna", years: 21)
print("Full info: \(person2.0) \(person2.1) \(person2.2), \(person2.years) y.o.")

// MARK: - Task 4
// 4. Создать две опциональные переменные типа Float. Одной из них задать первоначальное значение. Написать функцию, которая принимает на вход опциональную переменную типа Float. Функция должна безопасно извлечь значение из входящей переменной. Если значение удалось получить - необходимо вывести его в консоль, если значение у переменной отсутствует вывести в консоль фразу "Variable can't be unwrapped". Вызвать функцию дважды с двумя ранее созданными переменными.

var value1: Float?
var value2: Optional<Float> = 4.0 // Типы эквиваленты

func safetyUnwrap(value: Float?) {
    
    //Method 1
    guard let safeValue = value else {
        print("Variable can't be unwrapped")
        return
    }

    print(safeValue, "- value isn't nil")

    //Method 2
    if value != nil {
        print(value!, "- value isn't nil")
    } else {
        print("Variable can't be unwrapped")
    }
    
    //Method 3
    if let newValue2 = value as? Float {
        print(newValue2, "- value isn't nil")
    } else {
        print("Variable can't be unwrapped")
    }
    
}

safetyUnwrap(value: value2)

// MARK: - Task 5
//5. Напишите программу для вывода первых 15 чисел последовательности Фибоначчи


func fibonacci(_ n: Int) -> [Int] {
    var fibonacciArray = [Int]()
    
    for n in 0 ... n {

            if n == 0 {
                fibonacciArray.append(0)
            }
            else if n == 1 {
                fibonacciArray.append(1)
            }
            else {
                fibonacciArray.append (fibonacciArray[n-1] + fibonacciArray[n-2] )
            }
        }
        return fibonacciArray
    
}

print(fibonacci(15))

// MARK: - Task 6
// 6. Напишите программу для сортировки массива, использующую метод пузырька. Сортировка должна происходить в отдельной функции, принимающей на вход исходный массив.

var unsortedArray: [Int] = [10, 3, 5, -6, 1, 2, 3, 0]

func bubbleSortArray(array: [Int]) -> [Int] {
    
    var newArray = array
    
    for i in 0..<newArray.count {
        
        let index = (array.count - 1 ) - i
        
        for j in 0..<index{
            if newArray[j] > newArray[j + 1] {
                let el = newArray[j]
                newArray[j] = newArray[j + 1]
                newArray[j + 1] = el
            }
        }
    }
    return newArray
}

print(bubbleSortArray(array: unsortedArray))

// MARK: - Task 7
// 7. Напишите программу, решающую задачу: есть входящая строка формата "abc123", где сначала идет любая последовательность букв, потом число. Необходимо получить новую строку, в конце которой будет число на единицу больше предыдущего, то есть "abc124".

var smtString: String = "abc123"

func plusOne(_: String) -> String {
    
    let text = smtString.components(separatedBy: .decimalDigits).joined(separator: "") // Находим текст
    var numbersString = smtString
        .map({ "\($0)" }) //преобразуем в массив
        .compactMap( { Int($0) }) // находим числа
        .map( { "\($0)" } ) // преобразуем числа в строки
        .joined(separator: "") // объединяем одну строку
    
    guard let intNumber = Int(numbersString) else { return ""} //преобразуем строку в Int
    numbersString = "\(intNumber + 1)" // прибавляем единицу к числу и обратно преобразуем в String
    return text + numbersString
}
print(plusOne(smtString))

