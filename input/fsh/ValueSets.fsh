Alias: $loinc = http://loinc.org
Alias: $us-core-vital-signs = http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs
Alias: $category = http://vitals.oemig.de/fhir/CodeSystem/ObservationCategory

//Alias: $SleepStatusExt = http://hl7.org/fhir/us/vitals/StructureDefinition/SleepStatusExt
//Alias: $ExerciseAssociationExt = http://hl7.org/fhir/us/vitals/StructureDefinition/ExerciseAssociationExt
//Alias: $MeasurementSettingExt = http://hl7.org/fhir/us/vitals/StructureDefinition/MeasurementSettingExt

Alias: $bodyPositionVS = http://hl7.org/fhir/us/vitals/ValueSet/bodyPositionVS





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
* ^compose.include[=].concept[+].code = #8479-8
* ^compose.include[=].concept[+].code = #96066-6
* ^compose.include[=].concept[+].code = #94144-3
* ^compose.include[=].concept[+].code = #82341-9
* ^compose.include[=].concept[+].code = #20185-5
* ^compose.include[=].concept[+].code = #20186-3
* ^compose.include[=].concept[+].code = #11378-7
* ^compose.include[=].concept[+].code = #75997-7
* ^compose.include[=].concept[+].code = #76215-3
* ^compose.include[=].concept[+].code = #76534-7
* ^compose.include[=].concept[+].code = #96608-5
* ^compose.include[=].concept[+].code = #89280-2
* ^compose.include[=].concept[+].code = #8450-9
* ^compose.include[=].concept[+].code = #8451-7
* ^compose.include[=].concept[+].code = #89268-7
* ^compose.include[=].concept[+].code = #87741-5
* ^compose.include[=].concept[+].code = #87739-9
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


