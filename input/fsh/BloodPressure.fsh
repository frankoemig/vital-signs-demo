Logical: BloodPressure
Parent: Base
Id: BloodPressure
Title: "Blood Pressure LM"
Description: "LM for **Blood Pressure**"

* ^version = "0.1.0"
* ^abstract = false
* ^type = "http://vitals.oemig.de/fhir/StructureDefinition/BloodPressure"
* . ^definition = "Blood Pressure"

* insert HeaderDetailRules

* systolicPressure 0..1 SU BackboneElement "systolic blood pressure" "Peak systemic arterial blood pressure - measured in systolic or contraction phase of the heart cycle."
  * value 1..1 positiveInt "value"
    * obeys shall-be-under-1000-mmHg
  * unit 1..1 CodeableConcept "units"
  * unit from http://vitals.oemig.de/fhir/ValueSet/BPunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"

* diastolicPressure 0..1 SU BackboneElement "diastolic blood pressure" "Minimum systemic arterial blood pressure - measured in the diastolic or relaxation phase of the heart cycle."
  * value 1..1 positiveInt "value"
    * obeys shall-be-under-1000-mmHg
  * unit 1..1 CodeableConcept "units"
  * unit from http://vitals.oemig.de/fhir/ValueSet/BPunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"

* meanArterialPressure 0..1 BackboneElement "mean arterial blood pressure" "The average arterial pressure that occurs over the entire course of the heart contraction and relaxation cycle."
  * value 1..1 positiveInt "value"
    * obeys shall-be-under-1000-mmHg
  * unit 1..1 CodeableConcept "units"
  * unit from http://vitals.oemig.de/fhir/ValueSet/BPunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"

* pulsePressure 0..1 BackboneElement "pulse blood pressure" "The difference between the systolic and diastolic pressure."
  * value 1..1 positiveInt "value"
    * obeys shall-be-under-1000-mmHg
  * unit 1..1 CodeableConcept "units"
  * unit from http://vitals.oemig.de/fhir/ValueSet/BPunits (required)
  * interpretation 0..1 CodeableConcept "interpretation"

* interpretation 0..1 SU CodeableConcept "overall clinical meaning of the BP measurement"

* effective[x] 0..1 SU date or instant or Period "date of observation" "different representations"

* cuffType 0..1 CodeableConcept "type of cuff used (eg. rusable, disposable)"
* cuffType from http://vitals.oemig.de/fhir/ValueSet/CuffType (required)
* cuffSize 0..1 CodeableConcept "size of cuff (eg. adult, child)"
* cuffSize from http://vitals.oemig.de/fhir/ValueSet/CuffSize (required)
* position 0..1 CodeableConcept "position for measurement"
* position from http://vitals.oemig.de/fhir/ValueSet/Position (required)
* location 0..1 CodeableConcept "body location of measurement"
* location from http://vitals.oemig.de/fhir/ValueSet/Location (required)
* sleepingStatus 0..1 CodeableConcept "sleeping status"
* sleepingStatus from http://vitals.oemig.de/fhir/ValueSet/SleepStatus (required)
* exertion[x] 0..1 integer or CodeableConcept "physical activity (in Watts or as codes)" 

* method 0..1 CodeableConcept "measurement method"
* tilt 0..1 integer "tilt (in degrees)"
* comment 0..1 string "any comment"
* subject 0..1 Reference(Patient) "reference to the subject of the measurement"
* author 0..1 Reference(Practitioner) "reference to the author of the measurement"
* performer 0..1 Reference(Practitioner) "reference to the performer of the measurement"




// @Name: String Length Invariant
// @Description: Limit string length invariant
Invariant:   shall-be-under-1000-mmHg
Description: "Value SHALL be <1000 mmHg for valid data."
Expression:  "$this < 1000"
Severity:    #error






CodeSystem: CuffType
Id: CuffType
Title: "Cuff Type"
Description: "**Cuff Type**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/CuffType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/CuffType"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #reusable "The most popular and common cuff on the market today is the reusable cuff."
* #disposable "Disposable cuffs are the 2nd most common cuff on the market."
* #Dring "D-ring cuffs are designed to be self-applied and make it easier for the patient to take their own blood pressure without assistance."
* #specialty "specialty-use blood pressure cuffs"

ValueSet: CuffType
Id: CuffType
Title: "Cuff Type"
Description: "**Cuff Type**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/CuffType"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/CuffType




CodeSystem: CuffSize
Id: CuffSize
Title: "Cuff Size"
Description: "**Cuff Size**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/CuffSize"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/CuffSize"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete


* #Adult "A cuff that is standard for an adult."
  * #AdultThigh "A cuff used for an adult thigh."
  * #LargeAdult "A cuff for adults with larger arms."
  * #SmallAdult "A cuff used for a small adult."
