Alias: $loinc = http://loinc.org
Alias: $us-core-vital-signs = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
Alias: $category = http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory

//Alias: $SleepStatusExt = http://hl7.org/fhir/us/vitals/StructureDefinition/SleepStatusExt
//Alias: $ExerciseAssociationExt = http://hl7.org/fhir/us/vitals/StructureDefinition/ExerciseAssociationExt
//Alias: $MeasurementSettingExt = http://hl7.org/fhir/us/vitals/StructureDefinition/MeasurementSettingExt

Alias: $bodyPositionVS = http://hl7.org/fhir/us/vitals/ValueSet/bodyPositionVS



Profile: USCoreModifiedVitalSigns
Parent: Observation
Id: us-core-modified-vital-signs
Title: "US Core Vital Signs (modified)"

Description: """
**This is a draft of the modified version for vital signs - not yet fully complete/verified!!!!**
"""

* ^experimental = false
* ^date = "2024-05-09"
* ^publisher = "HL7 International / Cross-Group Projects"

* status MS
* status from ObservationStatus (required)

* category only CodeableConcept
* category from http://vitals.oemig.de/fhir/ValueSet/ObservationVitalSignsCategory (required)

* code MS

* subject MS
* subject only Reference(Patient)

//* effective[x] 0..1 SU date or instant or Period "date of observation" "different representations"

* dataAbsentReason MS

* interpretation 0..1 MS

* component 0..* MS
  * code 1..1 MS
  * value[x] 0..1 MS
  * dataAbsentReason 0..1 MS




Profile: USCoreModifiedBloodPressureProfile
Parent: us-core-modified-vital-signs
Id: us-core-modified-blood-pressure
Title: "US Core Blood Pressure Profile (modified)"

Description: """
US Core Blood Pressure Profile inherits from the US Core Vital Signs Profile. 
This profile sets minimum expectations for the Observation resource to record, search, 
and fetch diastolic and systolic blood pressure observations with standard LOINC codes and UCUM units of measure. 
It specifies which *additional* core elements, extensions,  vocabularies, 
and value sets **SHALL** be present in the resource and constrains how the elements are used. 
Providing the floor for standards development for specific use cases promotes interoperability and adoption.

**This is the modified version - not yet fully complete/verified!!!!**
"""

* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.40.42.6"
* ^experimental = false
* ^date = "2024-05-08"
* ^publisher = "HL7 International / Cross-Group Projects"
* ^contact.name = "HL7 International / Cross-Group Projects"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cgp"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "cgp@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* . ^short = "US Core Blood Pressure Profile"

* extension contains
  ObsBodyPosition named bodyPosition 0..1 MS and
  SleepStatusExt named sleepStatus 0..1 MS and
  ExertionExt named exertion 0..1 MS
//  $SleepStatusExt named sleepStatus 0..1 MS and
//  $ExerciseAssociationExt named exerciseAssociation 0..1 MS and
//  $MeasurementSettingExt named measurementSetting 0..1 MS
  
* extension[bodyPosition] ^short = "Body Position"  

* extension[sleepStatus] ^short = "Sleep Status"  

* extension[exertion] ^short = "Exertion / Exercise Association"  

//* extension[measurementSetting] ^short = "Measurement Setting"  

* status MS


* category only CodeableConcept
* category = $category#vital-sign-bp

* code only CodeableConcept
* code from us-core-modified-blood-pressure-code (required)

* code MS
* code ^short = "Blood Pressure"

* bodySite 0..1 MS
* method 0..1 MS

* device 0..1 MS

* component ..* MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.ordered = false
* component ^slicing.rules = #open
* component ^short = "Component observations"
* component contains
    SystolicBP 1..1 MS and
    DiastolicBP 1..1 MS and
	MeanArterialBP 0..1 MS

