/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.project.user.spring.service;

import org.project.user.repository.PersistenceJPAConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 *
 * @author owenb
 */
@Configuration

@ComponentScan(basePackages = {"org.project.user.spring.service"})
@Import({PersistenceJPAConfig.class})
public class ServiceConfiguration {

}
