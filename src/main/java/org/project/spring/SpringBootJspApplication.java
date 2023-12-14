/*
Copyright 2023 Git Guardians

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/


package org.project.spring;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.CommandLineRunner;
import org.project.map.model.MapPoint;
import org.project.map.repository.MapPointRepository;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

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