<style>
table th {background: #f0b033}
table tr:nth-child(even) {background: #EEE}
table tr:nth-child(odd) {background: #FFF}
</style>

This page discusses the category (and codes) for vital signs in general and blood pressure in specific:

Currently, all vital signs observations are conveyed with the same category code: **vital-signs**.

Then, only the observation code can give some more insight about what has been measured. 
But here again, only one code is allowed. That requires additional metadata to describe the context.
In newer profile versions for Core, this context has been eliminated.

### Analysis

But let's go back and analyse possible ways to express details and their consequences:

| No | Solution | Consequence | Semantic Evaluation |
| --- | --- | --- | --- |
| 1 | category = vital-sign && <br/>code = blood-pressure | There is no detailed information about what blood pressure exactly has been measured. Other attributes must be evaluated (if available). | wrong |
| 2 | category = vital-sign && <br/>code = specific-bp-measurement | Systems that are unaware of more detailed codes do not find something. | correct |
| 3 | category = vital-sign && <br/>codes = {blood-pressure, specific-bp-measurement} | Systems can search for a single code ("blood-pressure") and will find something. But those unware of the specific addition will misinterpret the data. | potentially wrong |
| 4 | category = vital-sign-bp && <br/>code = specific-bp-measurement | The category as a specialisation of vital-sign will allow for searching all bp measurements, but system will then be able to decide whether they can deal with the specific codes or not. However, this way all blood pressure measurements are assumed to be vital sign values which is incorrect. | correct for blood pressure |
| 5 | category = blood-pressure && <br/>code = specific-bp-measurement | The category as a sibbling to vital-sign will not find bp measurements if searching for vital-signs. | correct, but not vital sign |
| 6 | category = vital-sign && <br/>category = blood-pressure && <br/>code = specific-bp-measurement | The category contains the previous vital-sign code plus the general LOINC code to identify the specific vital-sign LOINC code. This identifies the observation as a vital-sign measurement, and which specific measurement it is, but it prevents the misinterpretation from the code. | correct |

### Possible Solution 4 for Category

It would be better to differentiate between various vital-sign observations.
The [category](CodeSystem-ObservationCategory.html) could look like:

* procedure
  * diagnostic
    * survey
	* imaging
	* ..
  * therapy
    * medication
  * caring
* vital-signs
  * blood pressure
    * systolic
    * diastolic
  * body weight
  * body height
  * BMI
* social-history
* ..

This hierarchy allows for a simple query for either all blood pressure measurements (category = blood pressure)
or a specific one (code = xyz).
However, it also implies (as mentioned in the table) that all blood pressure measurements are vital sign values
which is definitely not true.

### Possible Solution 6 for Category

Another option is to use 2 codes on category:

**code 1**: (original codesystem)

* procedure
* vital-signs
* social-history
* ..

**code 2**: (LOINC panel codes)

* blood pressure
* body weight
* body height
* temperature
* oxygen saturation

This option allows for a separation of declaring something as vital signs or not, and in addition 
what type (here: blood pressure measurements) it is.

### Using Multiple Codes

Another problem is raised by different types of terminologies.
Some provide clear and correct hierarchies, like Snomed.
Others provide codes with overlapping meaning. An example is LOINC:

* blood pressure
* blood pressure at rest
* blood pressure sitting
* blood pressure with low exercising
* blood pressure with heavy exercising

It is perfectly valid to combine codes - as long as they do not contradict each other.
Therefore, combining "sitting" with "at-rest" is ok, but "low" and "heavy" exercising or "at-rest" is not.

#### Precoordination

Another problem is pre-coordination: Snomed provides a mechanism to create new single codes.
The way the encoding is done with Observation.code.coding is to have multiple repetitions.
This way different repetitions (of LOINC codes) are used to represent a single concept - as long as
they are not contradicting.

The issue here is whether the codes are spread over different repetitions, or concatenated into one.

#### Different Granularity

Another problem is to represent different granularities:
It is stated, that then the same concept should be represented.
But this is certainly not the case, because on each level there are slightly different details in meaning.
For example "blood pressure sitting" is definitely not a less granular concept of "blood pressure sitting and at rest".
There is a difference for the interpretation, if the more granular concept is "blood pressure sitting and exercising".
So, one cannot take assumptions about what is missing.

Consequently, the most granular concept should be used for coding so that the receiver can decide whether the data
is usable for his context or not.

### Open Questions

After continuing the discussions, it appears that only a few specialisations of blood pressure belong to the vital sign category.
Therefore, the above listed hierarchy must be modified. It has to be discussed how!

