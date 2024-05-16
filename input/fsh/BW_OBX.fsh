
//===========================================================================


Profile: OBXmainBW
Parent: OBXsegment
Id: OBXmainBW
Title: "Body Weight Main (Profile) in v2"
Description: "v2 Profile: **Body Weight Measurement**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2code#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9



Profile: OBXclothing
Parent: OBXsegment
Id: OBXclothing
Title: "Body Weight Clothing (Profile) in v2"
Description: "v2 Profile: **Body Weight Clothing Observation**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2code#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9




Profile: OBXeating
Parent: OBXsegment
Id: OBXeating
Title: "Body Weight Eating (Profile) in v2"
Description: "v2 Profile: **Body Weight Eating Observation**"

* ^version = "0.1.0"
* insert HeaderDetailRules

* seqNo = 1
* valueDataType 1..1 MS
* valueDataType = $v2code#NM
* observationCode 1..1 MS
//* observationCode = $loinc#85354-9



//===========================================================================

Profile: OBXbodyweightsegmentgroup
Parent: SegmentGroup
Title: "OBX Body Weight Segment Group"
Description: "This profile should describe in which way the segment instances for PID, OBX and REL belong together"

* segment 3..* MS

//slice the segment
* segment ^slicing.discriminator.type = #value
* segment ^slicing.discriminator.path = "system"
* segment ^slicing.rules = #openAtEnd

//the slice has the name diastolicBP
* segment contains
   PIDsegment 1..1 MS and
   OBXmainBW 1..1 MS and
   RELsegment 0..1 MS and
   OBXclothing 0..1 MS and
   OBXeating 0..1 MS


