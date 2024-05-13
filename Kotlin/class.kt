class BankAccount(
    private val accountNumber: String,
    private var balance: Double
) {
    fun deposit(amount: Double) {
        balance += amount
    }

    fun withdraw(amount: Double) {
        if (balance >= amount) {
            balance -= amount
        } else {
            println("Insufficient funds")
        }
    }

    fun printBalance() {
        println("Current Balance: $balance")
    }
}
