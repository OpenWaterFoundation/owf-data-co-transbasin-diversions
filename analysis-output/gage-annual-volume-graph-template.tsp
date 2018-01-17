# Template to graph gage annual water diversion totals
[Product]

ProductType = "Graph"
TotalWidth = "700"
TotalHeight = "400"
MainTitleString = "${gage}"
SubTitleString = "Annual Diversions, Acre-Feet"
MainTitleFontSize = "16"
MainTitleFontStyle = "Bold"

[SubProduct 1]

GraphType = "Line"
LeftYAxisTitlePosition = "LeftOfAxis"
LeftYAxisTitleRotation = "270"
LeftYAxisTitleString = "Acre-Feet"
LeftYAxisLabelPrecision = "0"
LegendFormat = "%A"

[Data 1.1]

TSAlias = "${gage}-Streamflow-Annual"
LegendFormat = "%A"
Color = "blue"


