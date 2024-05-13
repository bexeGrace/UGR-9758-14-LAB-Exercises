fun findMax(numbers: List<Int>): Int {
    if (numbers.isEmpty()) {
        throw NoSuchElementException("List is empty")
    }
    var max = numbers[0]
    for (number in numbers) {
        if (number > max) {
            max = number
        }
    }
    return max
}

fun filterEvenNumbers(numbers: List<Int>): List<Int> {
    val evenNumbers = mutableListOf<Int>()
    for (number in numbers) {
        if (number % 2 == 0) {
            evenNumbers.add(number)
        }
    }
    return evenNumbers
}

fun calculateAverage(numbers: List<Double>): Double {
    if (numbers.isEmpty()) {
        throw IllegalArgumentException("List is empty")
    }
    var sum = 0.0
    for (number in numbers) {
        sum += number
    }
    return sum / numbers.size
}
