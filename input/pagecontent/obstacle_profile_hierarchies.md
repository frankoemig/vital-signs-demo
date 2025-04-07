### What is the current situation? 2 Level Profile Hierarchy!

Currently we have a two level hierarchy:
A base profile describes the relevant attributes including what must be supported.
But that leads to a lot conditions because not always all details can be provided.
Another difficulty arises if vendors want to implement a subset from this guide. 
Then the must-support flag leads to a lot of confusion:

<div width="400px">
{% include profile_hierarchy3.svg %}
</div>

That introduces a huge burden on the developer to identify what he needs to do.

### How can we create and establish a profile hierarchy to overcome this complex situation? 3 Level Profile Hierarchy!

A possible way out is to create a three-level profile hierarchy that separates requirements depending on the more detailed
specialisation for a specific vital sign element:

<div width="400px">
{% include profile_hierarchy2.svg %}
</div>

On the one hand, we have to describe which attributes are relevant.
That includes also the associated obligations.
On the other hand, some details are specific to the related content profiles like blood pressure. That differs for example by the fields that must be supported, eg. a single value for body weight, whereas blood pressure requires two components instead.

Another aspect is a specification what kind of obligation is associated.
For example, units for measurements can be handled in form of an equivalent, so that internally it can be converted back and forth into/from an internal representation. But the measured values must be handled exactly.

### Using Obligations? Actor-specific profiles!

In the previous section obligations are mentioned with the different classes.
It is debatable in which way they should be added or not. 
This would probably imply different profiles for creators and consumers. 
But this is another discussion.

### Whether we use (and introduce) obligations is another discussion? 4 Level Profile Hierarchy!

The vital signs discussion has revealed that different expectations are leading to different requirements.
The most prominent question is: What is a vital sign information?

A hierarchy with at least 4 levels may help to clarify that:

<div width="400px">
{% include profile_hierarchy4.svg %}
</div>

The coloring scheme may help to interpret.
