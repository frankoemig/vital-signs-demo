CodeSystem: ObservationCodes
Id: ObservationCodes
Title: "Observation Codes"
Description: "**Observation Codes** (for temporary use only; to be replaced later on)"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/ObservationCodes"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #exertion "extertion"
* #location "location"
* #position "position"
* #sleepStatus "sleep status"
* #meanArterial "mean arterial pressure"

//for convenience (for the moment, to be replaced later)
* #CWE "v2 DT CWE"
* #NM "v2 DT NM"




ValueSet: ObservationCodes
Id: ObservationCodes
Title: "Observation Codes"
Description: "**Observation Codes**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationCodes"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes




