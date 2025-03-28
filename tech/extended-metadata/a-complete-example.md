---
title: A Complete Example to Create Extended Metadata Types by Uploading a JSON File
---

Here is a step-by-step example of how to create a new extended metadata type using all the attribute types mentioned in our guide: [Create Extended Metatypes by Uploading a JSON File](create-extended-metadata-type-with-json-file).

## Step 1: Define Controlled Vocabularies

Currently, controlled vocabularies can only be created through the user interface by anyone with permission to create resources in SEEK.

You can also use the following direct link  ```HTTP://{HOST_NAME}/sample_controlled_vocabs/new``` to create controlled vocabularies or the button on the [Controlled Vocabulary](manage-extended-metadata-type/#3-controlled-vocabularies-tab) tab.

Assuming the controlled vocabularies have been created here:
![extended-metadata-fields]({{ site.baseurl }}/images/user-guide/extended-metadata/cvs-tab.png)

You can view the detailed controlled vocabularies by clicking the corresponding its ID.
![extended-metadata-fields]({{ site.baseurl }}/images/user-guide/extended-metadata/role_name_identifier_scheme_cv.png)

## Step 2: Define Nested Extended Metadata Types

Step 2.1. Define a metadata type named `role_name_identifiers` with two attributes: `scheme` and `identifier`. After creation, it is assigned ID `158`.

```json
{
  "title": "role_name_identifiers",
  "supported_type": "ExtendedMetadata",
  "enabled": true,
  "attributes": [
    {
      "title": "scheme",
      "type": "Controlled Vocabulary",
      "required": true,
      "ID": 14, // ID of CV "Role Name Identifier Scheme"
      "label": "scheme",
      "description": "scheme"
    },
    {
      "title": "identifier",
      "type": "String",
      "required": false,
      "label": "identifier",
      "description": "identifier"
    }
  ]
}
```

Step 2.2. Define a new metadata type called `role_emt`, which will have one attribute linked to the previously created `role_name_identifiers`. Consequently, the `role_emt` type will be established with five attributes and assigned the ID 159.

```json
{
  "title": "role_emt",
  "supported_type": "ExtendedMetadata",
  "enabled": true,
  "attributes": [
    {
      "title": "role_name_personal_title",
      "type": "Controlled Vocabulary",
      "required": true,
      "ID": 13, // ID of CV "Role Name Personal Title"
      "label": "personal title",
      "description": "personal title"
    },
    {
      "title": "first_name",
      "type": "String",
      "required": false,
      "label": "first name",
      "description": "first name"
    },
    {
      "title": "last_name",
      "type": "String",
      "required": false,
      "label": "last name",
      "description": "last name"
    },
    {
      "title": "role_type",
      "type": "Controlled Vocabulary",
      "required": true,
      "ID": 12, // ID of CV "Role type"
      "label": "role type",
      "description": "role type"
    },
    {
      "title": "role_name_identifiers",
      "type": "Linked Extended Metadata (multiple)",
      "required": false,
      "ID": 158, // ID of the nested metadata type `role_name_identifiers`
      "label": "role name identifiers",
      "description": "role name identifiers"
    }
  ]
}
```



## Step 3: Define Top Level Extended Metadata Type for Study

```json
{
  "title": "An example with all attribute types",
  "supported_type": "Study",
  "enabled": true,
  "attributes": [
    {
      "title": "title",
      "required": true,
      "type": "String",
      "label": "study title",
      "description": "study title"
    },
    {
      "title": "description",
      "required": true,
      "type": "Text",
      "label": "study description",
      "description": "study description"
    },
    {
      "title": "study_start_date",
      "required": true,
      "type": "Date",
      "label": "study start date",
      "description": "study start date"

    },
    {
      "title": "study_start_time",
      "required": true,
      "type": "Date time",
      "label": "study start time",
      "description": "study start time"
    },
    {
      "title": "study_age",
      "required": true,
      "type": "Integer",
      "label": "study age",
      "description": "study age"
    },
    {
      "title": "cholesterol_level",
      "required": true,
      "type": "Real number",
      "label": "cholesterol level",
      "description": "cholesterol level"
    },
    {
      "title": "resource_use_rights_authors_confirmation",
      "required": true,
      "type": "Boolean",
      "label": "resource use rights authors confirmation",
      "description": "resource use rights authors confirmation"
    },
    {
      "title": "resource_type_general",
      "required": true,
      "type": "Controlled Vocabulary",
      "ID": 16, // ID of CV "resource_type_general"
      "label": "resource type general",
      "description": "resource type general"
    },
    {
      "title": "resource_study_country",
      "type": "Controlled Vocabulary List",
      "required": true,
      "ID": 15, // ID of CV "European Study Country"
      "label": "study country",
      "description": "study country"
    },
    {
      "title": "role",
      "type": "Linked Extended Metadata (multiple)",
      "required": false,
      "ID": 159, // ID of the nested metadata type `role_emt`
      "label": "role",
      "description":"role"
    }
  ]
}
```

## Step 4: Use Extended Metadata Type

As the result, you can choose to load this extended metadata type on the study creation page.
![]({{ site.baseurl }}/images/user-guide/extended-metadata/emt-ui.png)


