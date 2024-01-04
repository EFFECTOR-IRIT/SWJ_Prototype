# SWJ Prototype - e-CISE usage scenarii

Version 1.0.0

**Table of Contents**

- [1. General purpose](#general-purpose)
- [2. Repository structure](#repository-structure)
- [3. Deploy SPARQL endpoint using Ontop Docker](#deploy-sparql-endpoint-using-ontop-docker)
- [4. Use UC1 or UC2](#use-uc1-or-uc2)

## General purpose

SWJ Prototype is an implementation of two use cases using e-CISE ontology. This prototype is linked to the 'OWL Representation of the Common Information Sharing Environment Data Scheme for the Maritime Domain' article written by Antoine Dupuy, Nathalie Aussenac-Gilles, Catherine Comparot, Nabil El-Malki, Ronan Tournier, Ba Huy Tran, Cassia Trojahn from the Institut de Recherche en Informatique de Toulouse, France.

## Repository structure

~~~
.
├── data
│   └── dataset
│       ├── uc1
|       |    ├── init.sql
|       |    ├── uc1_agent.csv
|       |    ├── uc1_anomaly.csv
|       |    ├── uc1_incident.csv
|       |    ├── uc1_rfi.csv
|       |    ├── uc1_vessel_ano.csv
|       |    ├── uc1_vessel_loc.csv
|       |    └── uc1_vessel.csv
|       |
│       └── uc2
|            ├── init.sql
|            ├── uc2_agent.csv
|            ├── uc2_anomaly.csv
|            ├── uc2_incident.csv
|            ├── uc2_rfi.csv
|            ├── uc2_vessel_ano.csv
|            ├── uc2_vessel_loc.csv
|            └── uc2_vessel.csv
|
├── docs
|   ├── Deliverable ANDROMEDA_D3.1_model eCISE.pdf
|   └── SWJ ETSI CDM uses cases.pdf
|
├── jdbc
│   └── postgresql-42.3.3.jar
|
├── obda
│   ├── catalog-v001.xml
│   ├── ecise.obda
│   ├── ecise.owl
│   ├── ecise.properties
│   ├── ecise.q
│   ├── ecise.r2rml
│   ├── ecise.toml
│   └── wait-for-it.sh
│
├── .env
├── .gitignore
├── docker-compose.yaml
├── LICENSE
└── README.md

~~~

- `data`: Postgresql SATAIS database
- `ecise_db.obda`: Mapping file (Ontop syntax)
- `ecise_db.r2rml`: Mapping file (R2RML syntax) => empty for now
- `ecise-ontology-1.4.1.owl`: Ontology file
- `ecise_db.properties`: Properties file
- `ecise_db.q`: Queries file for Protege


## Deploy SPARQL endpoint using Ontop Docker

### Requirements
* [Docker](https://docs.docker.com/get-docker/), version 17.09.0 or higher
* [Docker Compose](https://docs.docker.com/compose/install/), version 1.17.0 or higher

### Steps

1) to start the prototype, downloading / building the required images and containers if needed
  ```
  docker-compose up
  ```
  (note: may add option `-d` to run in background, in which case logs are not be displayed to standard output but are still accessible via `docker-compose logs`)

**Services** When running, the prototype exposes the following services:

* a PostgreSQL server with the sample data, with connection information defined in the [.env](`.env`) file. 

* a Web portal of the SPARQL endpoint backed by ontop at URL <http://localhost:8080/>
  
* a SPARQL endpoint backed by ontop at URL <http://localhost:8080/sparql>

* a PgAdmin web portal to visualize the SATAIS database at <http://localhost:5050/>

2) to stop the prototype, if running
  ```
  docker-compose down
  ```

3) to stop the prototype, if running, and also clean any image / container / data associating to it (useful for cleaning up)
  ```
  docker-compose down --volumes --remove-orphans
  ```
  (note: the above command does not remove Docker images that may result being unused after stopping and removing this prototype containers; to remove such images, add option `--rmi all`)

4) to check the status of the containers forming the prototype
  ```
  docker-compose ps
  ```

5) to check the logs of specific container(s) or of all containers (if no container name is supplied)
  ```
  docker-compose logs <container name 1> ... <contaner name N>
  ```

## Use UC1 or UC2

Change **USE_CASE** environment variable in the .env file with value **uc1** or **uc2**.
