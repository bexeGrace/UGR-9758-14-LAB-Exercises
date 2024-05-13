fun main() {
    val distanceValue = 100.0
    val initialUnit = "kilometers"
    val targetUnit = "miles"

    val convertedValue = when (initialUnit) {
        "kilometers" -> distanceValue * 0.621371
        "miles" -> distanceValue / 0.621371
        else -> throw IllegalArgumentException("Invalid unit")
    }

    println("Converted value from $initialUnit to $targetUnit: $convertedValue")
}
