package org.project.spring;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.CommandLineRunner;
import org.project.map.model.MapPoint;
import org.project.map.repository.MapPointRepository;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.util.Locale;

@SpringBootApplication(scanBasePackages = {"org.project.map", "org.project.spring", "org.project.user", "org.project.map.repository", "org.project", "org.project.spring.controller"})
public class SpringBootJspApplication extends SpringBootServletInitializer {

    @Bean
    CommandLineRunner runner(MapPointRepository mapPointRepository) {
        return args -> {
            // Retrieve existing points from the database
            Iterable<MapPoint> existingPoints = mapPointRepository.findAll();

            // Check if points exist before adding sample points
            if (!existingPoints.iterator().hasNext()) {
                // Add sample points only if no points exist
                MapPoint point1 = new MapPoint("No DB", "This point was created because of no DB", "POI", 51, 51);
                // Save the sample points to the database
                mapPointRepository.save(point1);
            }
        };
    }


    public static void main(String[] args) {
        SpringApplication.run(SpringBootJspApplication.class);
    }
}