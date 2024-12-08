Logical: BMI
Parent: Base
Id: BodyMassIndex
Title: "Body Mass Index LM"
Description: "This is the Logical Model for **Body Mass Index**"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/BodyMassIndex"
* . ^definition = "Body Mass Index"

* insert HeaderDetailRules

* value 1..1 positiveInt "value"
//  * obeys should-be-between-25-30

* unit 1..1 CodeableConcept "units"
* unit from http://vitals.oemig.de/fhir/ValueSet/BMIunits (required)

* range 0..* BackboneElement "reference range"
  * low 0..1 integer "Low Range, if relevant"
  * high 0..1 integer "High Range, if relevant"
  * age 0..1 Range "Applicable age range, if relevant"
  * text 0..1 string "Text based reference range in an observation"

* interpretation 0..1 SU CodeableConcept "overall clinical meaning of the BP measurement"
* interpretation from http://vitals.oemig.de/fhir/ValueSet/Interpretation (required)

* dataAbsentReason 0..1 CodeableConcept "Why the component result is missing"
* dataAbsentReason from http://hl7.org/fhir/ValueSet/data-absent-reason (required)

* effective[x] 0..1 SU date or instant or Period "date of observation" "different representations"

//* bodyWeight 0..1 BodyWeight "body weight"
//* bodyHeight 0..1 BodyHeight "body height"


* comment 0..1 string "any comment"

* subject 0..1 Reference(Patient) "reference to the subject of the measurement"
* author 0..1 Reference(Practitioner) "reference to the author of the measurement"
* performer 0..1 Reference(Practitioner) "reference to the performer of the measurement"




// @Name: String Length Invariant
// @Description: Limit string length invariant
//Invariant:   should-be-between-25-30
//Description: "Value SHALL be <1000 mmHg for valid data."
//Expression:  "$this > 25 and $this < 30"
//Severity:    #error





ValueSet: BMIunits
Id: BMIunits
Title: "BMI Units"
Description: "**Units for calculating BMI**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/BMIunits"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^compose.include[+].system = "http://unitsofmeasure.org"
* ^compose.include[=].concept[+].code = #kg/m2






ValueSet: Interpretation
Id: Interpretation
Title: "Interpretation"
Description: "**Interpretation** (to be replaced by V3 VS)"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/Interpretation"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^compose.include[+].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* ^compose.include[=].concept[+].code = #A
* ^compose.include[=].concept[+].code = #AA
* ^compose.include[=].concept[+].code = #HH
* ^compose.include[=].concept[+].code = #LL
* ^compose.include[=].concept[+].code = #H
* ^compose.include[=].concept[+].code = #HU
* ^compose.include[=].concept[+].code = #L
* ^compose.include[=].concept[+].code = #LU
* ^compose.include[=].concept[+].code = #N

