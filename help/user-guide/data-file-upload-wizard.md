---
title: Data file upload wizard
---


## Template processing

If the data file uploaded was based on a [Template](templates/master-v1.html), then after uploaded it will be processed.

After processing some of the information in the next steps will already filled out based on the content of the template. Any errors or warnings will
be highlighted at the top of the page.

## Using the wizard

The wizard is split into a series of steps. These steps can be progressed by clicking the "Next" button, or the "Back" to return to an earlier step.

You can also use the cursor keys (&larr; &rarr;) to go backwards and forwards.

You can also jump straight to the end or back to the start by clicking the "End" or "Start" buttons, or by pressing the "End" or "Home" keys, respectively.


## Steps

### General information

![wizard general info]({{ site.baseurl }}/images/user-guide/data-wizard-step1.png){:.screenshot}

You should provide the basic general metadata about the data file:

* [Title](general-attributes#title) (**Mandatory**)
* [Description](general-attributes#description)
* [Projects](general-attributes#projects) (**Mandatory**)
* [Tags](general-attributes#tags)

### Licensing and sharing

![wizard sharing]({{ site.baseurl }}/images/user-guide/data-wizard-step2.png){:.screenshot}

The preferred license for the data, and sharing permissions can now be set. These will automatically be the project defaults, if they have been defined for the project.

* [Licenses](licenses)
* [Sharing](general-attributes#sharing)

### Associated Assays

![wizard assays]({{ site.baseurl }}/images/user-guide/data-wizard-step3.png){:.screenshot}

For this step, you can defined the Assays the Data will be linked to. This will usually be an existing Assay.

* [Experimental assays and Modelling analysis](general-attributes#experimental-assays-and-modelling-analysis)

If necessary, it is also possible to create a new Assay during this step:

  * Select the New Assay tab
  * Tick the Create a New Assay checkbox

### Other associated items

![wizard other associations]({{ site.baseurl }}/images/user-guide/data-wizard-step4.png){:.screenshot}

The final step allows you to associate the Data with other items, if necessary.

* [Attributions](general-attributes#attributions)
* [Publications](general-attributes#publications)
* [Events](general-attributes#events)