* component[SystolicBP] ^short = "Systolic Blood Pressure"
* component[SystolicBP].code 1..1 MS
* component[SystolicBP].code = $loinc#8480-6
* component[SystolicBP].code ^short = "Systolic Blood Pressure Code"
* component[SystolicBP].valueQuantity only Quantity
* component[SystolicBP].valueQuantity MS
* component[SystolicBP].valueQuantity ^short = "Vital Sign Component Value"
* component[SystolicBP].valueQuantity.value 1..1 MS
* component[SystolicBP].valueQuantity.value only decimal
* component[SystolicBP].valueQuantity.unit 1..1 MS
* component[SystolicBP].valueQuantity.unit only string
* component[SystolicBP].valueQuantity.system 1..1 MS
* component[SystolicBP].valueQuantity.system only uri
* component[SystolicBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[SystolicBP].valueQuantity.code 1..1 MS
* component[SystolicBP].valueQuantity.code only code
* component[SystolicBP].valueQuantity.code = #mm[Hg] (exactly)

* component[DiastolicBP] ^short = "Diastolic Blood Pressure"
* component[DiastolicBP].code 1..1 MS
* component[DiastolicBP].code = $loinc#8462-4
* component[DiastolicBP].code ^short = "Diastolic Blood Pressure Code"
* component[DiastolicBP].valueQuantity only Quantity
* component[DiastolicBP].valueQuantity MS
* component[DiastolicBP].valueQuantity ^short = "Vital Sign Component Value"
* component[DiastolicBP].valueQuantity.value 1..1 MS
* component[DiastolicBP].valueQuantity.value only decimal
* component[DiastolicBP].valueQuantity.unit 1..1 MS
* component[DiastolicBP].valueQuantity.unit only string
* component[DiastolicBP].valueQuantity.system 1..1 MS
* component[DiastolicBP].valueQuantity.system only uri
* component[DiastolicBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[DiastolicBP].valueQuantity.code 1..1 MS
* component[DiastolicBP].valueQuantity.code only code
* component[DiastolicBP].valueQuantity.code = #mm[Hg] (exactly)

* component[MeanArterialBP] ^short = "Systolic Blood Pressure"
* component[MeanArterialBP].code 1..1 MS
* component[MeanArterialBP].code = $loinc#8478-0
* component[MeanArterialBP].code ^short = "Mean Arterial Blood Pressure Code"
* component[MeanArterialBP].valueQuantity only Quantity
* component[MeanArterialBP].valueQuantity MS
* component[MeanArterialBP].valueQuantity ^short = "Vital Sign Component Value"
* component[MeanArterialBP].valueQuantity.value 1..1 MS
* component[MeanArterialBP].valueQuantity.value only decimal
* component[MeanArterialBP].valueQuantity.unit 1..1 MS
* component[MeanArterialBP].valueQuantity.unit only string
* component[MeanArterialBP].valueQuantity.system 1..1 MS
* component[MeanArterialBP].valueQuantity.system only uri
* component[MeanArterialBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[MeanArterialBP].valueQuantity.code 1..1 MS
* component[MeanArterialBP].valueQuantity.code only code
* component[MeanArterialBP].valueQuantity.code = #mm[Hg] (exactly)





ValueSet: USCoreBloodPressureCategory
Id: us-core-modified-blood-pressure-category
Title: "Vital Signs Blood Pressure Category Codes"
Description: """TEST...."""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-modified-blood-pressure-category"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory"
* ^compose.include[=].concept[+].code = #vital-sign-bp


ValueSet: USCoreBloodPressureCodes
Id: us-core-modified-blood-pressure-code
Title: "Vital Signs Blood Pressure Codes"
Description: """Codes to measure BP; more codes to be added"""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-modified-blood-pressure-code"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://loinc.org"
* ^compose.include[=].concept[+].code = #85354-9



Extension: ExertionExt
Id:        exertionExt
Title:     "Exertion"
Description: "Exertion"
// Limit the context to Observations
* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only CodeableConcept
* value[x] from http://vitals.oemig.de/fhir/ValueSet/Exertion (required)


Extension: SleepStatusExt
Id:        sleepStatusExt
Title:     "Sleep Status"
Description: "Sleep Status"
// Limit the context to Observations
* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only CodeableConcept
* value[x] from http://vitals.oemig.de/fhir/ValueSet/SleepStatus (required)
