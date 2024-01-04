SET datestyle = euro;

-- AGENTS

CREATE TABLE agents (
  id INT NOT NULL,
  tag VARCHAR(50),
  PRIMARY KEY (id)
);

COPY agents
FROM '/docker-entrypoint-initdb.d/uc1_agent.csv'
DELIMITER ','
CSV HEADER;


-- VESSELS

CREATE TABLE vessels (
    id INT NOT NULL,
    mmsi VARCHAR(50),
    name VARCHAR(50),
    length INT,
    PRIMARY KEY (id)
);

COPY vessels
FROM '/docker-entrypoint-initdb.d/uc1_vessel.csv'
DELIMITER ','
CSV HEADER;


-- ANOMALIES

CREATE TABLE anomalies (
    id INT NOT NULL,
    tag VARCHAR(50),
    type VARCHAR(50),
    lat DECIMAL,
    lon DECIMAL,
    date DATE,
    time time,
    agent_id INT NOT NULL,
    PRIMARY KEY (id)
);

COPY anomalies(id, tag, type, lat, lon, date, time, agent_id)
FROM '/docker-entrypoint-initdb.d/uc1_anomaly.csv'
DELIMITER ';'
CSV HEADER;


-- VESSEL_LOCATIONS

CREATE TABLE vessel_locations (
    id INT NOT NULL,
    vessel_id INT NOT NULL,
    lat DECIMAL,
    lon DECIMAL,
    date DATE,
    time time,
    PRIMARY KEY (id)
);

COPY vessel_locations(id, vessel_id, lat, lon, date, time)
FROM '/docker-entrypoint-initdb.d/uc1_vessel_loc.csv'
DELIMITER ';'
CSV HEADER;


-- VESSEL_ANOMALIES

CREATE TABLE vessel_anomalies (
    id_anomaly INT NOT NULL,
    id_vessel INT NOT NULL,
    PRIMARY KEY (id_anomaly, id_vessel)
);

COPY vessel_anomalies
FROM '/docker-entrypoint-initdb.d/uc1_vessel_ano.csv'
DELIMITER ','
CSV HEADER;


-- INCIDENTS

CREATE TABLE incidents (
    id INT NOT NULL,
    tag VARCHAR(50),
    type VARCHAR(50),
    date DATE,
    time time,
    PRIMARY KEY (id)
);

COPY incidents
FROM '/docker-entrypoint-initdb.d/uc1_incident.csv'
DELIMITER ','
CSV HEADER;


-- VESSEL INCIDENTS

CREATE TABLE vessel_incidents (
    incident_id INT NOT NULL,
    vessel_id INT NOT NULL,
    PRIMARY KEY (incident_id, vessel_id)
);

COPY vessel_incidents
FROM '/docker-entrypoint-initdb.d/uc1_vessel_inc.csv'
DELIMITER ','
CSV HEADER;


-- RFI

CREATE TABLE rfi (
    id INT NOT NULL,
    tag VARCHAR(50),
    agent_id INT NOT NULL,
    vessel_id INT NOT NULL,
    PRIMARY KEY (id)
);

COPY rfi
FROM '/docker-entrypoint-initdb.d/uc1_rfi.csv'
DELIMITER ','
CSV HEADER;

-- DOCUMENTS

CREATE TABLE documents (
    id INT NOT NULL,
    title VARCHAR(50),
    type VARCHAR(50),
    vessel_id INT NOT NULL,
    PRIMARY KEY (id)
);

COPY documents
FROM '/docker-entrypoint-initdb.d/uc1_document.csv'
DELIMITER ','
CSV HEADER;

-- RISKS

CREATE TABLE doc_risks (
    id INT NOT NULL,
    tag VARCHAR(50),
    type VARCHAR(50),
    doc_id INT NOT NULL,
    PRIMARY KEY (id)
);

COPY doc_risks
FROM '/docker-entrypoint-initdb.d/uc1_risk_doc.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE anomaly_risks (
    id INT NOT NULL,
    tag VARCHAR(50),
    type VARCHAR(50),
    anomaly_id INT NOT NULL,
    PRIMARY KEY (id)
);

COPY anomaly_risks
FROM '/docker-entrypoint-initdb.d/uc1_risk_ano.csv'
DELIMITER ','
CSV HEADER;
