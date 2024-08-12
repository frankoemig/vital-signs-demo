What are the different options to create value sets?

* by constraint
* by composition

![Process](valueset.png){:width="600px"}
<br clear="all"/>  

### By Constraint

... starts with the complete set, and constraints it down by limiting it's use depending on the profile.
This way, the derived profile applies filter criteria on the higher level set.

### By Composition

... starts with the creation of individual value sets.
This is done on the most granular level where the individual value sets are defined.
On higher levels, they are aggregated by including them.

### Summary

The FHIR standard way to create value sets is by starting with the highest level value set. 
All possible codes are identified, either by a detailed list, or by filter criteria on the underlying codesystem.