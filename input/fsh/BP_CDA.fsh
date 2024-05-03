Logical: CDAlm
Parent: Base
Id: CDAlm
Title: "LM for CDA representation"
Description: "This is a draft **LM for CDA**. (It still requires modifications comparable to the OBX representation in form of slicing.)"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/CDAtemplate"
* insert HeaderDetailRules

* classCode 1..1 CodeableConcept "class code"
* classCode = #OBS
* moodCode 1..1 CodeableConcept "mood code"
* moodCode = #EVN

* code 1..1 CodeableConcept "code"
* code = #85354-9

* value 0..1 SU integer "test value"

* observationRange 0..1 BackboneElement "observation Range"
  * typeCode 1..1 CodeableConcept "type code"
  * typeCode = #REFV
  * referenceRange 1..1 BackboneElement "reference range"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #OBS
    * moodCode 1..1 CodeableConcept "mood code"
    * moodCode = #EVN
    * value 0..1 SU string "reference range values"

* interpretation 0..1 SU CodeableConcept "interpretation code (OBX-8)"
* effectiveTime 1..1 SU date "date of observation"

* component 1..* BackboneElement "component"
  * typeCode 1..1 CodeableConcept "type code"
  * typeCode = #COMP
  * separatableInd 0..1 boolean "is this concept independent?"
  * systolicBP 0..1 SU BackboneElement "systolic blood pressure"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #8480-4
    * value 0..* integer "observed/measured value"
    * unit 0..* CodeableConcept "units"
    * component 1..* BackboneElement "component"
      * referenceRange 0..1 CodeableConcept "reference range for values"
      * classCode 1..1 CodeableConcept "class code"
      * value 0..* string "reference range"
    * interpretation 0..1 CodeableConcept "interpretation code"

  * diastolicBP 0..1 SU BackboneElement "diastolic blood pressure"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #8482-0
    * value 0..* integer "observed/measured value"
    * unit 0..* CodeableConcept "units"
    * referenceRange 0..1 CodeableConcept "reference range for values"
    * interpretation 0..1 CodeableConcept "interpretation code"

  * meanArterialBP 0..1 BackboneElement "mean arterial blood pressure"
    * classCode 1..1 CodeableConcept "class code"
    * value 0..* integer "observed/measured value"
    * unit 0..* CodeableConcept "units"
    * referenceRange 0..1 CodeableConcept "reference range for values"
    * interpretation 0..1 CodeableConcept "interpretation code"

  * pulsePressureBP 0..1 BackboneElement "pulse pressure blood pressure"
    * classCode 1..1 CodeableConcept "class code"
    * value 0..* string "observed/measured value"
    * unit 0..* CodeableConcept "units"
    * referenceRange 0..1 CodeableConcept "reference range for values"
    * interpretation 0..1 CodeableConcept "interpretation code"

  * exertion 0..1 BackboneElement "exertion during measurement"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #exertion
    * value 0..* CodeableConcept "exertion during measurement"
    * value from http://vitals.oemig.de/fhir/ValueSet/Exertion (required)

  * location 0..1 BackboneElement "location of measurement"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #location
    * value 0..* CodeableConcept "exertion during measurement"
    * value from http://vitals.oemig.de/fhir/ValueSet/Location (required)

  * sleepingStatus 0..1 CodeableConcept "sleeping status during measurement"
    * classCode 1..1 CodeableConcept "class code"
    * classCode = #sleepingStatus
    * value 0..* CodeableConcept "exertion during measurement"
    * value from http://vitals.oemig.de/fhir/ValueSet/SleepingStatus (required)

* participant 0..* BackboneElement "participants"
  * subject 0..1 SU Reference(Patient) "patient"
  * author 0..1 SU Reference(Practitioner) "author"
  * performer 0..1 SU Reference(Practitioner) "performer"
