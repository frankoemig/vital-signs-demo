**What is the current situation?**

Currently we have a two level hierarchy:
A base profile describes the relevant attributes including what must be supported.
But that leads to a lot conditions because not always all can be provided.

<div width="400px">
{% include profile_hierarchy3.svg %}
</div>

That introduces a huge burden on the developer to identify what he needs to do.

**How can we create and establish a profile hierarchy to overcome this complex situation?**

<div width="400px">
{% include profile_hierarchy2.svg %}
</div>

On the one hand, we have to describe which attributes are relevant.
That includes also the associated obligations.
On the other hand, some details are specific to the related content profiles like blood pressure. That differs for example by the fields that must be supported, eg. a single value for body weight, whereas blood pressure requires two components instead.

Another aspect is a specification what kind of obligation is associated.
For example, units for measurements can be handled in form of an equivalent, so that internally it can be converted back and forth into/from an internal representation. But the measured values must be handled exactly.

**Whether we use (and introduce) obligations is another discussion.**
