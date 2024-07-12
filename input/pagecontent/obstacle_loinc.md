This obstacle discusses the use of LOINC codes:

It appears that the LOINC codes are somehow incomplete in their definition.
Let's take arterial systolic BP as an example:

|LOINC|Long Common Name|Component|Property|Timing|System|Scale|Method|Class|Example UCUM Units|Order/Observation|
| --- | --- | --- | --- | --- | --- |
|86908-1|Systolic blood pressure goal|Intravascular systolic goal|Pres|Pt|Arterial system|Qn| |CLIN|mm[Hg]|Both|
|8450-9|Systolic blood pressure--expiration|Intravascular systolic^expiration|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]|
|89280-2|Systolic blood pressure--during anesthesia|Intravascular systolic^during anesthesia|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]|Both 
|8451-7|Systolic blood pressure--inspiration|Intravascular systolic^inspiration|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]| |
|89268-7|Systolic blood pressure--lying in L-lateral position|Intravascular systolic^lying in L-lateral position|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]|Both 
|87741-5|Systolic blood pressure--post exercise|Intravascular systolic^post exercise|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]|Both|
|8459-0|Systolic blood pressure--sitting|Intravascular systolic^sitting|Pres|Pt|Arterial system|Qn| |BP.PSTN.MOLEC|mm[Hg]| |
| **8460-8** |Systolic blood pressure--standing|Intravascular systolic^standing|Pres|Pt|Arterial system|Qn| |BP.PSTN.MOLEC|mm[Hg]| | 
|8461-6|Systolic blood pressure--supine|Intravascular systolic^supine|Pres|Pt|Arterial system|Qn| |BP.PSTN.MOLEC|mm[Hg]|
|87739-9|Systolic blood pressure--W exercise|Intravascular systolic^W exercise|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]|Both
|8452-5|Systolic blood pressure.inspiration - expiration|Intravascular systolic.inspiration - expiration|Pres|Pt|Arterial system|Qn| |BP.MOLEC|mm[Hg]| |

**8480-8** cannot act as a **parent code** for all type of systolic measurements within the above group
because the others are not real specialisations.
Doing some exercising normally leads to an increase of the measured value.
The reference range is also increased influencing the interpretation.
So, without knowing the context a correct interpretation is not possible.

