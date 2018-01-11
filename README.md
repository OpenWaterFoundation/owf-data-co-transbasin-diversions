# owf-data-co-transbasin-diversions #

This repository contains the [Open Water Foundation (OWF)](http://openwaterfoundation.org) dataset for Colorado transbasin diversions.  Transbasin diversions divert water across watershed boundaries, taking water from one stream or river and conveying it into an entirely different watershed.  The largest transbasin diversions in the state divert water from one side of the Continental Divide to the other.
This is a foundational dataset that provides unique identifiers and other data for transbasin diversions and the identifiers can be used to link other datasets.
OWF has created and is maintaining this dataset to facilitate work on various data analysis and visualization projects in Colorado.  **Note that this work is initially focused on the South Platte Basin.  The dataset will continue to be filled in as time and resources permit.** 

## Repository Contents ##

The repository contains the following:

```text
analysis/                                               TSTool software command files to process data into useful forms.
  Process-xlsx-to-csv.TSTool                            TSTool command file that processes the core dataset from .xlsx to .csv.
  Process-xlsx-to-geojson.TSTool                        TSTool command file that processes the core dataset from .xlsx to .geojson.  
  Process-time-series-data.TSTool                       TSTool command file that processes time series data of the primary streamflow gages associated with each transbasin diversion.  
data/                                                   Folder containing data files.
  Annual-Time-Series-Data.csv                           Annual time series data exported from TSTool.         
  Colorado-Transbasin-Diversions.csv                    The Excel file contents from the TransbasinDiversion worksheet converted to a csv file, useful for automated processing.
  Colorado-Transbasin-Diversions.xlsx                   Simple Excel file containing core data.
  Colorado-Transbasin-Diversions-Primary-Gages.geojson  Spatial data file of the locations of the gages that record the total amount of water diverted from each transbasin diversion project.
  Diversion-Gage-Relate.csv                             The Excel file contents from the Diversion_Gage_Relate worksheet converted to a csv file, useful for automated processing.
  Diversion-Structure-Relate.csv                        The Excel file contents from the Diversion_Structure_Relate worksheet converted to a csv file, useful for automated processing.  **IN INITIAL STAGES**
  Monthly-Time-Series-Data.csv                          Monthly time series data exported from TSTool.
doc/
  ?                                                     Additional documentation for the dataset.
output/                                                 Folder containing output products, such as graphs, and the template files used to create them.
  gage-annual-volume-graph-template.tsp                 Template used for creating graphs of annual streamflow for gages.
  gage-monthly-volume-graph-template.tsp                Template used for creating graphs of monthly streamflow for gages.
  .gitignore                                            Git configuration file to ignore files that should not be committed to the repository.  
.gitattributes                                          Git configuration file indicate repository configuration, in particular handling of line-ending and binary files.
.gitignore                                              Git configuration file to ignore files that should not be committed to the repository.
README.md                                               Explanation of repository contents, data files and sources and TSTool command files used to process the core data into other products.
```

### Colorado-Transbasin-Diversions.xlsx Contents ###

The core Excel workbook that serves as the master data contains the following data columns within the **TransbasinDiversion** worksheet.

* **TransbasinDiversionName** -- name of the transbasin diversion
* **Source_WaterDistrict** -- Division of Water Resources' Water District of the water source
* **Source_WaterDistrict_Flag** -- data status of Source_WaterDistrict values; see more detail below
* **Source_WaterDivision** -- Division of Water Resources' Water Division of the water source
* **Source_WaterDivision_Flag** -- data status of Source_WaterDivision values; see more detail below
* **Source_GNIS_Name_CSV** -- [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) name of the water source(s), in comma-separated format, to link federal datasets
* **Source_GNIS_Name_CSV_Flag** -- data status of Source_GNIS_Name_CSV values; see more detail below
* **Source_GNIS_ID_CSV** -- [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) identifier of the water source(s), in comma-separated format, to link federal datasets
* **Source_GNIS_ID_CSV_Flag** -- data status of Source_GNIS_ID_CSV values; see more detail below
* **Source_IBCCBasin** -- [Interbasin Compact Committee](http://cwcb.state.co.us/about-us/about-the-ibcc-brts/Pages/main.aspx) basin of the water source 
* **Source_IBCCBasin_Flag** -- data status of Source_IBCCBasin values; see more detail below
* **Destination_WaterDistrict** -- Division of Water Resources' Water District of the water destination
* **Destination_WaterDistrict_Flag** -- data status of Destination_WaterDistrict values; see more detail below
* **Destination_WaterDivision** -- Division of Water Resources' Water Division of the water destination
* **Destination_WaterDivision_Flag** -- data status of Destination_WaterDivision values; see more detail below
* **Destination_GNIS_Name_CSV** -- [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) name of the water destination, in comma-separated format, to link federal datasets
* **Destination_GNIS_Name_CSV_Flag** -- data status of Destination_GNIS_Name_CSV values; see more detail below
* **Destination_GNIS_ID_CSV** -- [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) identifier of the water destination, in comma-separated format, to link federal datasets
* **Destination_GNIS_ID_CSV_Flag** -- data status of Destination_GNIS_ID_CSV values; see more detail below
* **Destination_IBCCBasin** -- [Interbasin Compact Committee](http://cwcb.state.co.us/about-us/about-the-ibcc-brts/Pages/main.aspx) basin of the water destination 
* **Destination_IBCCBasin_Flag** -- data status of Destination_IBCCBasin values; see more detail below
* **Structure_WDID_CSV** -- WDIDs (state identifiers for structures such as ditches and reservoirs) of structures associated with the transbasin diversion, in comma-separated format, to link state datasets
* **Structure_WDID_CSV_Flag** -- data status of Structure_WDID_CSV values; see more detail below
* **Description** -- multi-sentence description of the transbasin diversion project, for educational purposes
* **Comment** -- any other information about the transbasin diversion


#### Data Flags ####
For many data columns, a second column of the same name with the word "_Flag" added to the column name is present.  These columns are an indication of data status as it relates to missing data.  The following conventions are used:
* G = Value is a known/good value.  
* g = Value is an estimated (but good) value.  The associated cell is also highlighted in yellow.
* N = Value is not applicable for the municipality and a blank cell is expected.
* M = Value is known to be missing in original source and therefore a blank cell indicates that a value cannot be provided.
* m = Value is estimated to be missing.  The associated cell is also highlighted in gray.
* z = Value is unable to be confirmed.  A value is possible but cannot be confirmed one way or the other.  The associated cell is also highlighted in orange.
* x = OWF has not made an attempt to populate the cell at this time.  The value is missing because OWF has not attempted to find the value.  The associated cell is also highlighted in black.

*Note that colors are visible only in xlsx files and not csv files.*

Column names are taken from original sources if possible.  For clarity and attribution, agency abbreviations may be added to the original column name.  Column name length is not restricted, therefore, some data representations such as Esri shapefiles may contain truncated column names.  In such cases, alternative formats such as GeoJSON are recommended.

Descriptions of identifiers are also provided in the **Notes** worksheet within the workbook.  This worksheet also details how the original data were downloaded and where to find those files.


Other worksheets within the workbook contain the following:

* **Diversion_Structure_Relate** worksheet lists the structures, such as ditches and reservoirs, that are associated with each transbasin diversion.  This worksheet is organized so that each structure associated with a transbasin diversion is its own record.  Therefore, the same diversion may be listed in more than one row and be associated with a different structure.  This will allow for the establishment of one-to-many relationships when linking to and processing other datasets.

* **Diversion_Gage_Relate** worksheet lists the primary streamflow gage that records the total amount of water that is diverted by the transbasin diversion project.  This worksheet was created separate from the main worksheet in order to clearly indicate locations of gages (Latitude and Longitude columns), as compared to locations of structures.

* **ChangeLog** worksheet indicates any changes made to the dataset, the date they occurred and who made the changes.

* **Metadata_TransbasinDiversion** worksheet serves as the metadata for data columns in the **TransbasinDiversion** worksheet.


### Colorado-Transbasin-Diversions.csv Contents ###

This file is the **TransbasinDiversion** worksheet saved in csv format.  Warning:  if this file is opened directly in Excel, IDs that contain leading zeroes will not show those zeroes.  Instead, import the file into a blank Excel file by selecting Data/Get External Data/From Text.


### Diversion-Structure-Relate.csv Contents ###

This file is the **Diversion_Structure_Relate** worksheet saved in csv format.  Warning:  if this file is opened directly in Excel, IDs that contain leading zeroes will not show those zeroes.  Instead, import the file into a blank Excel file by selecting Data/Get External Data/From Text.


### Diversion-Gage-Relate.csv Contents ###

This file is the **Diversion_Gage_Relate** worksheet saved in csv format.  Warning:  if this file is opened directly in Excel, IDs that contain leading zeroes will not show those zeroes.  Instead, import the file into a blank Excel file by selecting Data/Get External Data/From Text.


## Attribution ##

The data sources for this dataset are listed below.

* The starting point for this dataset was a list of transbasin diversions provided by a [recent publication](https://issuu.com/cfwe/docs/cfwe_cgtb_web) by Water Education Colorado about transbasin diversions.  This publication listed 44 transbasin diversions.  The count of diversions was corroborated by a [map](http://water.state.co.us/SurfaceWater/SWRights/WaterDiagrams/Pages/TransbasinDiversions.aspx) of diversions provided by Colorado's Division of Water Resources.  Both resources were the source of information about source and destination IBCC basins.  OWF has kept most of the names of diversions as-is, but decided to change a few to be more representative of the overall diversion project.  For example, many people know that the Adams Tunnel brings in water from Grand Lake to the Front Range, but likely more people know of the Colorado-Big Thompson Project, of which the Adams Tunnel is a part.  There are also two diversions listed as Columbine Ditch; OWF renamed these to be more specific to the basin in which they provide water.
* [Colorado's Decision Support Systems (CDSS)](http://cdss.state.co.us/Pages/CDSSHome.aspx) maintains a searchable list of [documents](http://cdss.state.co.us/DSSDocuments/Pages/DocumentsHome.aspx) by river basin.  Particularly useful documents were those associated with the South Platte Decision Support System (SPDSS).  As part of the SPDSS, key structures were documented that are particularly important for modeling purposes; each structure is described in its own memorandum.  Memoranda are available for the following transbasin diversions:  [Wilson Supply Ditch and Deadman Ditch](http://cwcbweblink.state.co.us/WebLink/DocView.aspx?id=125104&page=1&dbid=0), [Bob Creek Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124993/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c), [Laramie Poudre Tunnel](http://cwcbweblink.state.co.us/WebLink/0/doc/125066/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Skyline Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125100/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Cameron Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125025/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c), [Michigan Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125073/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Grand River Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125042/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c), [Colorado-Big Thompson Project (Alva B. Adams Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/124969/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c), [Moffat Collection System Project (Moffat Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125074/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Berthoud Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124990/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c), [Straight Creek Tunnel](http://cwcbweblink.state.co.us/WebLink/0/doc/125101/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Vidler Collection System (Vidler Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125102/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), [Roberts Tunnel Collection System (Roberts Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125099/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9), and the [Boreas Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124997/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c).  These memoranda serve as the data source for the following data columns:  Source_WaterDistrict, Source_WaterDivision, Source_GNIS_Name_CSV, Destination_WaterDistrict, Destination_WaterDistrict, Destination_GNIS_Name and Description.
* Minimal information could be found about the Columbine Ditch-South Platte transbasin diversion, likely because it is no longer in use.  CDSS's [Structures](http://cdss.state.co.us/onlineTools/Pages/StructuresDiversions.aspx) database indicates that the diversion has not run since 1956 and the structure has not been usable since 1980.
* CDSS's [Basin Reports](http://cdss.state.co.us/DSSDocuments/Pages/BasinReports.aspx) also provide information about transbasin diversions.  The [Upper Colorado River Basin Information](http://cwcbweblink.state.co.us/WebLink/DocView.aspx?id=125202&page=1&dbid=0) report provided information for those transbasin diversions that export water from the Colorado River basin. The report provides a summary of transbasin diversions, which was used in the Description column for some diversions.  The report also provides WDIDs for many structures.  Basin Reports are also available for the [Gunnison](http://cwcbweblink.state.co.us/WebLink/0/doc/125253/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede), [Southwest](http://cwcbweblink.state.co.us/WebLink/0/doc/125269/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede), [Yampa](http://cwcbweblink.state.co.us/WebLink/0/doc/125278/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede), and [White](http://cwcbweblink.state.co.us/WebLink/0/doc/146589/Electronic.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede) basins.   
* CDSS's [Modeling Dataset Documentation](http://cdss.state.co.us/DSSDocuments/Pages/ModelingDatasetDocumentation.aspx) contains StateMod modeling documents for several basins.  The reports provide lists of all the diversions used in modeling, with associated WDIDs.  Reports are available for the [South Platte](cwcbweblink.state.co.us/weblink/0/doc/204368/Electronic.aspx?searchid=95b15b6f-2ace-4b3f-a0d5-134352e5d550), [Colorado](http://cwcbweblink.state.co.us/weblink/0/doc/200075/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c), [Gunnison](http://cwcbweblink.state.co.us/weblink/0/doc/200073/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c), [Southwest](http://cwcbweblink.state.co.us/weblink/0/doc/200074/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c), [White](cwcbweblink.state.co.us/weblink/0/doc/200076/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c), and [Yampa](http://cwcbweblink.state.co.us/weblink/0/doc/200077/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c) basins.
* The [Source Water Route Framework](http://cdss.state.co.us/GIS/Pages/AllGISData.aspx), contains measured, named streams from the National Hydrography Dataset.  The framework was used to verify the Source_GNIS_Name_CSV and Destination_GNIS_Name data columns and provided the data for the Source_GNIS_ID_CSV and Destination_GNIS_ID data columns.


## Data Workflow ##
To be completed...


## How to Use the Data ##

The Colorado Transbasin Diversions dataset provides a complete statewide list of transbasin diversions assembled from multiple sources.  There are several identifiers associated with each transbasin diversion and the dataset allows cross-referencing the identifiers
so that other datasets can be joined.  For example, the dataset can be linked to the [Source Water Route Framework](http://cdss.state.co.us/GIS/Pages/AllGISData.aspx), which contains measured, named streams from the National Hydrography Dataset and uses GNIS IDs and names.

The Excel and csv files can be used as tabular datasets as is, to create filtered lists or to link to other datasets.  Data-processing software such as TSTool can be used to link this dataset to other datasets.  Datasets can be used within GIS software to create maps.

The format and contents of the dataset will change over time.  It is recommended to save a copy of the dataset.

## Disclaimer ##

OWF has created a complete statewide dataset of transbasin diversions.  OWF will attempt to fill data gaps as the dataset is used for analysis and funding allows for more data review.  OWF provides no guarantee as to the accuracy of the data.  **Use this dataset at your own risk.**  OWF welcomes feedback to improve the dataset.

## License ##

The license is being determined.  All the data are public so there are not really any restrictions on use.

## Contributing ##

The Open Water Foundation is adding value by cross-referencing datasets.
If you use the dataset and have comments, please contact the maintainers and/or use the GitHub issues to provide feedback.

## Maintainers ##

Kristin Swaim (@kswaim, kristin.swaim@openwaterfoundation.org) is the primary maintainer at the Open Water Foundation.

Steve Malers (@smalers, steve.malers@openwaterfoundation.org) is the secondary contact.

## Contributors ##

None yet, other than OWF staff.
