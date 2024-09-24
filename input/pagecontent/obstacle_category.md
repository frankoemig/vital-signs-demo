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
| 1 | category = vital-sign && code = blood-pressure | There is no detailed information about what blood pressure exactly has been measured. Other attributes must be evaluated (if available). | wrong |
| 2 | category = vital-sign && code = specific-bp-measurement | Systems that are unaware of more detailed codes do not find something. | correct |
| 3 | category = vital-sign && codes = {blood-pressure, specific-bp-measurement} | Systems can search for a single code ("blood-pressure") and will find something. But those unware of the specific addition will misinterpret the data. | potentially wrong |
| 4 | category = vital-sign-bp && code = specific-bp-measurement | The category as a specialisation of vital-sign will allow for searching all bp measurements, but system will then be able to decide whether they can deal with the specific codes or not. However, this way all blood pressure measurements are assumed to be vital sign values which is incorrect. | correct for blood pressure |
| 5 | category = blood-pressure && code = specific-bp-measurement | The category as a sibbling to vital-sign will not find bp measurements if searching for vital-signs. | correct, but not vital sign |
| 6 | category = vital-sign && category = blood-pressure && code = specific-bp-measurement | The category contains the previous vital-sign code plus the general LOINC code to identify the specific vital-sign LOINC code. This identifies the observation as a vital-sign measurement, and which specific measurement it is, but it prevents the misinterpretation from the code. | correct |

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

### Proposed Solution for (LOINC) Codes

Specify Value Sets for blood-pressure (in general) and systolic and diastolic that includes all possible LOINC codes,
ideally using a filter.

### Open Questions

After continuing the discussions, it appears that only a few specialisations of blood pressure belong to the vital sign category.
Therefore, the above listed hierarchy must be modified. It has to be discussed how!

