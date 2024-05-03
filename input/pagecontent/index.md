This IG is a demo to analyse some vital-signs profiles from different FHIR core specifications (in different countries):

* [Blood Pressure](bloodpressure.html)
* [Body Weight](body_weight.html)
* [Body Height](body_height.html)
* ... (more to be added on request)

Those three are selected because they are simple, comprehensive and easy to understand.
And those are in principle **country independent**, i.e. they should be the same world-wide.
The target of this guide is **not** to specify a complete and correct profiles,
but to trigger a discussion aorund profiling.
It seems totally unnecessary to profile the same artifacts again and again,
although different use cases may guide that way.

The idea behind this guide is to propose an alternative way to create profiles that enable interoperability
on a higher level. The targets are to present:

* the data associated with those items
* an information model that aggregates the details
* representation in different data standards, w.g. v2 and FHIR
* localisation to different countries
* mappings in between

> **Caveat:** please keep in mind that everything is more or less incomplete. 
> Also the artifacts in this guide are still under development.

### Process Model

The following drawing is a rough idea of how the resulting profiles should be created.
The red line guides you:

<div width="400px">
{% include guide.svg %}
</div>

Domain experts have to provide the necessary domain knowledge which has to be formalized accordingly.
That results in a set of related classes in an information model.
This information model should not only influence the data model and applicatin a vendor is developing, 
but also the derived data set that is the foundation for the profile (hierarchy).

### Profiling

**How to do the profiling?**

From the information model use-case specific data sets have to be defined that collects and aggregates the necessary data.
Those representations have to be transfered into proper data-standard-specific profiles.
This way, all artifacts are considered with the same relationship to each other.

<div width="400px">
{% include guide_profiling.svg %}
</div>
