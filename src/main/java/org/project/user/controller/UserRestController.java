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


package org.project.user.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.project.user.model.User;
import org.project.user.model.UserDTO;
import org.project.user.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

//TODO Convert to OpenAPI Format
@RestController
@RequestMapping("/")
public class UserRestController {

    final static Logger LOG = LogManager.getLogger(UserRestController.class);
    @Autowired
    UserRepository userRepository;

    @Operation(summary = "Get a list of all users")
    @RequestMapping(path="/get/user/all", method= RequestMethod.GET)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Found users in database", content = {
                    @Content(mediaType = "application/json", array = @ArraySchema(schema = @Schema(implementation = UserDTO.class)))
            }),
            @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
            @ApiResponse(responseCode = "404", description = "Did not find any users in database", content = @Content)
    })
    public ResponseEntity<List<UserDTO>> list() {
        List<User> users = userRepository.findAll();
        List<UserDTO> userDTOs = users.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(userDTOs);
    }

    private UserDTO convertToDTO(User user) {
        UserDTO dto = new UserDTO();
        dto.setId(user.getId());
        dto.setFirstName(user.getFirstName());
        dto.setSecondName(user.getSecondName());
        dto.setUsername(user.getUsername());
        dto.setUserRole(user.getUserRole());
        dto.setEnabled(user.getEnabled());
        return dto;
    }

}
