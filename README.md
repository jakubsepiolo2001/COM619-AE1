

<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]





<h3 align="center">Git Guardians COM619 Dev ops</h3>

  <p align="center">
    <br />
    <a href="https://github.com/jakubsepiolo2001/COM619-AE1/wiki"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://com619-1-vm.uksouth.cloudapp.azure.com/">View Demo</a>
    ·
    <a href="https://github.com/jakubsepiolo2001/COM619-AE1/issues">Report Bug</a>
    ·
    <a href="https://www.youtube.com/watch?v=Lop1XAx9JyA">Project Video</a>
  </p>
</div>







<!-- ABOUT THE PROJECT -->
## About The Project

   This project entails a spring-boot application which utilities several different technologies to create a complete application that follows the ideas of an industry level application which uses dev ops practices.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![springboot][spring.io]][spring-url]
* [![nginx][nginx.com]][nginx-url]
* [![mysql][mysql.com]][mysql-url]
* [![swagger][swagger.io]][swagger-url]
* [![azure][azure.com]][azure-url]
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

The following are instructions on how to get either a local hosted application running or an application hosted in a remote virtual machine

### Prerequisites

* Java (Java 19 is recommended)
  https://www.java.com/download/ie_manual.jsp
 * Docker Desktop 
 https://www.docker.com/products/docker-desktop/
 * Firefox (Required for build testing)
 https://www.mozilla.org/en-GB/firefox/new/
 

### Local Build

1. Ensure you have Java, Docker Desktop and Firefox installed
2. Clone the repo
   ```sh
   git clone https://github.com/jakubsepiolo2001/COM619-AE1.git
   ```
3. Create a clean maven build
   ```sh
   mvn clean insall
   ```
4. Launch Docker Desktop on your machine
5. Run the appropriate docker-compose command to spin up the containers
   ```sh
   docker-compose -f docker-compose-dev.yml up
   ```
6. Visit the website at localhost:8080

### Remote Build

1. Ensure you have Java, Docker Desktop and Firefox installed on your remote machine
2. Clone the repo
   ```sh
   git clone https://github.com/jakubsepiolo2001/COM619-AE1.git
   ```
3. Update line 45 in `docker-compose.yml` contained in the root folder ``
   command: certonly --webroot -w /var/www/certbot/  --staging --force-renewal --email 5dawes65@solent.ac.uk -d com619-1-vm.uksouth.cloudapp.azure.com --agree-tos
   `` with your email and hosted url to ensure you generate a certificate for your site
  4. Update the API URL to your hosted URL at line 1 in `src/main/resources/application-prod.properties` which by default is `api.base-url=https://com619-1-vm.uksouth.cloudapp.azure.com/`
5. Create a clean maven build
   ```sh
   sudo mvn clean insall
   ```
6. Run the appropriate docker-compose command to spin up the containers
   ```sh
   sudo docker-compose -f docker-compose.yml up
   ```
7. Visit the website at your hosted address

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Once the application is up and running you should be able to perform the following functionality

 1. Login as either an admin `globaladmin:globaladmin` or user `user1234:user1234`
 2. Create points under the map page
 3. View points contained in the database
 4. Modify points contained in the database if you are an admin
 5. Modify users in the databse if you are an admin
 6. Modify your own information as a user
 7. Visit the API Documentation which by default is contained at `/swagger-ui/index.html`

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the Apache License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

| Team Member | Email Address | GitHub Name |
| --------- | --------- | --------- |
| Jakub Sepiolo | 5sepij35@solent.ac.uk | jakubsepiolo2001 |
| Tyler Short | 5short82@solent.ac.uk | Tyler-Short1 |
| Owen Bradstreet | 5brado63@solent.ac.uk | owenbradstreet |
| Luke Wood | 5woodl59@solent.ac.uk | lwoodremote |
| Steve Dawe | 5dawes65@solent.ac.uk | 5Dawe |


Project Link: [https://github.com/jakubsepiolo2001/COM619-AE1](https://github.com/jakubsepiolo2001/COM619-AE1)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/jakubsepiolo2001/COM619-AE1.svg?style=for-the-badge
[contributors-url]: https://github.com/jakubsepiolo2001/COM619-AE1/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/jakubsepiolo2001/COM619-AE1/network/members
[stars-shield]: https://img.shields.io/github/stars/jakubsepiolo2001/COM619-AE1.svg?style=for-the-badge
[stars-url]: https://github.com/jakubsepiolo2001/COM619-AE1/stargazers
[issues-shield]: https://img.shields.io/github/issues/jakubsepiolo2001/COM619-AE1.svg?style=for-the-badge
[issues-url]: https://github.com/jakubsepiolo2001/COM619-AE1/issues
[license-shield]: https://img.shields.io/github/license/jakubsepiolo2001/COM619-AE1.svg?style=for-the-badge
[license-url]: https://github.com/jakubsepiolo2001/COM619-AE1/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[spring.io]: https://img.shields.io/badge/springboot-000000?style=for-the-badge&logo=springboot&logoColor=green
[spring-url]: https://spring.io/
[nginx.com]: https://img.shields.io/badge/nginx-000000?style=for-the-badge&logo=nginx&logoColor=white
[nginx-url]: https://www.nginx.com/
[mysql.com]: https://img.shields.io/badge/MySQL-000000?style=for-the-badge&logo=mysql&logoColor=yellow
[mysql-url]: https://www.mysql.com/
[docker.com]: https://img.shields.io/badge/DOCKER-000000?style=for-the-badge&logo=docker&logoColor=blue
[docker-url]: https://www.docker.com/
[swagger.io]: https://img.shields.io/badge/openapi-000000?style=for-the-badge&logo=swagger&logoColor=lightgreen
[swagger-url]: https://swagger.io/
[azure.com]: https://img.shields.io/badge/azure-000000?style=for-the-badge&logo=microsoftazure&logoColor=lightblue
[azure-url]: https://azure.microsoft.com/en-gb


