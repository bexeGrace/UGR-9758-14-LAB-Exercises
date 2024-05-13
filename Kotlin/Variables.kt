fun main() {
    print("Enter the first number: ")
    val num1 = readLine()!!.toDouble()

    print("Enter the second number: ")
    val num2 = readLine()!!.toDouble()

    print("Enter the operation (+, -, *, /): ")
    val operation = readLine()!!

    val result = when(operation) {
        "+" -> num1 + num2
        "-" -> num1 - num2
        "*" -> num1 * num2
        "/" -> num1 / num2
        else -> throw IllegalArgumentException("Invalid operation")
    }

    println("Result: $result")
}
