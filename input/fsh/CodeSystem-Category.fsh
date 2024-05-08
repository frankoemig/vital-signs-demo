CodeSystem: ObservationCategory
Id: ObservationCategory
Title: "Observation Category"
Description: "**Observation Category**"

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
  * #diagnostic "diagnostic procedure, e.g. x-ray"
    * #survey "survey"
    * #imaging "imaging"
    * #laboratory "laboratory"
    * #exam "physical examinations"
    * #activity "physical activity of the subbject"
  * #therapy "treatment procedure, e.g. medication"
    * #medication "medication procedure"
  * #caring "caring procedures, eg. feeding"
* #vital-sign "vital sign"
  * #vital-sign-bp "blood pressure"
  * #vital-sign-bw "body weight"
  * #vital-sign-bh "body height"
  * #vital-sign-bmi "BMI" "body mass index"
* #social-history "social history"

ValueSet: ObservationCategory
Id: ObservationCategory
Title: "Observation Category"
Description: "**Observation Category**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory




