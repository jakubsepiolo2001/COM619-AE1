package org.project.spring;

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

            MapPoint point1 = new MapPoint("Point 1", "Some point", "POI", 54, 17);
            MapPoint point2 = new MapPoint("Point 2", "Some point", "Nature", 55, 17);
            MapPoint point3 = new MapPoint("Point 3", "Some point", "Shop", 56, 17);
            MapPoint point4 = new MapPoint("Point 4", "Some point", "POI", 57, 17);
            mapPointRepository.save(point1);
            mapPointRepository.save(point2);
            mapPointRepository.save(point3);
            mapPointRepository.save(point4);

        };
    }


    public static void main(String[] args) {
        SpringApplication.run(SpringBootJspApplication.class);
    }
}