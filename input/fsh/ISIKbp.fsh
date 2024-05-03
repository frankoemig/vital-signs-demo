Profile: IsikBloodPressure
Id: IsikBloodPressure
Parent: Observation
Title: "Blood Pressure in ISiK"
Description: "**Blood Pressure according to ISiK**"

* ^version = "0.1.0"
* ^abstract = false
//* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/Observation-IsikBloodPressure"
* . ^definition = "Blood Pressure Profile according to ISiK"

* insert HeaderDetailRules

* status 1..1 MS SU
* category 1..* MS

* code 1..1 MS SU
  * coding 1..* MS SU
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #openAtEnd

  * coding contains loinc 1..1 and snomed 0..*

* subject 1..1 MS SU
* subject only Reference(Patient)
* encounter 1..1 MS
* effective[x] 1..1 MS
* performer 0..1 MS SU
* dataAbsentReason 0..1 MS
* method 0..1 MS
* device 0..1 MS

* component 2..4 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #openAtEnd
  
* component contains SystolicBP 1..1 and DiastolicBP 1..1 and meanBP 0..1

* component[SystolicBP].code 1..1 MS
* component[SystolicBP].code.coding 0..* MS
* component[SystolicBP].value[x] 0..1 MS
* component[SystolicBP].valueQuantity 0..1 MS
* component[SystolicBP].dataAbsentReason 0..1 MS

* component[DiastolicBP].code 1..1 MS
  * coding 0..* MS

* component[meanBP].code 1..1 MS
  * coding 0..* MS

