/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.project.spring.service;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.servers.Server;
import org.project.user.repository.PersistenceJPAConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 *
 * @author cgallen
 */
@Configuration
@EnableJpaRepositories(basePackages = {
        "org.project.map.repository",
        "org.project.user.repository"
})
@ComponentScan(basePackages = {"org.project.spring.service", "org.project.map.repository", "org.project.user.repository"})
@Import({PersistenceJPAConfig.class})
public class ServiceConfiguration {

}

