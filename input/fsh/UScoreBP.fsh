Alias: $loinc = http://loinc.org
Alias: $us-core-vital-signs = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs

Profile: USCoreBloodPressureProfile
//Parent: $us-core-vital-signs
Parent: Observation
Id: us-core-blood-pressure
Title: "US Core Blood Pressure Profile"
Description: "US Core Blood Pressure Profile inherits from the US Core Vital Signs Profile. This profile sets minimum expectations for the Observation resource to record, search,  and fetch diastolic and systolic blood pressure observations with standard LOINC codes and UCUM units of measure. It specifies which *additional*  core elements, extensions,  vocabularies, and value sets **SHALL** be present in the resource and constrains how the elements are used. Providing the floor for standards development for specific use cases promotes interoperability and adoption."
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.40.42.6"
* ^experimental = false
* ^date = "2023-10-17"
* ^publisher = "HL7 International / Cross-Group Projects"
* ^contact.name = "HL7 International / Cross-Group Projects"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cgp"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "cgp@lists.HL7.org"
//* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* . ^short = "US Core Blood Pressure Profile"
* code only CodeableConcept
* code = $loinc#85354-9
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

Mapping: workflow
Id: workflow
Title: "Workflow Pattern"
Source: USCoreBloodPressureProfile
Target: "http://hl7.org/fhir/workflow"

Mapping: sct-concept
Id: sct-concept
Title: "SNOMED CT Concept Domain Binding"
Source: USCoreBloodPressureProfile
Target: "http://snomed.info/conceptdomain"

Mapping: v2
Id: v2
Title: "HL7 v2 Mapping"
Source: USCoreBloodPressureProfile
Target: "http://hl7.org/v2"

Mapping: rim
Id: rim
Title: "RIM Mapping"
Source: USCoreBloodPressureProfile
Target: "http://hl7.org/v3"

Mapping: w5
Id: w5
Title: "FiveWs Pattern Mapping"
Source: USCoreBloodPressureProfile
Target: "http://hl7.org/fhir/fivews"

Mapping: sct-attr
Id: sct-attr
Title: "SNOMED CT Attribute Binding"
Source: USCoreBloodPressureProfile
Target: "http://snomed.org/attributebinding"
