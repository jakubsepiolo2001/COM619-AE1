package org.project.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;

@Controller
public class LocaleController {

    private final LocaleResolver localeResolver;

    public LocaleController(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }

    @GetMapping("/change-locale")
    public String changeLocale(@RequestParam String lang, HttpServletRequest request, HttpServletResponse response) {
        // Set the locale in the session
        localeResolver.setLocale(request, response, new Locale(lang));

        // Print to console for debugging
        System.out.println("Changed to: " + lang);

        // Redirect back to the referring page
        return "redirect:" + request.getHeader("Referer");
    }
}