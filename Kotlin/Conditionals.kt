fun main() {
    print("Enter numeric grade (between 0 and 100): ")
    val grade = readLine()!!.toInt()

    val letterGrade = when {
        grade in 90..100 -> "A"
        grade in 80..89 -> "B"
        grade in 70..79 -> "C"
        grade in 60..69 -> "D"
        grade < 60 -> "F"
        else -> throw IllegalArgumentException("Invalid grade")
    }

    println("Letter grade: $letterGrade")
}
