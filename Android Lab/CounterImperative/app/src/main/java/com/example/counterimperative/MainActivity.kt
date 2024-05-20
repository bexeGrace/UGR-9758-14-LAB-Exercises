package com.example.counterimperative

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView


class MainActivity : AppCompatActivity() {

    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val textViewCount = findViewById<TextView>(R.id.textViewCount)
        val buttonIncrement = findViewById<Button>(R.id.buttonIncrement)
        val buttonDecrement = findViewById<Button>(R.id.buttonDecrement)
        val buttonReset = findViewById<Button>(R.id.buttonReset)

        buttonIncrement.setOnClickListener {
            count++
            updateCount(textViewCount)
        }

        buttonDecrement.setOnClickListener {
            count--
            updateCount(textViewCount)
        }

        buttonReset.setOnClickListener {
            count = 0
            updateCount(textViewCount)
        }
    }

    private fun updateCount(textView: TextView) {
        textView.text = count.toString()
    }
}
