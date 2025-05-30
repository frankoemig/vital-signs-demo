CodeSystem: ObservationCategoryCS
Id: ObservationCategoryCS
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
    * #vital-sign-sbp "systolic blood pressure"
    * #vital-sign-dbp "diastolic blood pressure"
  * #vital-sign-bw "body weight"
  * #vital-sign-bh "body height"
  * #vital-sign-bmi "BMI" "body mass index"
  * #vital-sign-xyz "xyz" "what other codes are necessary?"
* #social-history "social history"



ValueSet: ObservationCategoryVS
Id: ObservationCategoryVS
Title: "Observation Category"
Description: "**Observation Category**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory



ValueSet: ObservationVitalSignsCategory
Id: ObservationVitalSignsCategory
Title: "Observation Vital Signs Category"
Description: "**Observation Vital Signs Category**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationVitalSignsCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

//* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory where code descendent-of #vital-sign

* ^compose.include[+].system = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory"
* ^compose.include[=].concept[+].code = #vital-sign
* ^compose.include[=].concept[+].code = #vital-sign-bp
* ^compose.include[=].concept[+].code = #vital-sign-bw
* ^compose.include[=].concept[+].code = #vital-sign-bh
* ^compose.include[=].concept[+].code = #vital-sign-bmi




ValueSet: ObservationVitalSignsBPCategory
Id: ObservationVitalSignsBPCategory
Title: "Observation Vital Signs Category"
Description: "**Observation Vital Signs Blood Pressure Category**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/ObservationVitalSignsBPCategory"
* ^version = "0.1.0"

* insert HeaderDetailRules

//* include codes from system http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory where code descendent-of #vital-sign-bp

* ^compose.include[+].system = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory"
* ^compose.include[=].concept[+].code = #vital-sign-bp
