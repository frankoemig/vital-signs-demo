Alias: $loinc = http://loinc.org
Alias: $us-core-vital-signs = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
Alias: $category = http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory

//Alias: $SleepStatusExt = http://hl7.org/fhir/us/vitals/StructureDefinition/SleepStatusExt
//Alias: $ExerciseAssociationExt = http://hl7.org/fhir/us/vitals/StructureDefinition/ExerciseAssociationExt
//Alias: $MeasurementSettingExt = http://hl7.org/fhir/us/vitals/StructureDefinition/MeasurementSettingExt


Alias: $bodyPositionVS = http://hl7.org/fhir/us/vitals/ValueSet/bodyPositionVS

Profile: USCoreModifiedBloodPressureProfile
//Parent: $us-core-vital-signs
Parent: Observation
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
  ObsBodyPosition named bodyPosition 0..1 MS //and
//  $SleepStatusExt named sleepStatus 0..1 MS and
//  $ExerciseAssociationExt named exerciseAssociation 0..1 MS and
//  $MeasurementSettingExt named MeasurementSetting 0..1 MS
  
* extension[bodyPosition] ^short = "Body Position"  
* extension[bodyPosition].value[x] from $bodyPositionVS (extensible)
//* extension[sleepStatus] ^short = "Sleep Status"  
//* extension[exerciseAssociation] ^short = "Exercise Association"  
//* extension[MeasurementSetting] ^short = "Measurement Setting"  

* status MS


* category only CodeableConcept
* category = $category#vital-sign-bp

* code only CodeableConcept
* code from us-core-modified-blood-pressure-code (required)

* code MS
* code ^short = "Blood Pressure"

* component ..* MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.ordered = false
* component ^slicing.rules = #open
* component ^short = "Component observations"
* component contains
    systolic 1..1 MS and
    diastolic 1..1 MS
* component[systolic] ^short = "Systolic Blood Pressure"
* component[systolic].code 1..1 MS
* component[systolic].code = $loinc#8480-6
* component[systolic].code ^short = "Systolic Blood Pressure Code"
* component[systolic].valueQuantity only Quantity
* component[systolic].valueQuantity MS
* component[systolic].valueQuantity ^short = "Vital Sign Component Value"
* component[systolic].valueQuantity.value 1..1 MS
* component[systolic].valueQuantity.value only decimal
* component[systolic].valueQuantity.unit 1..1 MS
* component[systolic].valueQuantity.unit only string
* component[systolic].valueQuantity.system 1..1 MS
* component[systolic].valueQuantity.system only uri
* component[systolic].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[systolic].valueQuantity.code 1..1 MS
* component[systolic].valueQuantity.code only code
* component[systolic].valueQuantity.code = #mm[Hg] (exactly)
* component[diastolic] ^short = "Diastolic Blood Pressure"
* component[diastolic].code 1..1 MS
* component[diastolic].code = $loinc#8462-4
* component[diastolic].code ^short = "Diastolic Blood Pressure Code"
* component[diastolic].valueQuantity only Quantity
* component[diastolic].valueQuantity MS
* component[diastolic].valueQuantity ^short = "Vital Sign Component Value"
* component[diastolic].valueQuantity.value 1..1 MS
* component[diastolic].valueQuantity.value only decimal
* component[diastolic].valueQuantity.unit 1..1 MS
* component[diastolic].valueQuantity.unit only string
* component[diastolic].valueQuantity.system 1..1 MS
* component[diastolic].valueQuantity.system only uri
* component[diastolic].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[diastolic].valueQuantity.code 1..1 MS
* component[diastolic].valueQuantity.code only code
* component[diastolic].valueQuantity.code = #mm[Hg] (exactly)






ValueSet: USCoreBloodPressureCategory
Id: us-core-modified-blood-pressure-category
Title: "Vital Signs Blood Pressure Category Codes"
Description: """TEST."""

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



Extension: Exertion
Id:        exertion
Title:     "Exertion"
Description: "Exertion"
// Limit the context to Observations
* ^context[+].type = #element
* ^context[=].expression = "Observation"
* value[x] only unsignedInt  // 0 or more