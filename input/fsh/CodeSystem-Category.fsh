CodeSystem: ObservationCategory
Id: ObservationCategory
Title: "Observation Category"
Description: "**Observaiton Category**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/ObservationCategory"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #procedure "any procedure"
* #vital-sign "vital sign"
  * #vital-sign-bp "blood pressure"
  * #vital-sign-bw "body weight"
  * #vital-sign-bh "body height"
  * #vital-sign-bmi "BMI" "body mass index"


ValueSet: ObservationCategory
Id: ObservationCategory
Title: "Observation Category"
Description: "**Observation Category**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory




