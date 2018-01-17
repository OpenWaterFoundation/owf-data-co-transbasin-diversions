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
analysis-output/                                        Folder containing output products, such as graphs, and the template files used to create them.
  gage-annual-volume-graph-template.tsp                 Template used for creating graphs of annual streamflow for gages.
  gage-monthly-volume-graph-template.tsp                Template used for creating graphs of monthly streamflow for gages.
  .gitignore                                            Git configuration file to ignore files that should not be committed to the repository.  
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
.gitattributes                                          Git configuration file indicate repository configuration, in particular handling of line-ending and binary files.
.gitignore                                              Git configuration file to ignore files that should not be committed to the repository.
README.md                                               Explanation of repository contents, data files and sources and TSTool command files used to process the core data into other products.
```

### Colorado-Transbasin-Diversions.xlsx Contents ###

The core Excel workbook that serves as the master data contains the following data columns within the **TransbasinDiversion** worksheet.

* **TransbasinDiversionName** - name of the transbasin diversion; adapted from Water Education Colorado's [Citizen's Guide to Colorado's Transbasin Diversions](https://issuu.com/cfwe/docs/cfwe_cgtb_web), see Attribution section below
* **Source_WaterDistrict_ID** - Division of Water Resources' Water District ID of the water source
* **Source_WaterDistrict_ID_Flag** - data status of Source_WaterDistrict values; see more detail below
* **Source_WaterDistrict_Name** - Division of Water Resources' Water District name of the water source
* **Source_WaterDivision** - Division of Water Resources' Water Division of the water source
* **Source_WaterDivision_Flag** - data status of Source_WaterDivision values; see more detail below
* **Source_GNIS_Name_CSV** - [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) name of the water source(s), in comma-separated format, to link federal datasets
* **Source_GNIS_Name_CSV_Flag** - data status of Source_GNIS_Name_CSV values; see more detail below
* **Source_GNIS_ID_CSV** - [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) identifier of the water source(s), in comma-separated format, to link federal datasets
* **Source_GNIS_ID_CSV_Flag** - data status of Source_GNIS_ID_CSV values; see more detail below
* **Source_Structure_WDID_CSV** - WDIDs (state identifiers for structures such as ditches and reservoirs) of structures associated with the source of the transbasin diversion, in comma-separated format, to link state datasets.  In a typical transbasin diversion, there is a "source" structure(s) which is the point of diversion from a stream; this structure(s) may or may not have diversion records.
* **Source_Structure_WDID_CSV_Flag** - data status of Destination_Structure_WDID_CSV values; see more detail below
* **Source_IBCCBasin** - [Interbasin Compact Committee](http://cwcb.state.co.us/about-us/about-the-ibcc-brts/Pages/main.aspx) basin of the water source 
* **Source_IBCCBasin_Flag** - data status of Source_IBCCBasin values; see more detail below
* **Destination_WaterDistrict_ID** - Division of Water Resources' Water District ID of the water destination
* **Destination_WaterDistrict_ID_Flag** - data status of Destination_WaterDistrict values; see more detail below
* **Destination_WaterDistrict_Name** - Division of Water Resources' Water District name of the water destination
* **Destination_WaterDivision** - Division of Water Resources' Water Division of the water destination
* **Destination_WaterDivision_Flag** - data status of Destination_WaterDivision values; see more detail below
* **Destination_GNIS_Name_CSV** - [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) name of the water destination, in comma-separated format, to link federal datasets
* **Destination_GNIS_Name_CSV_Flag** - data status of Destination_GNIS_Name_CSV values; see more detail below
* **Destination_GNIS_ID_CSV** - [Geographic Names Information System](https://geonames.usgs.gov/apex/f?p=138:1:9185633219989) identifier of the water destination, in comma-separated format, to link federal datasets
* **Destination_GNIS_ID_CSV_Flag** - data status of Destination_GNIS_ID_CSV values; see more detail below
* **Destination_Structure_WDID_CSV** - WDIDs (state identifiers for structures such as ditches and reservoirs) of structures associated with the destination of the transbasin diversion, in comma-separated format, to link state datasets.  In a typical transbasin diversion, there is a "destination" structure, sometimes called a release structure, with a WDID similar to the source structure (the district number differs, but the structure ID is the same); this may or may not have diversion records. 
* **Destination_Structure_WDID_CSV_Flag** - data status of Destination_Structure_WDID_CSV values; see more detail below
* **Destination_IBCCBasin** - [Interbasin Compact Committee](http://cwcb.state.co.us/about-us/about-the-ibcc-brts/Pages/main.aspx) basin of the water destination 
* **Destination_IBCCBasin_Flag** - data status of Destination_IBCCBasin values; see more detail below
* **Description** - multi-sentence description of the transbasin diversion project, for educational purposes
* **Comment** - any other information about the transbasin diversion


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

* **Diversion_Gage_Relate** worksheet lists the primary streamflow gage that records the total amount of water that is diverted by the transbasin diversion project.  This worksheet was created separate from the main worksheet in order to clearly indicate locations of gages (Latitude and Longitude columns), as compared to locations of structures.  Gages, typically operated by the U.S. Geological Survey, were used for diversion totals rather than diversion structure records because the gages tend to have a longer period of record.

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

* The starting point for this dataset was a list of transbasin diversions provided by a recent publication by Water Education Colorado titled [Citizen's Guide to Colorado's Transbasin Diversions](https://issuu.com/cfwe/docs/cfwe_cgtb_web).  This publication listed 44 transbasin diversions.  The count of diversions was corroborated by a [map](http://water.state.co.us/SurfaceWater/SWRights/WaterDiagrams/Pages/TransbasinDiversions.aspx) of diversions provided by Colorado's Division of Water Resources.  Both resources were the source of information about source and destination IBCC basins.  OWF has kept most of the names of diversions as-is, but a few were changed to be more representative of the overall diversion project.  For example, the "Adams Tunnel" transbasin diversion was changed to "Colorado-Big Thompson Project".  Many people know that the Adams Tunnel brings in water from Grand Lake to the Front Range, but likely more people know of the Colorado-Big Thompson Project, of which the Adams Tunnel is a part.  There are also two diversions listed as Columbine Ditch; OWF renamed these to "Columbine Ditch-South Platte" and "Columbine Ditch-Arkansas" be more specific to the basin in which they provide water.
* [Colorado's Decision Support Systems (CDSS)](http://cdss.state.co.us/Pages/CDSSHome.aspx) maintains a searchable list of [documents](http://cdss.state.co.us/DSSDocuments/Pages/DocumentsHome.aspx) by river basin.  The documents used for each basin are described below.
    * South Platte Basin -- Particularly useful documents were those associated with the South Platte Decision Support System (SPDSS).  As part of the SPDSS, key structures were documented that are particularly important for modeling purposes; each structure is described in its own memorandum.  Memoranda are available for the following transbasin diversions:
        * [Wilson Supply Ditch and Deadman Ditch](http://cwcbweblink.state.co.us/WebLink/DocView.aspx?id=125104&page=1&dbid=0)
        * [Bob Creek Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124993/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c)
        * [Laramie Poudre Tunnel](http://cwcbweblink.state.co.us/WebLink/0/doc/125066/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Skyline Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125100/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Cameron Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125025/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c)
        * [Michigan Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125073/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Grand River Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/125042/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c)
        * [Colorado-Big Thompson Project (Alva B. Adams Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/124969/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c)
        * [Moffat Collection System Project (Moffat Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125074/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Berthoud Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124990/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c)
        * [Straight Creek Tunnel](http://cwcbweblink.state.co.us/WebLink/0/doc/125101/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Vidler Collection System (Vidler Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125102/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Roberts Tunnel Collection System (Roberts Tunnel)](http://cwcbweblink.state.co.us/WebLink/0/doc/125099/Page1.aspx?searchid=75f7362c-b2f6-4fa3-bea2-2d04421652e9)
        * [Boreas Pass Ditch](http://cwcbweblink.state.co.us/WebLink/0/doc/124997/Page1.aspx?searchid=61570563-fbed-4ee3-9541-1661e90bea0c).  

        These memoranda serve as the data source for the following data columns:  Source_WaterDistrict, Source_WaterDivision, Source_GNIS_Name_CSV, Destination_WaterDistrict, Destination_WaterDistrict, Destination_GNIS_Name and Description.
    * Arkansas Basin -- not yet determined
    * Rio Grande Basin -- not yet determined
    * Gunnison Basin -- not yet determined
    * Colorado Basin -- not yet determined
    * Southwest Basin -- not yet determined
    * Yampa Basin -- not yet determined
    * North Platte Basin -- not yet determined
* Minimal information could be found about the Columbine Ditch-South Platte transbasin diversion, likely because it is no longer in use.  CDSS's [Structures](http://cdss.state.co.us/onlineTools/Pages/StructuresDiversions.aspx) query tool indicates that the diversion has not run since 1956 and the structure has not been usable since 1980.
* CDSS's [Basin Reports](http://cdss.state.co.us/DSSDocuments/Pages/BasinReports.aspx) also provide information about transbasin diversions.  The reports provide a summary of transbasin diversions, which are used in the Description column for some diversions.  The reports also provide WDIDs for many structures.  Basin Reports are available for the following basins:
    * [Colorado](http://cwcbweblink.state.co.us/WebLink/DocView.aspx?id=125202&page=1&dbid=0)
    * [Gunnison](http://cwcbweblink.state.co.us/WebLink/0/doc/125253/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede)
    * [Southwest](http://cwcbweblink.state.co.us/WebLink/0/doc/125269/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede)
    * [White](http://cwcbweblink.state.co.us/WebLink/0/doc/146589/Electronic.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede) 
    * [Yampa](http://cwcbweblink.state.co.us/WebLink/0/doc/125278/Page1.aspx?searchid=c6a047ba-491e-4563-a38c-523416f01ede)
* CDSS's [Modeling Dataset Documentation](http://cdss.state.co.us/DSSDocuments/Pages/ModelingDatasetDocumentation.aspx) contains StateMod modeling documents for several basins.  The reports provide lists of all the diversions used in modeling, with associated WDIDs.  Reports are available for the following basins:
    * [South Platte](cwcbweblink.state.co.us/weblink/0/doc/204368/Electronic.aspx?searchid=95b15b6f-2ace-4b3f-a0d5-134352e5d550)
    * [Colorado](http://cwcbweblink.state.co.us/weblink/0/doc/200075/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c)
    * [Gunnison](http://cwcbweblink.state.co.us/weblink/0/doc/200073/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c)
    * [Southwest](http://cwcbweblink.state.co.us/weblink/0/doc/200074/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c)
    * [White](cwcbweblink.state.co.us/weblink/0/doc/200076/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c)
    * [Yampa](http://cwcbweblink.state.co.us/weblink/0/doc/200077/Electronic.aspx?searchid=d8eca6f8-7cfe-4ddf-9788-5886fd932c8c)
* The [Source Water Route Framework](http://cdss.state.co.us/GIS/Pages/AllGISData.aspx), contains measured, named streams from the National Hydrography Dataset.  The framework was used to verify the Source_GNIS_Name_CSV and Destination_GNIS_Name data columns and provided the data for the Source_GNIS_ID_CSV and Destination_GNIS_ID data columns.


## Analysis Workflow ##
This analysis of transbasin diversions is focused on diversions between water divisions (large river basins), as compared to water districts.  While the destination water district is listed, it should be understood that this is the district in which the diverted water is initially received.  At this time, OWF has not attempted to further detail how water is parsed once it has been diverted to a new basin.  Future versions of this dataset may provide a more detailed analysis at the water district level.  The general workflow is as follows once the basic dataset is created:
1. Data flags are created for many of the data columns that indicate data status as described above.
2. The data are formatted as a table to allow for data filtering.
3. The dataset is saved in .xlsx format.
4. The xlsx-formatted file is opened in TSTool and a short command file [(Process-xlsx-to-csv.TSTool)](https://github.com/OpenWaterFoundation/owf-data-co-transbasin-diversions/blob/master/analysis/Process-xlsx-to-csv.TSTool) converts the dataset into CSV format, to be used in additional data-processing steps.
5. The xlsx-formatted file is opened in TSTool and a short command file [(Process-xlsx-to-geojson.TSTool)](https://github.com/OpenWaterFoundation/owf-data-co-transbasin-diversions/blob/master/analysis/Process-xlsx-to-geojson.TSTool) converts the dataset into GeoJSON format.  This step is optional and applicable for datasets in which a map will be created or if further processing will occur in GIS application such as QGIS.
6. The [Diversion-Gage-Relate.csv](https://github.com/OpenWaterFoundation/owf-data-co-transbasin-diversions/blob/master/data/Colorado-Transbasin-Diversions.csv) file is processed in a TSTool command file [(Process-time-series-data.TSTool)](https://github.com/OpenWaterFoundation/owf-data-co-transbasin-diversions/blob/master/analysis/Process-time-series-data.TSTool) to download monthly time series data.  The data are further summed into annual amounts of diverted flow.  The processing steps are as follows:
	1. Diversion-Gage-Relate.csv file is read in so that the "Gage_ID" column can be used to match to time series data available in HydroBase, a database of real-time, historic and geographic data related to water resources in Colorado provided by the Division of Water Resources that is directly accessible within TSTool.
	2. Get monthly time series data for each gage using the ReadTimeSeriesList() command.  Values are in acre-feet.
	3. Sum monthly time series data to calculate annual diversion amounts for each gage.
	4. Set any annual totals listed as 0 to missing.  Zeroes may be an indication that the gage was not recording properly or that diversions were not made that year.  In either case, OWF decided to remove zeroes so that the mean annual diversion total is more representative of years when diversions are made.  
	5. Calculate the mean annual diversion total for each gage.  The results are output in table format.
	6. Generate graphs of monthly and annual data for each gage using For() loop commands.
	7. Generate HTML pages that contain the graphs of monthly and annual data.
	8. Write monthly and annual time series data to CSV files; can be used for further data processing and visualization.

	
## Verification ##
After downloading monthly time series data and summing the values to calculate annual diversion amounts, the mean annual diversion totals, in acre-feet, were calculated.  OWF used the entire period of record available for each diversion within HydroBase.  These totals were cross-checked against totals provided by Water Education Colorado's Citizen's Guide to Colorado's Transbasin Diversions (pg. 9) and [Basin Fact Sheets](http://cwcb.state.co.us/public-information/publications/Pages/FactSheets.aspx) published by the Colorado Water Conservation Board in 2006.  Water Education Colorado's totals are "based upon the period of record available in electronic form for each diversion".  The totals are shown in the table below.  Basin Fact Sheet totals were calculated by different methods depending on the basin and are detailed below the table.  This table was manually generated but in future versions it is anticipated that the table will be automatically produced and updated via a TSTool command file.
Transbasin Diversion | OWF Total | Water Education Colorado Total | Basin Fact Sheet Total
--- | :---: | :---: | :---: 
Wilson Supply Ditch | 2,313 | 2,314 | 1,482^1^
Deadman Ditch | 848 | 727 | Not Provided
Bob Creek Ditch | 270 | 91 | Not Provided
Columbine Ditch-South Platte | 110 | 104 | Not Provided
Laramie Poudre Tunnel | 14,519 | 14,788 | 18,580^1^
Skyline Ditch | 6,690 | 4,999 | Not Provided
Cameron Pass Ditch | 188 | 137 | Not Provided
Michigan Ditch | 2,734 | 2,409 | 3,294^1^
Grand River Ditch | 17,384 | 17,462 | 17,685^1^
Colorado-Big Thompson Project | 215,155 | 216,570 | 218,142^1^
Moffat Collection System Project | 46,663 | 52,390 | 52,155^1^
Berthoud Pass Ditch | 676 | 664 | Not Provided
Straight Creek Tunnel | 299 | 311 | Not Provided
Vidler Collection System | 524 | 518 | Not Provided
Roberts Tunnel Collection System | 56,817 | 58,426 | 53,676^1^
Boreas Pass Ditch | 150 | 117 | Not Provided
Continental-Hoosier Diversion System | 8,390 | 8,375 | 8,747^2^
Columbine Ditch-Arkansas | Not Computed | 1,431 | 1,719^2^
Ewing Ditch | Not Computed | 1,027 | 1,081^2^
Warren E. Wurts Ditch | Not Computed | 2,508 | 2,858^2^
Homestake Tunnel | Not Computed | 25,286 | 24,764^2^
Charles H. Boustead Tunnel | Not Computed | 52,013 | 49,706^2^
Busk-Ivanhoe Tunnel | Not Computed | 5,108 | 5,484^2^
Twin Lakes Tunnel | Not Computed | 40,005 | 39,204^2^
Larkspur Ditch | Not Computed | 190 | 73^1^
Hudson Branch Ditch | Not Computed | 352 | 157^1^
Medano Pass Ditch | Not Computed | 1,100 | 843^1^
Tarbell Ditch | Not Computed | 432 | 370^1^
Tabor Ditch | Not Computed | 703 | 827^1^
Weminuche Pass Ditch | Not Computed | 1,325 | 1,133^1^
Pine River-Weminuche Pass Ditch | Not Computed | 481 | 426^1^
Williams Creek-Squaw Pass Ditch | Not Computed | 240 | 221^1^
Don La Font Ditch Nos. 1 and 2 | Not Computed | 191 | 174^1^
Treasure Pass Ditch | Not Computed | 214 | 225^1^
San Juan-Chama Project | Not Computed | 92,789 | 89,832^1^
Red Mountain Ditch | Not Computed | 98 | 99^1^
Carbon Lake Ditch | Not Computed | 256 | Not Provided
Mineral Point Ditch | Not Computed | 96 | 138^1^
Leon Tunnel | Not Computed | 1,373 | 1,364^1^
Divide Highline Feeder Ditch | Not Computed | 882 | 1,011^1^
Sarvis Ditch | Not Computed | 760 | Not Provided
Stillwater Ditch | Not Computed | 2,028 | 4,280^1^
Dome Ditch | Not Computed | 300 | Not Provided
Redlands Power Canal | Not Computed | 502,415 | 510,930^1^

^1^ 1998 annual reports for each division, 10-year average
^2^ Period of Record is 1971-2003


## Visualizations ##
The TSTool command file, [Process-time-series-data.TSTool](https://github.com/OpenWaterFoundation/owf-data-co-transbasin-diversions/blob/master/analysis/Process-time-series-data.TSTool), contains commands to generate line graphs of monthly and annual diversion totals for each transbasin diversion.  The graphs can be viewed on websites that are also generated via a series of commands.
Currently, the graphs and websites are not viewable from this repository in order to keep the repository simple.  The repository is configured with `.gitignore` files so that dynamic files created when running the command file are NOT saved to the repository.  However, it is possible to download the files in this repository, run the TSTool command file and view the graphs via a static website.  The process is as follows:
1. Download repository files - to download a zip file use the green ***Clone or download*** button on GitHub and then ***Download ZIP***, and then unzip the folder.
2. Download the most current version of TSTool - the latest TSTool version is available from the [Open Water Foundation TSTool page](http://openwaterfoundation.org/software-tools/tstool).
3. Run the Process-time-series-data.TSTool command file - open the command file in TSTool and click the "Run All Commands" button; the file will complete shortly.
4. View the monthly and annual time series graphs in a browser - graphs are contained in the [website](https://github.com/OpenWaterFoundation/owf-model-pointflow-co-poudre/tree/master/analysis-output/website) folder.  Monthly graphs and the associated website can be found in the "monthly" folder.  Graphs can be viewed individually by clicking on any `.png` file.  To view the graphs in a website, click on `monthly-diversions.html`.  Follow the same procedure for annual data.


## How to Use the Data ##

The Colorado Transbasin Diversions dataset provides a complete statewide list of transbasin diversions assembled from multiple sources.  There are several diversion structures and streams associated with each transbasin diversion and the dataset allows cross-referencing these
so that other datasets can be joined.  For example, the dataset can be linked to the [Source Water Route Framework](http://cdss.state.co.us/GIS/Pages/AllGISData.aspx), which contains measured, named streams from the National Hydrography Dataset and uses GNIS IDs and names.

The Excel and csv files can be used as tabular datasets as is, to create filtered lists or to link to other datasets.  The analysis results (monthly and annual time series data) can also be used in other analyses or visualizations.  Data-processing software such as TSTool can be used to link this dataset to other datasets.  Datasets can be used within GIS software to create maps.

The format and contents of the dataset will change over time.  It is recommended to save a copy of the dataset.

## Disclaimer ##

OWF has created a complete statewide dataset of transbasin diversions.  OWF will attempt to fill data gaps as the dataset is used for analysis and funding allows for more data review.  OWF provides no guarantee as to the accuracy of the data.  **Use this dataset at your own risk.**  OWF welcomes feedback to improve the dataset.

## License ##

The license is being determined.  All the data are public so there are not really any restrictions on use.

## Contributing ##

The Open Water Foundation created this dataset as a general resource with simple analyses.
If you use the dataset and have comments, please contact the maintainers and/or use the GitHub issues to provide feedback.

## Maintainers ##

Kristin Swaim (@kswaim, kristin.swaim@openwaterfoundation.org) is the primary maintainer at the Open Water Foundation.

Steve Malers (@smalers, steve.malers@openwaterfoundation.org) is the secondary contact.

## Contributors ##

None yet, other than OWF staff.
