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
package org.project.service;

import org.project.user.repository.PersistenceJPAConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 *
 * @author cgallen
 */
@Configuration

@ComponentScan(basePackages = {"org.project.spring.service", "org.project.map.repository", "org.project.user.repository"})
@Import({PersistenceJPAConfig.class})
public class ServiceConfiguration {

}
