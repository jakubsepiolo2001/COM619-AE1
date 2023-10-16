/*
Copyright [yyyy] [name of copyright owner]

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

package org.project.map.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import org.apache.coyote.Response;
import org.project.map.model.MapPoint;
import org.project.map.repository.MapPointRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.stream.Collectors;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;

import javax.validation.Valid;

/**
 * Created by pingwin on 25.10.16.
 */
@RestController
public class MapPointRestController {


    @Autowired
    MapPointRepository mapPointRepository;

    /////////////////////////////////////////
    ////////////GET REQUESTS////////////////
    ///////////////////////////////////////

    @Operation(summary = "Get a list of map points")
    @RequestMapping(path="/get/all", method= RequestMethod.GET)
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Found points in database", content = {
                    @Content(mediaType = "application/json", array = @ArraySchema(schema = @Schema(implementation = MapPoint.class)))
            }),
            @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
            @ApiResponse(responseCode = "404", description = "Did not find any points in database", content = @Content)
    })
    public ResponseEntity<List<MapPoint>> list() {
        //Simply return all points
        return ResponseEntity.ok(mapPointRepository.findAll());
    }

   @Operation(summary = "Get a specific map point by id")
   @ApiResponses(value = {
           @ApiResponse(responseCode = "200", description = "Found point in database with matching ID", content = {
                   @Content(mediaType = "application/json", schema = @Schema(implementation = MapPoint.class))
           }),
           @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
           @ApiResponse(responseCode = "404", description = "Did not find any points in database with supplied ID", content = @Content)
   })
   @RequestMapping(path="/get/id/{id}", method= RequestMethod.GET)
    public ResponseEntity<Optional<MapPoint>> getById(@Parameter(description = "ID of point to be retrieved") @PathVariable(value = "id") long id){
        //Find a specific point by the ID passed through parameter
        Optional<MapPoint> mpo = mapPointRepository.findById(id);
        return (mpo.isEmpty()) ? ResponseEntity.notFound().build() : ResponseEntity.ok(mpo);
    }

    @Operation(summary = "Get a specific map point by Category")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Found points in database with matching category", content = {
                    @Content(mediaType = "application/json", array = @ArraySchema(schema = @Schema(implementation = MapPoint.class)))
            }),
            @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
            @ApiResponse(responseCode = "404", description = "Did not find any points in database with the provided category", content = @Content)
    })
    @RequestMapping(path="/get/category/{category}", method= RequestMethod.GET)
    public ResponseEntity<List<MapPoint>> getByCategory(@Parameter(description = "Category of point to be retrieved") @PathVariable(value = "category") String category){
        //Get all points that exist
        Iterable<MapPoint> mpo = mapPointRepository.findAll();
        //Create a temporary list
        List<MapPoint> matchingMapPoints = new ArrayList<>();
        for (MapPoint point : mpo) {
            if (point.getCategory().equals(category)) {
                //If the point category matches, add to temporary list
                matchingMapPoints.add(point);
            }
        }
        //Return temporary list
        return ResponseEntity.ok(matchingMapPoints);
    }

    /////////////////////////////////////////
    ////////////POST REQUESTS///////////////
    ///////////////////////////////////////

    @Operation(summary = "Create a new point")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Map point created successfully", content = {
                    @Content(mediaType = "application/json", schema = @Schema(implementation = MapPoint.class))
            }),
            @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
            @ApiResponse(responseCode = "500", description = "Internal server error", content = @Content)
    })
    @RequestMapping(path="/add/", method= RequestMethod.POST)
    public ResponseEntity<MapPoint> createMapPoint(
            @Parameter(description = "MapPoint details to be created", required = true)
            @Valid @RequestBody MapPoint mapPointRequest) {
        //Save the new point
        MapPoint createdMapPoint = mapPointRepository.save(mapPointRequest);

        //Return the point with the appropriate response (201)
        return ResponseEntity.status(HttpStatus.CREATED).body(createdMapPoint);
    }

    @Operation(summary = "Delete a specific point by ID")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "204", description = "Point deleted successfully"),
            @ApiResponse(responseCode = "400", description = "Bad request", content = @Content),
            @ApiResponse(responseCode = "404", description = "Did not find any Point with the supplied ID", content = @Content)
    })
    @RequestMapping(path="/delete/id/{id}", method= RequestMethod.POST)
    public ResponseEntity<Void> deleteMapPointById(
            @Parameter(description = "ID of Point to be deleted", required = true)
            @PathVariable("id") long id) {
        //Search for point first
        Optional<MapPoint> mapPointOptional = mapPointRepository.findById(id);

        if (mapPointOptional.isPresent()) {
            //If it exists then delete it
            mapPointRepository.deleteById(id);
            return ResponseEntity.noContent().build(); // HttpStatus.NO_CONTENT (204)
        } else {
            //Otherwise send a 404 response
            return ResponseEntity.notFound().build(); // HttpStatus.NOT_FOUND (404)
        }
    }

}
