Alias: $loinc = http://loinc.org
Alias: $v2code = http://vitals.oemig.de/fhir/CodeSystem/v2code


// This is an abstract base to allow for further profiling into groups of segments

Logical: AbstractSegment
Parent: Base
Id: AbstractSegment
Title: "LM for an abstract segment"
Description: "This LM operates as a base for adding further fields and to aggregate into segment groups"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/AbstractSegment"
* insert HeaderDetailRules


//=========================


Logical: OBXsegment
Parent: AbstractSegment
Id: OBXsegment
Title: "OBX Segment LM"
Description: "LM for relevant attributes of **OBX Segment** (Observation in v2.x)"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/OBXsegment"
//* . ^definition = "Observation Segment"
* insert HeaderDetailRules

* seqNo 0..1 integer "Sequence Number (OBX-1)"
* valueDataType 0..1 CodeableConcept "Data Type (OBX-2)"
* observationCode 0..* CodeableConcept "code for observed value (OBX-3)"
* observationGroup 0..1 string "group of observations that belong together"
* value 0..* string "observed/measured value (OBX-5)"
* unit 0..* CodeableConcept "units (OBX-6)"
* referenceRange 0..1 CodeableConcept "reference range for values (OBX-7)"
* interpretation 0..1 CodeableConcept "interpretation code (OBX-8)"
* observationDateTime 0..1 instant "Diagnosis Date/Time (OBX-14)"
* responsibleObserver 0..1 Reference(Practitioner) "responsible observer (OBX-16)"
* observationSite 0..1 CodeableConcept "body structure (OBX-20)"
* observationAbsentReason 0..1 CodeableConcept "data absent reason (OBX-32)"


//===========================================================================

Logical: PIDsegment
Parent: AbstractSegment
Id: PIDsegment
Title: "PID Segment LM"
Description: "LM for relevant attributes of **PID Segment** (Patient in v2.x)"

* patid 1..1 identifier "id for patient"
* name 0..1 HumanName "name of patient"
* dob 0..1 date "date of birth"

Logical: RELsegment
Parent: AbstractSegment
Id: RELsegment
Title: "REL Segment LM"
Description: "LM for relevant attributes of **REL Segment** (Patient in v2.x)"

* identifier 1..1 identifier "id for related person"
* name 0..1 HumanName "name of person"
* relationship 0..1 CodeableConcept "relationship"


//===========================================================================


Profile: OBXmainBP
Parent: OBXsegment
Id: OBXmainBP
Title: "Blood Pressure Main (Profile) in v2"
Description: "v2 Profile: **Main Blood Pressure Measurement**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2code#NM
* observationCode 1..1 MS
* observationCode = $loinc#85354-9


Profile: OBXsystolicBP
Parent: OBXsegment
Id: OBXsystolicBP
Title: "Blood Pressure Systolic (Profile) in v2"
Description: "v2 Profile: **Systolic** Blood Pressure"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 2
* valueDataType MS
* valueDataType = $v2code#NM
* observationCode MS
* observationCode = $loinc#8480-6
* value MS


Profile: OBXdiastolicBP
Parent: OBXsegment
Id: OBXdiastolicBP
Title: "Blood Pressure Diastolic (Profile) in v2"
Description: "v2 Profile: **Diastolic** Blood Pressure"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 3
* valueDataType MS
* valueDataType = http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes#NM
* observationCode MS
* observationCode = $loinc#8482-2
* value MS

Profile: OBXmeanArterialBP
Parent: OBXsegment
Id: OBXmeanArterialBP
Title: "Mean Arterial Blood Pressure (Profile) in v2"
Description: "v2 Profile: **Mean Arterial** Blood Pressure"

* ^version = "0.1.0"
* insert HeaderDetailRules

* valueDataType MS
* observationCode MS
* observationCode = http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes#meanArterial
* value MS

Profile: OBXpulsePressureBP
Parent: OBXsegment
Id: OBXpulsePressureBP
Title: "Pulse Pressure Blood Pressure (Profile) in v2"
Description: "v2 Profile: **Pulse Pressure** Blood Pressure"

* ^version = "0.1.0"
* insert HeaderDetailRules

* valueDataType MS
* observationCode MS
* value MS

Profile: OBXexertion
Parent: OBXsegment
Id: OBXexertion
Title: "Exertion to Blood Pressure Measurement (Profile) in v2"
Description: "v2 Profile: **Exertion** to Blood Pressure Measurement"

* ^version = "0.1.0"
* insert HeaderDetailRules

* valueDataType MS
* observationCode MS
* observationCode = http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes#exertion
* value MS

Profile: OBXlocation
Parent: OBXsegment
Id: OBXlocation
Title: "Location of Blood Pressure Measurement (Profile) in v2"
Description: "v2 Profile: **Location of Blood Pressure Measurement**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* valueDataType MS
* valueDataType = http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes#CWE
* observationCode MS
* observationCode = http://vitals.oemig.de/fhir/CodeSystem/ObservationCodes#location
* value MS


//===========================================================================

Logical: SegmentGroup
Title: "Segment Group LM"
Description: "Segment Group for Blood Pressure Observations"
* ^version = "0.1.0"
* insert HeaderDetailRules

* segment 0..* OBXsegment "group of OBX segments"


Profile: OBXbloodpressuresegmentgroup
Parent: SegmentGroup
Title: "OBX Blood Pressure Segment Group"
Description: "This profile should describe in which way the segment instances for PID, OBX and REL belong together"

* segment 3..* MS

//slice the segment
* segment ^slicing.discriminator.type = #value
* segment ^slicing.discriminator.path = "system"
* segment ^slicing.rules = #openAtEnd

//the slice has the name diastolicBP
* segment contains
   PIDsegment 1..1 MS and
   OBXmainBP 1..1 MS and
   RELsegment 0..1 MS and
   OBXsystolicBP 1..1 MS and
   OBXdiastolicBP 0..1 MS and
   OBXmeanArterialBP 0..1 MS and
   OBXpulsePressureBP 0..1 MS and
   OBXexertion 0..1 MS and
   OBXlocation 0..1 MS


