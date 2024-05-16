Logical: BodyHeight
Parent: Base
Id: BodyHeight
Title: "Body Height LM"
Description: "LM for **Body Height**"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/BodyHeight"
* . ^definition = "Body Weight"

* insert HeaderDetailRules

* height 1..1 BackboneElement "body height"
  * value 1..1 positiveInt "value"
    * obeys shall-be-under-250-cm
  * unit 1..1 CodeableConcept "units"
  * unit from http://vitals.oemig.de/fhir/ValueSet/BHunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"

* measuringType 0..1 CodeableConcept "measuring type"
* measuringType from http://vitals.oemig.de/fhir/ValueSet/MeasuringType (required)

* shoes 0..1 boolean "wearing shoes during measurement"

* subject 0..1 Reference(Patient) "reference to the subject of the measurement"
* author 0..1 Reference(Practitioner) "reference to the author of the measurement"
* performer 0..1 Reference(Practitioner) "reference to the performer of the measurement"






// @Name: String Length Invariant
// @Description: Limit string length invariant
Invariant:   shall-be-under-250-cm
Description: "Value SHALL be <250 cm for valid data."
Expression:  "$this < 250"
Severity:    #error





CodeSystem: MeasuringType
Id: MeasuringType
Title: "MeasuringType"
Description: "**Measuring Type**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/MeasuringType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/MeasuringType"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #measured "value has been measured" 
* #estimated "value is an estimation"


ValueSet: MeasuringType
Id: MeasuringType
Title: "Measuring Type"
Description: "**Measuring Type**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/MeasuringType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/MeasuringType




ValueSet: BHunits
Id: BHunits
Title: "Body Height Units"
Description: "**Units for measuring Body Height**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/BHunits"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^compose.include[+].system = "http://unitsofmeasure.org"
* ^compose.include[=].concept[+].code = #cm
* ^compose.include[=].concept[+].code = #m
* ^compose.include[=].concept[+].code = #ft
//* ^compose.include[=].concept[+].code = #in_i
//* ^compose.include[=].concept[+].code = #ft_i