* #PaediatricChild "A cuff that is appropriate for a child or adult with a thin arm."
* #Infant "A cuff used for infants."
* #Neonatal "A cuff used for a neonate, assuming cuff is the appropriate size for maturity and birthweight of the neonate."


ValueSet: CuffSize
Id: CuffSize
Title: "Cuff Size"
Description: "**Cuff Size**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/CuffSize"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/CuffSize






CodeSystem: SleepStatus
Id: SleepStatus
Title: "Sleep Status"
Description: "**Sleep Status**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/SleepStatus"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/SleepStatus"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #awake "The patient is awake"
* #sleepibg "The patient sleeps"


ValueSet: SleepStatus
Id: SleepStatus
Title: "Sleep Status"
Description: "**Sleep Status**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/SleepStatus"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/SleepStatus






CodeSystem: Position
Id: Position
Title: "Position"
Description: "**Position**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/Position"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/Position"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #sitting "sitting"
* #standing "standing"
* #reclining "reclining"
* #lying "lying"
  * #lyingOnBack "lying on its back (supine)"
  * #lyingWithTiltToLeft "lying with tilt to left"



ValueSet: Position
Id: Position
Title: "Position"
Description: "**Position**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/Position"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/Position


ValueSet: BodyPosition
Id: BodyPosition
Title: "Body Position"
Description: "**Position of the Body** during measurement"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/BodyPosition"
* ^version = "0.1.0"

* insert HeaderDetailRules

//* include codes from system http://vitals.oemig.de/fhir/CodeSystem/Position
//* include codes from system http://snomed.info/sct

* ^compose.include[+].system = "http://vitals.oemig.de/fhir/CodeSystem/Position"
* ^compose.include[+].system = "http://snomed.info/sct"
* ^compose.include[=].concept[+].code = #3021006
* ^compose.include[=].concept[+].code = #26527006
* ^compose.include[=].concept[+].code = #102536004
* ^compose.include[=].concept[+].code = #414585002
* ^compose.include[=].concept[+].code = #10904000
* ^compose.include[=].concept[+].code = #1240000
* ^compose.include[=].concept[+].code = #102538003
* ^compose.include[=].concept[+].code = #423413008
* ^compose.include[=].concept[+].code = #102535000
* ^compose.include[=].concept[+].code = #415346000
* ^compose.include[=].concept[+].code = #33586001
* ^compose.include[=].concept[+].code = #40199007
* ^compose.include[=].concept[+].code = #34106002



CodeSystem: Location
Id: Location
Title: "Location"
Description: "**Location**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/Location"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/Location"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #Arm "The right arm of the person."
  * #RightArm "The right arm of the person."
  * #LeftArm "The left arm of the person."
* #Thigh "The thigh of the person."
  * #RightThigh "The right thigh of the person."
  * #LeftThigh "The left thigh of the person."
* #Wrist "The wrist of the individual."
  * #RightWrist "The right wrist of the individual."
  * #LeftWrist "The left wrist of the individual."
* #Ankle "The ankle of the individual."
  * #RightAnkle "The right ankle of the individual."
  * #LeftAnkle "The left ankle of the individual."
* #Finger "A finger of the individual."
* #Toe "A toe of the individual."
* #DorsumOfFoot "The individual's dorsum of the foot."
* #IntraArterial "Invasive measurement via transducer access line within an artery."


ValueSet: Location
Id: Location
Title: "Location"
Description: "**Location**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/Location"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/Location






CodeSystem: Exertion
Id: Exertion
Title: "Exertion"
Description: "**Exertion**"

* ^url = "http://vitals.oemig.de/fhir/CodeSystem/Exertion"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^caseSensitive = false
* ^valueSet = "http://vitals.oemig.de/fhir/ValueSet/Exertion"
* ^hierarchyMeaning = #is-a
* ^compositional = false
* ^versionNeeded = false
* ^content = #complete

* #25 "25W"
* #50 "50W"
* #75 "75W"
* #100 "100W"
* #125 "125W"
* #150 "150W"
* #175 "175W"
* #200 "200W"
* #225 "225W"
* #250 "250W"
* #275 "275W"
* #300 "300W"


ValueSet: Exertion
Id: Exertion
Title: "Exertion"
Description: "**Exertion**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/Exertion"
* ^version = "0.1.0"

* insert HeaderDetailRules

* include codes from system http://vitals.oemig.de/fhir/CodeSystem/Exertion





ValueSet: BPunits
Id: BPunits
Title: "Blood Pressure Units"
Description: "**Units for measuring Blood Pressure**"

* ^url = "http://vitals.oemig.de/fhir/ValueSet/BPunits"
* ^version = "0.1.0"

* insert HeaderDetailRules

* ^compose.include[+].system = "http://unitsofmeasure.org"
* ^compose.include[=].concept[+].code = #mm[Hg]



