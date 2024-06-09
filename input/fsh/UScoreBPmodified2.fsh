Alias: $loinc = http://loinc.org
Alias: $us-core-vital-signs = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
Alias: $category = http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory

//Alias: $SleepStatusExt = http://hl7.org/fhir/us/vitals/StructureDefinition/SleepStatusExt
//Alias: $ExerciseAssociationExt = http://hl7.org/fhir/us/vitals/StructureDefinition/ExerciseAssociationExt
//Alias: $MeasurementSettingExt = http://hl7.org/fhir/us/vitals/StructureDefinition/MeasurementSettingExt

//Alias: $bodyPositionVS = http://hl7.org/fhir/us/vitals/ValueSet/bodyPositionVS





Profile: USCoreModifiedBloodPressure2Profile
Parent: us-core-modified-vital-signs
Id: us-core-modified-blood-pressure-2
Title: "US Core Blood Pressure Profile (modified, alternative version)"

Description: """
**This is the modified version - not yet fully complete/verified!!!!**

**In contrast to the other version, this one uses more components instead of extensions...**
"""

* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.40.42.6"
* ^experimental = false
* ^date = "2024-05-24"
* ^publisher = "HL7 International / Cross-Group Projects"
* ^contact.name = "HL7 International / Cross-Group Projects"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/cgp"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "cgp@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* . ^short = "US Core Blood Pressure Profile"

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
    DiastolicBP 0..1 MS and
	MeanArterialBP 0..1 MS and
	PulsePressureBP 0..1 and
	BodyPosition 0..1 and
	Consciousness 0..1 and
	Exertion 0..1

