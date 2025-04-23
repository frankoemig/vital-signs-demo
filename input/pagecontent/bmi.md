<style>
table th {background: #f0b033}
table tr:nth-child(even) {background: #EEE}
table tr:nth-child(odd) {background: #FFF}
</style>

This is the homepage for BMI.
It tries to realize the overall process for creating (FHIR) profiles.

### Step 1: MindMap

<div>
{% include bmi_mm.svg width='600px' %}
</div>

### Step 2: Information Model

<div>
{% include bmi_im.svg width='600px' %}
</div>

### Step 3: Hierarchy for Vital Signs Profiles (informative)

tbd (or reference)

### Step 4: Technology Binding (ITS)

**How to represent the same information in different standards?**

#### Step 4a: Profile (with FHIR)

tbd


#### Step 4b: Template (with CDA)

tbd

#### Step 4c: OBX Segment Group profile (with v2.x)

tbd

#### Step 4d: Other Standards

In order to enable interoperability also other standards have to be included into
the technology binding (ITS):

* openEHR
* xDT (for Germany)
