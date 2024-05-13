fun toUpperCase(strings: List<String>): List<String> {
    return strings.map {
        it.toUpperCase()
    }
}

fun filterGreaterThan(numbers: List<Int>, threshold: Int): List<Int> {
    return numbers.filter {
        it > threshold
    }
}

fun calculateSum(numbers: List<Int>): Int {
    return numbers.reduce { acc, num ->
        acc + num
    }
}
