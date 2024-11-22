<style>
table th {background: #f0b033}
table tr:nth-child(even) {background: #EEE}
table tr:nth-child(odd) {background: #FFF}
</style>

This is the homepage for blood pressure.
It tries to realize the overall process for creating (FHIR) profiles.

### Step 1: MindMap

The following mindmap collects and sorts all aspects around blood pressure that are necessary for 
a correct interpretation and clinical use.
It has to be recognized that some artifacts (eg. reference range) are abbreviated, and the corresponding details 
must be duplicated. Unfortunately, PlantUML mindmaps do not allow for cross-links to denote that.

The following diagram aggregates all aspects that can be found somewhere.
It tries to arrange them in a way that helps to understand the semantics,
and to sort them.
For the moment, additional explanatory text has not been duplicated from other sources for copyright and IP reasons.
It can be expected, that this will be done later on.

<div>
{% include bloodpressure_mm.svg width='600px' %}
</div>

#### Some Notes on the mindmap

* value on the left: assembles all details dealing with the measured value itself
* protocol: context information
* sleep status: this has been replaced by consciousness to also allow for "unconscious" as a separate value.
* event: Some people increase their blood pressure by just seeing a physician, or for other reasons. Not sure whether this is relevant information, but it should not be left out.

#### Special Aspects for "Profile Subsets"

* generic/advanced set allowing to convey all types of blood pressurements
* constrained to "standard measurements" that are commonly used on panels (so excluding specific ones), eg. at arm + sitting + in rest
* special clinical measurements, eg. artery
* average values
* ...

### Step 2: Information Model

The aforementioned details are now aggregated in form of classes and linked together.
The important items are in bold:

<div width="500px">
{% include bloodpressure_im.svg %}
</div>

To simplify abstract classes are introduced.

#### Pre- vs. Post-Coordination

An important topic taht normally does not belong into such a guide is the translation of pre-coordinated concepts
to/from appropriate post-coordinated terms. The following table should help with that although the best presentation
and appropriate details are still to be elaborated.

| post-coordinated | base | addt'l details |
| --- | --- | --- |
| in rest and sitting | standard | no addt'l details |
| in rest and standing | standard | position = standing |
| walking | standard | position = walking + exertion = 25W |
| jogging | standard | position = walking + exertion = 100W |
| biking uphill | standard | position = sitting + exertion = 200W |
| ... | ... | ... |

In principle, a function like this one is necessary:

> f(pre-coordination) = Base(concept) + Set(attributeValue)

The problem is that this function is self-defining and recursive in the sense of a taxonomy.

### Step 3: Hierarchy for Blood Pressure Profiles with regard to Vital Signs (informative)

The possible values for blood pressure measurements have to be instantiated in different ways.
In combination with vital signs it forms a hierarchy:

<div width="500px">
{% include bloodpressure_hierarchy.svg %}
</div>

The general blood pressure profile on top accumulates all possible details in one profile.
It allows for capturing every blood pressure measurement.

Discussions has revealed that not every blood pressure measurement belongs to the vital sign category.
Only specific measurements, eg. in rest with no exertion, can be used as vital signs as it is shown in a panel.
Therefore, the BP panel is a specialisation of vital signs but not all other BP measurements.

It is also questionable whether the country-specific core is really necessary?!

### Step 4: Technology Binding (ITS)

**How to represent the same information in different standards?**

#### Step 4a: Profile (with FHIR)

The following diagram explores about how blood pressure can be profiled if the Observation Resource is the foundation.
Again, this drawing is somehow abstract:

<div width="500px">
{% include bloodpressure_profile.svg %}
</div>

Link to the FHIR Profile: [Blood Pressure Profile](StructureDefinition-us-core-modified-blood-pressure.html)

**Open Questions:**

* Should we better use components instead of extensions? See the second profile...

#### Step 4b: Template (with CDA)

Unfortunately, PlantUML does not allow for drawing the classes as it has been done with Visio.
Therefore, it has been adopted and colorized as closely as possible.

<div width="500px">
{% include bloodpressure_cda.svg %}
</div>

Notes:

* Not all entries are added into this drawing.

#### Step 4c: OBX Segment Group profile (with v2.x)

Please see [logical model](StructureDefinition-OBXbloodpressuresegmentgroup.html).

As a draft:

| Segment | Card. | Content | Value Type | Unit | Code | Comment |
| --- | --- | --- | --- | --- | --- |
| PID | 1..1 | Patient information | n/a | n/a | n/a | PID-3 |
| PV1 | 1..1 | Visit information | n/a | n/a | n/a | PV1-19 |
| OBX | 1..1 | blood pressure |  NM | mmHg | $LOINC#85354-9 | main entry into BP results |
| PRT | 0..* | for different participants | n/a | n/a | n/a | appropriate participant definitions are necessary |
| OBX | 1..1 | systolic value | NM | mmHg |  $LOINC#8480-6 |
| OBX | 0..1 | diastolic value | NM | mmHg | $LOINC#8462-4 |
| OBX | 0..1 | mean arterial pressure | NM | mmHg | ? |
| OBX | 0..1 | pulse pressure  | NM | mmHg | ? |
| OBX | 0..1 | exertion | CWE | W | #exertion |
| OBX | 0..1 | location | CWE | n/a | #location |
| OBX | 0..1 | position | CWE | n/a | #position |
| OBX | 0..1 | sleeping status | CWE | n/a | #sleepingStatus |
| OBX | 0..1 | cuff type | CWE | n/a | #cuffType |
| OBX | 0..1 | cuff size | CWE | n/a | #cuffSize |
| OBX | 0..1 | anesthesia | CWE | n/a | #anesthesia |

Notes:

* It has to be considered that segments are relevant that are not directly represented in the same group.
* Some codes are just place holders.

#### Step 4d: Other Standards

In order to enable interoperability also other standards have to be included into
the technology binding (ITS):

* openEHR
* xDT (for Germany)

### Pre- and Post-Coordination Mapping

An important aspect is the transformation between pre- and postcoordinated forms.
A single precoordinated concept can express and convey the same semantics 
as postcoordinated terms, or using the logical models from above, the combination
of certain attributes.

Therefore, the attributes have to be values whether they are relevant for a correct
interpretation or not. The following table provides an (draft) overview:

| relevant | not relevant | questionable |
| --- | --- | --- |
| exertion | cuff size | method |
| position | cuff type |
| tilt | location |

Consequently, a transformation in between becomes necessary.
It is expressed as a formula to indicate the idea:

f (concept1, position1, tilt1, exertion1) = f (concept2, position2, tilt2, exertion2)

Maybe more parameters are necessary. If the relevance shown above is not correct
then modifications are necessary to this formula are necessary as well.

### Country-specific Derivations

.. are not necessary so far.

### References + Specifics

When doing the analysis one can find several sources for blood pressure details.
As stated already, they are all at least incomplete.

* US Core
  * Vital Signs with Qualifying Elements, 1.0.0 STU1: https://www.hl7.org/fhir/us/vitals/STU1
    * extension:bodyPosition
    * extension:sleepStatus
    * extension:excercisAssociation
    * extension:measurementSetting
    * status
    * category.coding.system = $OBSERVATION_CATEGORY
    * category.coding.code = #vital-signs
    * code.coding.system = $LOINC
    * code.coding.code = #85354-9
    * effective
    * dataAbsentReason
    * interpretation
    * bodySite
    * method
    * referenceRange
      * low
      * high
      * age: range
    * component[systolic]
      * code.coding.system = $LOINC
      * code.coding.code = #8480-6
      * valueQuantity.value = <value>
      * valueQuantity.unit = string
      * valueQuantity.system = $UCUM
      * valueQuantity.code = "mm[Hg]"
      * dataAbsentReason
      * interpretation
      * referenceRange
    * component[diastolic]
      * code.coding.system = $LOINC
      * code.coding.code = #8462-4
      * valueQuantity.value = <value>
      * valueQuantity.unit = string
      * valueQuantity.system = $UCUM
      * valueQuantity.code = "mm[Hg]"
      * dataAbsentReason
      * interpretation
      * referenceRange
  * US Core, 7.0.0 STU7 : https://build.fhir.org/ig/HL7/US-Core
    * status
    * category.coding.system = $OBSERVATION_CATEGORY
    * category.coding.code = #vital-signs
    * code.coding.system = $LOINC
    * code.coding.code = #85354-9
    * effective
    * valueQuantity
    * dataAbsentReason
    * component[systolic].code.coding.system = $LOINC
    * component[systolic].code.coding.code = #8480-6
    * component[systolic].valueQuantity.value = <value>
    * component[systolic].valueQuantity.unit = string
    * component[systolic].valueQuantity.system = $UCUM
    * component[systolic].valueQuantity.code = "mm[Hg]"
    * component[systolic].dataAbsentReason
    * component[diastolic].code.coding.system = $LOINC
    * component[diastolic].code.coding.code = #8462-4
    * component[diastolic].valueQuantity.value = <value>
    * component[diastolic].valueQuantity.unit = string
    * component[diastolic].valueQuantity.system = $UCUM
    * component[diastolic].valueQuantity.code = "mm[Hg]"
    * component[diastolic].dataAbsentReason
* DE ISiK
* DE MI-I
  * ICU 1.0.0: https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.icu/1.0.0/files/769040
  * arterieller Blutdruck: https://simplifier.net/medizininformatikinitiative-modul-intensivmedizin/sd_mii_icu_arterieller_blutdruck
* DE KBV
  * 1.2.0: https://simplifier.net/packages/kbv.ita.aws/1.2.0/files/775745
    * meta-profile: fixed value
    * code.coding.system = $LOINC
    * code.coding.code = #85354-9
    * component[systolisch].code.coding.system = "**fhir.kbv.de/CodeSystem/KBV_CS_AW_Blutdruck_Typen**"
    * component[systolisch].code.coding.code = "**systolisch**"
    * component[systolisch].valueQuantity = <value>
    * component[diastolisch].code.coding.system = "**fhir.kbv.de/CodeSystem/KBV_CS_AW_Blutdruck_Typen**"
    * component[diastolisch].code.coding.code = "**diastolisch**"
    * component[diastolisch].valueQuantity = <value>
    * other attributes: forbidden
  * 4.2.0  https://simplifier.net/pvs-archivierungs-undwechselschnittstelle/kbv_pr_aw_observation_blutdruck
* openEHR CKM
