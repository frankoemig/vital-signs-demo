How to create and establish a profile hierarchy?
Why do we need hierarchies?

<div width="400px">
{% include profile_hierarchy2.svg %}
</div>

On the one hand, we have to describe which attributes are relevant.
That includes also the associated obligations.
On the other hand, some details are specific to the related content profiles like blood pressure. That differs for example by the fields that must be supported, eg. a single value for body weight, whereas blood pressure requires two components instead.

Another aspect is a specification what kind of obligation is associated.
For example, units for measurements can be handled in form of an equivalent, so that internally it can be converted back and forth into/from an internal representation. But the measured values must be handled exactly.
