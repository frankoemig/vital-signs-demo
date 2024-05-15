This obstacle discusses the category for vital signs:

Currently, all vital signs observations are conveyed with the same category code: **vital-signs**.

Then, only the observation code can give some more insight about what has been measured. 
But here again, only one code is allowed. That requires additional metadata to describe the context.
In newer profiles, this context has been eliminated.


### Proposed Solution

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
  * body weight
  * body height
  * BMI
* social-history
* ..

This hierarchy allows for a simple query for either all blood pressure measurements (category = blood pressure)
or a specific one (code = xyz).
