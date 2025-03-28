---
title: Studies
---

The [ISA metadata framework](https://isa-specs.readthedocs.io/en/latest/isamodel.html) requires the description (metadata) of different types of samples, namely Study Sources, Study Samples and Assay Samples. This description is based on customisable Experiment Sample Templates and includes the linking of applied Protocols. Follow the link for an overview about [ISA-JSON compliant experiments](isa-json-compliant-experiment.html).

In the context of an ISA-JSON compliant experiment, we use the terms ISA Investigation, ISA Study, and ISA Assay when referring to Investigation, Study, and Assay, respectively.

## 21. Creating an ISA Study
ISA Study can only be associated to an ISA Investigation. It is not possible to associate an ISA Study to an Investigation which is not ISA-JSON compliant.

To start designing an ISA Study within the Investigation in Experiment View, select the Investigation and then select the "Design Study" button at the top right corner.

Fill out the provided form as explained below.

## 1.1 Design a Sources table for Study Sources
The Sources table can be used to register metadata about Study Sources material.
* Biological material and its origin or provenance
* Environmental and/or experimental conditions of the Sources in the Study
* Experimental groups of the Sources
* Observation units
* Experimental factor(s), confounding variables, covariates, events, comments etc
* Any other relevant information about the Sources in the Study

The Study Sources table is a Sample Type associated with the Study and can only be accessed through the Study interface. The Study Sources table can only be created starting from an existing Experiment Sample Templates.

### 1.1.1 Choose one Experiment Sample Template

* Choose one Experiment Sample Templates by clicking on "Existing Experiment Sample Templates" button.

![create isastudy source 1](/images/user-guide/isajson-compliance/create_isastudy_source_1.png){:.screenshot}

* Filter existing Experiment Sample Templates based on:
  * the repository that will store metadata about your Study Sources (e.g. ENA, ArrayExpress or your institutional repository). Select "Project specific templates" if you want to use a template made for or by a specific Project
  * organism

![create isastudy source 2](/images/user-guide/isajson-compliance/create_isastudy_source_2.png){:.screenshot}

* Choose a template from the resulting dropdown menu.
* Select "Apply".
* Give a Title to the Study Sources table.

### 1.1.2 Customise the Study Sources table

The Attributes table can be used to customise the Study Sources table. However, be aware that applying changes may compromise the compliance to the original template.

* If you want to add new attributes of your choice to your Sources table, select “Add new attribute” button.
* Fill out the mandatory and optional fields. Note that for ISA-JSON compliant Experiments, the ISA Tag is a mandatory field.
* For ISA tag, select "source_characteristic". Note that selecting "source" would generate an error since a "source" is already selected in the starting template.

![create isastudy source 3](/images/user-guide/isajson-compliance/create_isastudy_source_3.png){:.screenshot}

## 1.2 Link the sampling Protocol 
Select Protocols already registered in the platform that describe the used method or procedure (SOP) used to collect Samples from Sources in your Study (Samples collection protocol). See how to [create an SOP](adding-assets) in SEEK.

## 1.3 Design a Samples table for Study Samples

Follow the same steps described for designing the Study Sources table to create and customise the Study Samples table.

## 1.4 Visualise ISA Study
Upon creation, the newly designed ISA Study will appear in the tree view on the left sidebar, in Experiment View. Follow the link to know more about [Experiment View](viewing-project-in-single-page).

## 2. Adding Sources to ISA Study
After you have designed the Sources table, you can then start by creating and describing your Study Sources according to the designed table.

Follow the link to know how to [create samples in ISA-JSON compliant experiments](create-sample-isajson-compliant), including [Study Sources](create-sample-isa-json-compliant#create-study-sources).

## 3. Adding Samples to ISA Study

Follow the link to know how to [create samples in ISA-JSON compliant experiments](create-sample-isajson-compliant), including [Study Samples](create-sample-isajson-compliant#create-study-samples).