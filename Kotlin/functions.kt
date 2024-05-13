fun analyzeString(input: String): Triple<Int, Int, Int> {
    val wordCount = input.split("\\s+".toRegex()).size
    val uppercaseCount = input.count { it.isUpperCase() }
    val vowelCount = input.count { it.toLowerCase() in "aeiou" }
    return Triple(wordCount, uppercaseCount, vowelCount)
}

fun main() {
    val inputString = "Hello World! This is a Sample String with 5 Words and 3 Uppercase Letters."
    val (wordCount, uppercaseCount, vowelCount) = analyzeString(inputString)
    println("Number of Words: $wordCount")
    println("Number of Uppercase Letters: $uppercaseCount")
    println("Number of Vowels: $vowelCount")
}
