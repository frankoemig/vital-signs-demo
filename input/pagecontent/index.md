This IG is a demo to analyse some vital-signs profiles from different FHIR core specifications (in different countries).
Therefore this guide focuses on the first following three.
The others are mentioned for completeness:

* [Blood Pressure](bloodpressure.html)
* [Body Weight](body_weight.html)
* [Body Height](body_height.html)
* Body Temperature
* Heart Rate
* Oxygen Saturation
* [BMI](bmi.html)
* ... (more to be added on request)

> This guide is NOT intended to discuss what aretefact is to be considered being a **vital sign**
> although the discussion in some groups demand that.
> As demonstrated with the following drawing, on some yet considered observations are **real** vital signs.
> Why? Some measurements like body weight are good to know and to consider when examining the vital status
> of a person, but are definitely **not** an indication for being a vital and living person. 
> Good examples are body weight and height.
> Others, like blood pressure, contain a lot of different measurements, for example doing some excercising,
> so that only a subset can be considered a vital sign.
> <red>Therefore, a different profile hierarchy must be established! But this is another discussion.</red>

![Process](vitalsigns.png){:width="600px"}
<br clear="all"/>  

So, the panel is the collection of vital sign eligible measurements.
In other words, for example, not all possible blood pressure measurements are good to express a vital sign.
For example, 24h or 1w average measurements are also bp values, but not for vital signs.
Therefore, they denote a subset of all possible bp measurements:

<div width="400px">
{% include vitalsign_panel.svg %}
</div>
 

Those three are selected because they are simple, comprehensive and easy to understand.
And those are in principle **country independent**, i.e. they should be the same world-wide.
The target of this guide is **not** to specify a set of complete and correct profiles,
but to trigger a discussion aorund profiling, i.e. the way profiles are currently created and maintained.
It seems totally unnecessary to profile the same artifacts again and again,
although different use cases may guide that way.
Comments in the direction of "it is impossible to specify the perfect" reality shows that diverging approaches
are also not sufficient or leading to less efforts.

The goal is:

* global content-oriented profiles,
* for generic use,
* but also constrained for specific purposes, eg. panel only, by
* cross-country specifications
* cross-standard specifications
* cross-language specifications

### Primary Purpose of this Guide

The idea - and primary purpose - behind this (small) guide is to propose an alternative way 
to create profiles that enable interoperability on a higher level. 
The targets are to present:

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
The red line (arrows) guides you:

<div width="400px">
{% include guide.svg %}
</div>

Domain experts have to provide the necessary domain knowledge which has to be formalized accordingly.
The mindmap is just a high-level means to summarize all details that are somehow relevant.
Because complex models (in a formal representation) are not that easy to understand, a better way has to be found.
Therefore, the domain experts have to equip the mindmap with additional details that are best represented
in form of simple natural language sentences.
For example, "every value is measured a certain single point in time."
Or "each measured value has a unit."

Both, the mindmap and the explanation, must be translated into a set of related classes in an information model,
ideally using formal representations like BPMN.
This information model should not only influence the data model and application a vendor is developing, 
but also the derived data set that is the foundation for the profile (hierarchy).

### Profiling: From data set to profiles!

**How to do the profiling?** 

From the information model use-case specific data sets have to be defined that collects and aggregates the necessary data.
Those representations have to be transfered into proper data-standard-specific profiles.
This way, all artifacts are considered with the same relationship to each other.

<div width="400px">
{% include guide_profiling.svg %}
</div>

Note: Different versions of the same standard has to be treatened as different standards.

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

This hierarchy has been enhanced mmeanwhile because different expectations arose from discussions in some groups.
The implementation guide can only support and help to clarify it by enhancing the hierarchy to cover different dimensions:

* multi-country: different countries may want to add different requirements
* value set constraints: reducing to a single codesystem, eg. just LOINC or Snomed CT, independent from a country
* general and specific use: for all types of vital sign measurements, eg. blood pressure measurements, or just a limited subset, eg. standard blood pressure measurements
* w/ or w/o identification of patients or other involved persons
* ...

### Links/Further References

* https://sparked.csiro.au/wp-content/uploads/2024/04/Sparked-AUCDI-R1-Draft-for-Community-Comment-V1.0.pdf
* https://sparked.csiro.au/index.php/sparked-products-resources/australian-core-data-for-interoperability/aucdi-release-1-community-comment/
* https://build.fhir.org/ig/aehrc/logical-model-web/index.html
  * https://build.fhir.org/ig/aehrc/logical-model-web/logicalModel.html
  