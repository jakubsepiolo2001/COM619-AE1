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

package org.project.spring.service;

import org.project.user.repository.PersistenceJPAConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@Configuration
@EnableJpaRepositories(basePackages = {
        "org.project.map.repository",
        "org.project.user.repository"
})
@ComponentScan(basePackages = {"org.project.spring.service", "org.project.map.repository", "org.project.user.repository", "org.project.spring.controller"})
@Import({PersistenceJPAConfig.class})
public class ServiceConfiguration {

}

