package org.project.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiConfig {
    @Value("${api.base-url}")
    private String apiUrl;

    public String getApiUrl() {
        return apiUrl;
    }
}
