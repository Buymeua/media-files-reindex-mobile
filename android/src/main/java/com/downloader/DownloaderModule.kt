package com.mediafilesreindexmobile

import com.facebook.react.bridge.*
import io.ktor.client.*
import io.ktor.client.request.*
import kotlinx.coroutines.*
import java.io.File

class DownloaderModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    private val client = HttpClient()

    override fun getName(): String {
        return "Downloader"
    }

    @ReactMethod
    fun downloadFile(url: String, outputPath: String, promise: Promise) {

        GlobalScope.launch {
            try {
                val response: ByteArray = client.get(url)
                File(outputPath).writeBytes(response)
                promise.resolve("File downloaded successfully to $outputPath")
            } catch (e: Exception) {
                promise.reject("Download Error", e)
            }
        }
    }

    override fun onCatalystInstanceDestroy() {
        super.onCatalystInstanceDestroy()
        client.close() // Закрываем клиент, если модуль уничтожен
    }
}
