fun main() {
    val passwordLength = 8
    val charPool = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?/{}[]|"

    var password = ""
    repeat(passwordLength) {
        val randomIndex = (0 until charPool.length).random()
        password += charPool[randomIndex]
    }

    println("Generated Password: $password")
}
