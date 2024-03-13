package com.anubhavpabby.springbootbasics.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/hello")
public class HelloController {

    @RequestMapping(value = "/spring-boot-basics", method = RequestMethod.GET)
    public String basicAppInfo() {
        return "Spring Boot application to learn the basics of Spring Boot";
    }

    @GetMapping("/welcome-user")
    public String welcomeUser() {
        return "Welcome to Anubhav Pabby's basic Spring Boot Application";
    }
}
