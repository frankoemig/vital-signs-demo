Why to add a category on components?

There is a discussion ongoing whether a category on components is helpful or not.
This discussion takes place in the vital signs OO subgroup.
For observation profiles that makes use of two or three components, esp. when each component
makes us of a very limited set of codes.
But for several components with many codes it becomes tedious (and ineffective), but not impossible,
to identify the individual occurences.

[One possible but yet incomplete representation](StructureDefinition-us-core-modified-blood-pressure-2.html) for 
the general blood pressure mesurement profile,
i.e. the one NOT using extensions, demonstrates quite a lot:

* systolic BP
* diastolic BP
* mean arterial BP (can be expressed as direct value in observation instead of component)
* pulse BP
* body position
* consciousness
* exertion
* cuff type
* cuff size
* location
* tilt

Each component can be identified with a specific set of codes.
The necessary computation to identify a component, the slice name is not represented in an instance,
may be inefficient.
