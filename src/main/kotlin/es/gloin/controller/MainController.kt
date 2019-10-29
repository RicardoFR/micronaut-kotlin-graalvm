package es.gloin.controller

import io.micronaut.http.HttpResponse
import io.micronaut.http.annotation.Controller
import io.micronaut.http.annotation.Get
import io.micronaut.http.HttpStatus
import java.io.File

@Controller("/api")
class MainController {

    @Get("/test")
    fun test(): HttpStatus {
        return HttpStatus.OK
    }

    @Get("/image")
    fun image(): HttpResponse<Any> {
        return HttpResponse
                .ok<Any>()
                .status(200)
                .header("Content-Type", "image/png")
                .body(File(ClassLoader.getSystemResource("kotlin.png").file))
    }
}