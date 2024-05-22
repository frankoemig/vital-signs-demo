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


* extension contains
  MedicationExt named medication 0..* MS and
  BodyWeightExt named bodyWeight 0..1 MS

* extension[medication] ^short = "Medication to be considered for correct interpretation of vital signs"  
* extension[bodyWeight] ^short = "Body weight to be considered for correct interpretation of vital signs"  

* status MS
* status from ObservationStatus (required)

* category only CodeableConcept
* category from http://vitals.oemig.de/fhir/ValueSet/ObservationVitalSignsCategory (required)

* code MS

* subject MS
* subject only Reference(Patient)

* effective[x] 0..1 MS SU
* effective[x] only dateTime or instant or Period

* value[x] 0..1 MS SU 
* value[x] only Quantity or string or integer 

* dataAbsentReason MS

* interpretation 0..1 MS

* referenceRange 0..* MS

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
  ConsciousnessExt named consciousness 0..1 MS and
  ExertionExt named exertion 0..1 MS 
  
* extension[bodyPosition] ^short = "Body Position"  

* extension[consciousness] ^short = "Consciousness"  

* extension[exertion] ^short = "Exertion / Exercise Association"  

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
    SystolicBPxx 1..1 MS and
    DiastolicBP 0..1 MS and
	MeanArterialBP 0..1 MS and
	PulsePressureBP 0..1

* component[SystolicBPxx] ^short = "Systolic Blood Pressure"
* component[SystolicBPxx].code 1..1 MS
* component[SystolicBPxx].code from http://vitals.oemig.de/fhir/ValueSet/us-core-systolic-blood-pressure-code (required)
* component[SystolicBPxx].code ^short = "Systolic Blood Pressure Code"
* component[SystolicBPxx].valueQuantity only Quantity
* component[SystolicBPxx].valueQuantity MS
* component[SystolicBPxx].valueQuantity ^short = "Vital Sign Component Value"
* component[SystolicBPxx].valueQuantity.value 1..1 MS
* component[SystolicBPxx].valueQuantity.value only decimal
* component[SystolicBPxx].valueQuantity.unit 0..1 MS
* component[SystolicBPxx].valueQuantity.unit only string
* component[SystolicBPxx].valueQuantity.system 1..1 MS
* component[SystolicBPxx].valueQuantity.system only uri
* component[SystolicBPxx].valueQuantity.system = "http://unitsofmeasure.org" (exactly)
* component[SystolicBPxx].valueQuantity.code 1..1 MS
* component[SystolicBPxx].valueQuantity.code only code
* component[SystolicBPxx].valueQuantity.code = #mm[Hg] (exactly)

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



ValueSet: USCoreBloodPressureCategory
Id: us-core-modified-blood-pressure-category
Title: "Vital Signs Blood Pressure Category Codes"
Description: """Value Set for Blood Pressure Category"""

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
* ^compose.include[=].concept[+].code = #moreCodesToAdd


ValueSet: USCoreSystolicBloodPressureCodes
Id: us-core-systolic-blood-pressure-code
Title: "Vital Signs Systolic Blood Pressure Codes"
Description: """Codes to measure systolic BP; codes still to be added"""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-systolic-blood-pressure-code"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://loinc.org"
* ^compose.include[=].concept[+].code = #8480-6
* ^compose.include[=].concept[+].code = #moreSystolicCodesToAdd


ValueSet: USCoreDiastolicBloodPressureCodes
Id: us-core-diastolic-blood-pressure-code
Title: "Vital Signs Diastolic Blood Pressure Codes"
Description: """Codes to measure diastolic BP; codes still to be added"""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-diastolic-blood-pressure-code"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://loinc.org"
* ^compose.include[=].concept[+].code = #8462-4
* ^compose.include[=].concept[+].code = #moreDiastolicCodesToAdd


ValueSet: USCoreMeanArterialBloodPressureCodes
Id: us-core-mean-arterial-blood-pressure-code
Title: "Vital Signs Mean Arterial Blood Pressure Codes"
Description: """Codes to measure mean arterial systolic BP; codes still to be added"""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-mean-arterial-blood-pressure-code"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://loinc.org"
* ^compose.include[=].concept[+].code = #8478-0
* ^compose.include[=].concept[+].code = #moreMeanArterialCodesToAdd


ValueSet: USCorePulseBloodPressureCodes
Id: us-core-pulse-blood-pressure-code
Title: "Vital Signs Pulse Blood Pressure Codes"
Description: """Codes to measure pulse BP; codes still to be added"""

* ^url = "http://vitals.oemig.de/fhir/ValueSet/us-core-pulse-blood-pressure-code"
* ^version = "0.1.0"
* ^status = #draft
* ^experimental = true

* ^compose.include[+].system = "http://loinc.org"
//* ^compose.include[=].concept[+].code = #85354-9
* ^compose.include[=].concept[+].code = #morePulseCodesToAdd





Extension: ExertionExt
Id:        exertionExt
Title:     "Exertion"
Description: "Exertion"
// Limit the context to Observations
* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only CodeableConcept
* value[x] from http://vitals.oemig.de/fhir/ValueSet/Exertion (required)


Extension: ConsciousnessExt
Id:        ConsciousnessExt
Title:     "Consciousness"
Description: "Consciousness"
// Limit the context to Observations
* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only CodeableConcept
* value[x] from http://vitals.oemig.de/fhir/ValueSet/Consciousness (required)



Extension: MedicationExt
Id:        medicationExt
Title:     "Medication to be considered"
Description: "Medication to be considered for correct interpretation"

* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only Reference(MedicationStatement)


Extension: BodyWeightExt
Id:        bodweightExt
Title:     "Body Weight to be considered"
Description: "Body Weight to be considered for correct interpretation (has to be replaced by proper BW observation profile)"

* ^context[+].type = #element
* ^context[=].expression = "StructureDefinition"
* value[x] only Reference(Observation)


Instance: BloodPressureExample
InstanceOf: us-core-modified-blood-pressure
Usage: #example
Description: "This is a very draft example of a bloodpressure measurement and still needs a lot of more details."

* status = #final
* category = $category#vital-sign-bp
* code = $loinc#85354-9
* valueString = "80-120"
* effectiveDateTime = "2024-05-12T09:30:10+01:00"
* note.text = "ok"
//* subject = Reference(Patient/1)

* component[+].code = $loinc#8480-6
* component[=].valueQuantity.value = 80
* component[=].valueQuantity.system = "http://unitsofmeasure.org"
* component[=].valueQuantity.code = #mm[Hg]

* component[+].code = $loinc#8462-4
* component[=].valueQuantity.value = 120
* component[=].valueQuantity.system = "http://unitsofmeasure.org"
* component[=].valueQuantity.code = #mm[Hg]
