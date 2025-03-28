---
title: Manage Extended Metadata Type
---

On the "Manage Extended Metadata Types" page, you will see a list of existing extended metadata types along with relevant resources for creating new ones. The page is divided into four tabs:


## 1. Top Level Tab


This tab displays all top-level extended metadata types, which are associated with specific resource types in SEEK, including <a id="top-level-resource-type">`Investigation`, `Study`, `Assay`, `Collection`, `DataFile`, `Document`, `Event`, `Model`, `Presentation`, `Sop`, and `Project`</a>.

![]({{ site.baseurl }}/images/user-guide/extended-metadata/emt-top-level-tab.png)


The table on this tab contains the following columns:

* **Internal Id:**  A unique identifier assigned to each extended metadata type within the SEEK system.


* **Title:**  The name of the extended metadata type, which appears in the dropdown list when creating a new resource.


* **Supported Type:**  The SEEK [top level resource types](#1-top-level-tab-) associated with this extended metadata type.


* **Number of Times Used**:  The number of times metadata has been created based on this extended metadata type.


* **Status:**  Indicates whether the extended metadata type is active (enabled) or inactive (disabled). Disabling a type prevents it from being used to create new metadata, but does not delete existing metadata or impact associated resources. You can still edit existing metadata, and disabled types can be re-enabled at any time.


* **Disable/Enable Button:**  Toggle to enable or disable the extended metadata type..


* **Delete Button:**   Available only if the type hasn’t been used to create any metadata.

## 2. Nested Level Tab

![]({{ site.baseurl }}/images/user-guide/extended-metadata/emt-nested-level-tab.png)


This tab lists all extended metadata types with the supported type "ExtendedMetadata." Nested-level metadata types are primarily used to define attributes like `Linked Extended Metadata` or `Linked Extended Metadata (Multiple)`, allowing for deeper, more flexible relationships between metadata.

The columns here are similar to those in the [Top-Level tab](#1-top-level-tab-), with the key difference being that the `Supported Type` is always set to `ExtendedMetadata`.

Extended metadata types in this tab cannot be deleted if they are linked to other metadata types.

## 3. Controlled Vocabularies Tab

This tab lists all the controlled vocabularies (CV) available in SEEK, which can be used when defining sample types or extended metadata types. Administrators can create new controlled vocabularies by clicking the "Create Controlled Vocabulary" button.

![extended-metadata-fields]({{ site.baseurl }}/images/user-guide/extended-metadata/cvs-tab.png)


The Internal ID of a controlled vocabulary is important when defining attributes such as `Controlled Vocabulary` or `Controlled Vocabulary List`.

## 4. Extended Metadata Attribute Types Tab

This tab provides a list of all supported extended metadata attribute types. The Title of each attribute type is crucial, as it is used when defining a custom JSON file for creating new extended metadata types.


![]({{ site.baseurl }}/images/user-guide/extended-metadata/emas-tab.png)


Back to [Extended Metadata Technical Overview](extended-metadata-type)
