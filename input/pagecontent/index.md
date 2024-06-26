This IG is a demo to analyse some vital-signs profiles from different FHIR core specifications (in different countries).
Therefore this guide focuses on the following three:

* [Blood Pressure](bloodpressure.html)
* [Body Weight](body_weight.html)
* [Body Height](body_height.html)
* ... (more to be added on request)

> This guide is NOT intended to discuss what aretefact is to be considered being a vital sign.

Those three are selected because they are simple, comprehensive and easy to understand.
And those are in principle **country independent**, i.e. they should be the same world-wide.
The target of this guide is **not** to specify a set of complete and correct profiles,
but to trigger a discussion aorund profiling, i.e. the way profiles are currently created and maintained.
It seems totally unnecessary to profile the same artifacts again and again,
although different use cases may guide that way.
Comments in the direction of "it is impossible to specify the perfect" reality shows that diverging approaches
are also not sufficient or leading to less efforts.

The goal is:

* global content-oriented profiles, by
* cross-country specifications
* cross-standard specifications
* cross-language specifications

The idea behind this guide is to propose an alternative way to create profiles that enable interoperability
on a higher level. The targets are to present:

* the underlying data associated with those items
* an information model that aggregates the details and established the necessary relationships
* representation in different data standards, e.g. v2, V3/CDA and FHIR
* localisation to different countries
* localisation to more specific use cases
* mappings in between

> **Caveat:** Please keep in mind that everything on these pages is more or less incomplete. 
> Also, esp. the artifacts in this guide are still under development,
> although they are in parts already more complete or usable than the originating ones.

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

### Profiling: From data set to profiles!

**How to do the profiling?** 

From the information model use-case specific data sets have to be defined that collects and aggregates the necessary data.
Those representations have to be transfered into proper data-standard-specific profiles.
This way, all artifacts are considered with the same relationship to each other.

<div width="400px">
{% include guide_profiling.svg %}
</div>

### Overall Process

The details collected within a mindmap has to be transformed and taken over into the next subsequent model.
The following drawing illustrates that:

![Process](process.png){:width="600px"}
<br clear="all"/>  

After all, it has to be verified that no detail is lost. Also, it must be ensured that specific relationships,
esp. the minimum cardinality has been correctly represented in the next (derived) model.

There will be a back and forth between the different phases to improve the content, and to ensure consistency.
That helps to align and identify gaps.

### Meta-Model vs. Information Model

Another word on these two terms: In principle are they used interchangeably, ie. with the same intent.
However, most probably they are not quite equivalent because **information models** help with an overarching
collection of details that may be lost within **meta-models**.

### Profiling: Managing the IGs

Another question is about managing and structuring the different IGs!
Currently, we only have a single "FHIR Core" that is assumed to be
the base for all other similar IGs.
However, obviously this is not the case. 
More or less all countries are developing their own set of profiles that are - more or less - identical to each other.
Of course with the caveat, that due to their identification
(as a profile) the may look identical but are definitely not.

A solution may be to devide the profiles - including the aforementioned details - 
into individual IGs so that additions and modifications
may be easier - although more guides have to be maintained.
It will result in the following structure:

<div width="400px">
{% include profile_hierarchy.svg %}
</div>
