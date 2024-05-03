<style>
table th {background: #f0b033}
table tr:nth-child(even) {background: #EEE}
table tr:nth-child(odd) {background: #FFF}
</style>


Another but very important aspect is the translation of requirements into different base standards.
Each data exchange standard uses different technical terms to express the same:

| Requirement in natural language | in FHIR | in CDA | in v2.x | in v2+ |
| --- | --- | --- | --- | --- |
| populate this element with exactly the specified information, \nno null values, nothing else | mustSupport=true, extensions not allowed, minCard = 1 | "M"  | "R" | implement=true, minCard = 1 |
| populate this element with exactly the specified information, \nnull values allowed but nothing else | mustSupport=true, DAR allowed, minCard = 1 | "R" | "R" | implement=true, minCard = 1 |
| support this element with exactly the specified information and populate if you can, \nno null values | mustSupport=true, extensions not allowed, minCard = 0 | "M"  | "RE" |
| the developer can decide to support this element | mustSupprt = empty | "O" | "O" | |
| the element is forbidden | mustSupprt = false, maxCard = 0 | "X" | "X" | implement = false, maxCard = 0 |
| ... |  |  |  |

