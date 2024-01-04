[QueryItem="UC1 - Vessel VESS_UC1"]
prefix : <https://w3id.org/ecise#>

SELECT ?incident ?type ?date ?time WHERE {
  ?so :hasSubjectObjectObject :123456789 .
  ?so :hasSubjectObjectInIncident ?incident .
  ?incident :hasMaritimeSafetyIncidentMaritimeSafetyIncidentType ?type .
  ?incident :hasEventOccurrencePeriod ?period .
  ?period :startdate ?date .
  ?period :starttime ?time 
} 


[QueryItem="UC1 - Anomaly by MAC2"]
prefix : <https://w3id.org/ecise#>

SELECT ?anomaly ?type ?date ?time ?lat ?lon WHERE {
  ?el :hasEventLocationLocation ?loc .
  ?el :hasEventLocationEvent ?anomaly .
  ?anomaly :hasMaritimeAnomalyMaritimeAnomalyType ?type .
  ?el :hasEventLocationDateTime ?period .
  ?ae :hasAgentEventAgent :MAC2 .
  ?ae :hasAgentEventEvent ?anomaly .
  ?period :startdate ?date .
  ?period :starttime ?time .
  ?loc :hasLocationGeometry ?geom .
  ?geom :latitude ?lat .
  ?geom :longitude ?lon 
}

[QueryItem="UC1 - VESS_UC1 locations"]
prefix : <https://w3id.org/ecise#>

SELECT ?loc ?lat ?lon ?date ?time WHERE {
  ?ol :hasObjectLocationLocation ?loc .
  ?ol :hasObjectLocationObject :123456789 .
  ?ol :hasObjectLocationPeriodOfTime ?period .
  ?period :startdate ?date .
  ?period :starttime ?time .
  ?loc :hasLocationGeometry ?geom .
  ?geom :latitude ?lat .
  ?geom :longitude ?lon 
} ORDER BY ASC(?time)


[QueryItem="UC1 - Anomalies by MAC1"]
prefix : <https://w3id.org/ecise#>

SELECT ?anomaly ?type ?date ?time ?lat ?lon WHERE {
  ?el :hasEventLocationLocation ?loc .
  ?el :hasEventLocationEvent ?anomaly .
  ?anomaly :hasMaritimeAnomalyMaritimeAnomalyType ?type .
  ?el :hasEventLocationDateTime ?period .
  ?ae :hasAgentEventAgent :MAC1 .
  ?ae :hasAgentEventEvent ?anomaly .
  ?period :startdate ?date .
  ?period :starttime ?time .
  ?loc :hasLocationGeometry ?geom .
  ?geom :latitude ?lat .
  ?geom :longitude ?lon 
}

[QueryItem="UC1 - Incidents by MAC2"]
prefix : <https://w3id.org/ecise#>

SELECT ?incident ?type ?date ?time WHERE {
  ?so :hasSubjectObjectObject :123456789 .
  ?so :hasSubjectObjectInIncident ?incident .
  ?incident :hasMaritimeSafetyIncidentMaritimeSafetyIncidentType ?type .
  ?incident :hasEventOccurrencePeriod ?period .
  ?period :startdate ?date .
  ?period :starttime ?time 
} 

[QueryItem="UC2 - TODO"]
SELECT ?s ?p ?o WHERE {
    ?s ?p ?o
} LIMIT 10