* component[SystolicBP] ^short = "Systolic Blood Pressure"
* component[SystolicBP].code 1..1 MS
* component[SystolicBP].code from http://vitals.oemig.de/fhir/ValueSet/us-core-systolic-blood-pressure-code (required)
* component[SystolicBP].code ^short = "Systolic Blood Pressure Code"
* component[SystolicBP].valueQuantity only Quantity
* component[SystolicBP].valueQuantity MS
* component[SystolicBP].valueQuantity ^short = "Vital Sign Component Value"
* component[SystolicBP].valueQuantity.value 1..1 MS
* component[SystolicBP].valueQuantity.value only decimal
* component[SystolicBP].valueQuantity.unit 0..1 MS
* component[SystolicBP].valueQuantity.unit only string
* component[SystolicBP].valueQuantity.system 1..1 MS
* component[SystolicBP].valueQuantity.system only uri
* component[SystolicBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[SystolicBP].valueQuantity.code 1..1 MS
* component[SystolicBP].valueQuantity.code only code
* component[SystolicBP].valueQuantity.code = #mm[Hg] (exactly)

* component[DiastolicBP] ^short = "Diastolic Blood Pressure"
* component[DiastolicBP].code 1..1 MS
* component[DiastolicBP].code from http://vitals.oemig.de/fhir/ValueSet/us-core-diastolic-blood-pressure-code (required)
* component[DiastolicBP].code ^short = "Diastolic Blood Pressure Code"
* component[DiastolicBP].valueQuantity only Quantity
* component[DiastolicBP].valueQuantity MS
* component[DiastolicBP].valueQuantity ^short = "Vital Sign Component Value"
* component[DiastolicBP].valueQuantity.value 1..1 MS
* component[DiastolicBP].valueQuantity.value only decimal
* component[DiastolicBP].valueQuantity.unit 0..1 MS
* component[DiastolicBP].valueQuantity.unit only string
* component[DiastolicBP].valueQuantity.system 1..1 MS
* component[DiastolicBP].valueQuantity.system only uri
* component[DiastolicBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[DiastolicBP].valueQuantity.code 1..1 MS
* component[DiastolicBP].valueQuantity.code only code
* component[DiastolicBP].valueQuantity.code = #mm[Hg] (exactly)

* component[MeanArterialBP] ^short = "Mean Arterial Blood Pressure"
* component[MeanArterialBP].code 1..1 MS
* component[MeanArterialBP].code from http://vitals.oemig.de/fhir/ValueSet/us-core-mean-arterial-blood-pressure-code (required)
* component[MeanArterialBP].code ^short = "Mean Arterial Blood Pressure Code"
* component[MeanArterialBP].valueQuantity only Quantity
* component[MeanArterialBP].valueQuantity MS
* component[MeanArterialBP].valueQuantity ^short = "Vital Sign Component Value"
* component[MeanArterialBP].valueQuantity.value 1..1 MS
* component[MeanArterialBP].valueQuantity.value only decimal
* component[MeanArterialBP].valueQuantity.unit 0..1 MS
* component[MeanArterialBP].valueQuantity.unit only string
* component[MeanArterialBP].valueQuantity.system 1..1 MS
* component[MeanArterialBP].valueQuantity.system only uri
* component[MeanArterialBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[MeanArterialBP].valueQuantity.code 1..1 MS
* component[MeanArterialBP].valueQuantity.code only code
* component[MeanArterialBP].valueQuantity.code = #mm[Hg] (exactly)


* component[PulsePressureBP] ^short = "Pulse Blood Pressure"
* component[PulsePressureBP].code 1..1 MS
* component[PulsePressureBP].code from http://vitals.oemig.de/fhir/ValueSet/us-core-pulse-blood-pressure-code (required)
* component[PulsePressureBP].code ^short = "Mean Arterial Blood Pressure Code"
* component[PulsePressureBP].valueQuantity only Quantity
* component[PulsePressureBP].valueQuantity MS
* component[PulsePressureBP].valueQuantity ^short = "Vital Sign Component Value"
* component[PulsePressureBP].valueQuantity.value 1..1 MS
* component[PulsePressureBP].valueQuantity.value only decimal
* component[PulsePressureBP].valueQuantity.unit 0..1 MS
* component[PulsePressureBP].valueQuantity.unit only string
* component[PulsePressureBP].valueQuantity.system 1..1 MS
* component[PulsePressureBP].valueQuantity.system only uri
* component[PulsePressureBP].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[PulsePressureBP].valueQuantity.code 1..1 MS
* component[PulsePressureBP].valueQuantity.code only code
* component[PulsePressureBP].valueQuantity.code = #mm[Hg] (exactly)

* component[BodyPosition] ^short = "Position of the Body during measurement"
* component[BodyPosition].code 1..1 MS
* component[BodyPosition].code ^short = "Body Position Code"
* component[BodyPosition].code from http://vitals.oemig.de/fhir/ValueSet/ObservationCodes (required)
* component[BodyPosition].code.coding.code = #bodyPosition
* component[BodyPosition].valueCodeableConcept.coding only Coding
* component[BodyPosition].valueCodeableConcept.coding MS
* component[BodyPosition].valueCodeableConcept.coding ^short = "Position of the Body"
* component[BodyPosition].valueCodeableConcept.coding.system 1..1 MS
* component[BodyPosition].valueCodeableConcept.coding.system only uri
* component[BodyPosition].valueCodeableConcept.coding.system = "http://vitals.oemig.de/fhir/CodeSystem/BodyPosition" (exactly)
* component[BodyPosition].valueCodeableConcept.coding.code 1..1 MS
* component[BodyPosition].valueCodeableConcept.coding.code from http://vitals.oemig.de/fhir/ValueSet/BodyPosition (required)

//* component[BodyPosition].valueCodeableConcept.coding.code = #mm[Hg] (exactly)

* component[Consciousness] ^short = "Consciousness during measurement"
* component[Consciousness].code 1..1 MS
* component[Consciousness].code ^short = "Consciousness Code"
* component[Consciousness].code from http://vitals.oemig.de/fhir/ValueSet/ObservationCodes (required)
* component[Consciousness].code.coding.code = #consciousness
* component[Consciousness].valueCodeableConcept.coding only Coding
* component[Consciousness].valueCodeableConcept.coding MS
* component[Consciousness].valueCodeableConcept.coding ^short = "Consciousness"
* component[Consciousness].valueCodeableConcept.coding.system 1..1 MS
* component[Consciousness].valueCodeableConcept.coding.system only uri
* component[Consciousness].valueCodeableConcept.coding.system = "http://vitals.oemig.de/fhir/CodeSystem/Consciousness" (exactly)
* component[Consciousness].valueCodeableConcept.coding.code 1..1 MS
* component[Consciousness].valueCodeableConcept.coding.code from http://vitals.oemig.de/fhir/ValueSet/Consciousness (required)

* component[Exertion] ^short = "Exertion during measurement"
* component[Exertion].code 1..1 MS
* component[Exertion].code ^short = "Exertion Code"
* component[Exertion].code.coding.system = "http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes"
* component[Exertion].code.coding.code = #exertion
* component[Exertion].valueCodeableConcept.coding only Coding
* component[Exertion].valueCodeableConcept.coding MS
* component[Exertion].valueCodeableConcept.coding ^short = "Exertion"
* component[Exertion].valueCodeableConcept.coding.system 1..1 MS
* component[Exertion].valueCodeableConcept.coding.system only uri
* component[Exertion].valueCodeableConcept.coding.system = "http://vitals.oemig.de/fhir/CodeSystem/Exertion" (exactly)
* component[Exertion].valueCodeableConcept.coding.code 1..1 MS
* component[Exertion].valueCodeableConcept.coding.code from http://vitals.oemig.de/fhir/ValueSet/Exertion (required)
