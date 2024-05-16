This is the homepage for body weight...

### Step 1: MindMap

<div width="400px">
{% include body_weight_mm.svg %}
</div>

### Step 2: Information Model

<div width="500px">
{% include body_weight_im.svg %}
</div>

### Step 3: Hierarchy for Vital Signs Profiles (informative)

<div width="500px">
{% include body_weight_hierarchy.svg %}
</div>

### Step 4: Technology Binding (ITS)

**How to represent the same information in different standards?**

#### Step 4a: Profile (with FHIR)

<div width="500px">
{% include body_weight_profile.svg %}
</div>

#### Step 4b: Template (with CDA)

tbd

#### Step 4c: OBX Segment Group profile (with v2.x)


Please see [logical model](StructureDefinition-OBXbodyweightsegmentgroup.html).

As a draft:

| Segment | Card. | Content | Value Type | Unit | Code | Comment |
| --- | --- | --- | --- | --- | --- |
| PID | 1..1 | Patient information | n/a | n/a | n/a | PID-3 |
| PV1 | 1..1 | Visit information | n/a | n/a | n/a | PV1-19 |
| OBX | 1..1 | body weight |  NM | (k)g | $LOINC#tbd | main entry into BW results |
| PRT | 0..* | for different participants | n/a | n/a | n/a | appropriate participant definitions are necessary |
| OBX | 0..1 | eating | CWE | tbd |  $LOINC#tbd |
| OBX | 0..1 | clothing | CWE | tbd | $LOINC#tbd |
| OBX | 0..* | missing body structures | CWE | tbd | $SCT#tbd |

Notes:

* It has to be considered that segments are relevant that are not directly represented in the same group.
* Some codes are just place holders.

### Country-specific Derivations

.. are not necessary so far.

### References + Specifics

* US Core
* DE Core
* NHS Core
