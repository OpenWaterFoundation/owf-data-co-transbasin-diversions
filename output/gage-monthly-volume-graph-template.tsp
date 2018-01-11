# Template to graph gage monthly water diversion totals
[Product]

ProductType = "Graph"
TotalWidth = "600"
TotalHeight = "400"
MainTitleString = "${gage}"
SubTitleString = "Monthly Diversions, Acre-Feet"

[SubProduct 1]

GraphType = "Line"
LeftYAxisTitlePosition = "LeftOfAxis"
LeftYAxisTitleRotation = "270"
LeftYAxisTitleString = "Acre-Feet"
LeftYAxisLabelPrecision = "0"
LegendFormat = "%A"

[Data 1.1]

TSAlias = "${gage}-Streamflow-Month"
LegendFormat = "%A"
Color = "blue"


