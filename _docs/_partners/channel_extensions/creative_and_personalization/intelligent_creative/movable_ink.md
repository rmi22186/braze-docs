---
nav_title: Movable Ink
alias: "/movable_ink/"
---
# Movable Ink

> [Moveable Ink][1] offers a cloud-based software platform that offers digital marketers a way to create compelling and unique visual experiences that move customers. The Movable Ink Platform provides valuable customization options that can easily be inserted into your campaigns. 

Expand Braze's creative capabilities by leveraging Intelligent Creative features like polling, countdown timer, and scratch off with Movable Ink. Movable Ink and Braze power a more well-rounded approach to dynamic data-driven messages, providing users with real-time elements about the things that matter.

## Integration

### Integration Requirements

- You must have an active Movable Ink account.
- Data Source connected to Movable Ink
    - Either CSV, Import or API
    - Note: ensure that you are passing data with a unifying identifier between Movable Ink and Braze. This should be either external_id or User ID.

Intelligent Creative has many offerings that Braze users can take advantage of. Below is a list of what is supported. 

| Movable Ink Capability || Rich Push Notification | In-App Messaging / Content Cards | Details |
| ---------------------- || ---------------------- | -------------------------------- | ------- |
| Creative Optimizer | Display A/B Contents | no | ✔ | |
|| Optimize | no | ✔* | *Must Use Branch's Deeplinking solution |
| Targeting Rules | Date | ✔* | ✔ | * Supported but not recommended because push notifications are cached upon receipt and do not refresh |
|| Day of Week | ✔* | ✔ | * Supported but not recommended because push notifications are cached upon receipt and do not refresh |
|| Time of Day | ✔* | ✔ | * Supported but not recommended because push notifications are cached upon receipt and do not refresh |
| Stories/Behavior Activity | | ✔* | ✔* | * The unique user identifier used for Braze must be linked to your ESP’s identifier |
| Deep-Linking within the app | | ✔* | ✔* | * Must use Branch’s deep linking solution |
| Apps | Countdown Timer | ✔* | ✔ | * Supported but not recommended because push notifications are cached upon receipt and do not refresh |
|| Polling | no | ✔* | * After voting, will leave the app to be a mobile landing page |
|| Scratch Off | ✔* | ✔* | * On click, will leave the app for the Scratch off experience |
|| Video | ✔* | ✔* | * Animated GIFs only |

## Implementation Process

### Step 1: Create a Data Source for Movable Ink

Customers will need to create a data source that can either be a CSV, Website, or API Integration

![datasource]({% image_buster /assets/img/movable_ink/movable_ink1.png %})

{% tabs %}
{% tab CSV Data Sources %}
- __CSV Data Sources__: Each row must have at least one segment column and one content column. After your CSV has uploaded, select which columns should be used to target the content. [Example CSV File]({% image_buster /assets/download_file/movable_ink_CSV.csv %})

![datasource]({% image_buster /assets/img/movable_ink/movable_ink2.png %})
{% endtab %}
{% tab Website Data Source %}
- __Website Data Source__: Each row must have at least one segment column and one content column. After your CSV has uploaded, select which columns should be used to target the content.
  - Within this process, you'll need to map:
    - Which fields will be used as Segments
    - Which field you want as data fields that can be dynamically personalized in the creative (ex: user attributes or custom attributes like first name, last name, city, etc.)

![datasource]({% image_buster /assets/img/movable_ink/movable_ink3.png %})
{% endtab %}
{% tab API Integrations %}
- __API Integrations__: Use your company's API to power content directly from an API response

![datasource]({% image_buster /assets/img/movable_ink/movable_ink4.png %})
{% endtab %}
{% endtabs %}

### Step 2: Create a Campaign on the Movable Ink Platform

1. ![create_campaign]({% image_buster /assets/img/movable_ink/movable_ink5.png %}){: style="float:right;max-width:40%;margin-left:15px;"}
From the Movable Ink home Screen, you can choose to create a campaign. You can select from either Email from HTML, Email from Image, or a Block that can be used in any channel including Push, In-App Message, and Content Cards (suggested).
We also suggest taking a look at the various content options available through creating a campaign using blocks.<br><br>
2. Movable Ink has an easy editor for customers to drag and drop elements like text, image, etc. ![create_campaign2]({% image_buster /assets/img/movable_ink/create_campaign2.png %})
<br><br>Given that the customer has populated their data source, they can also dynamically generate an image using the data properties. In addition, they can also create fall backs within this flow for users in the event that the campaign is sent and a user doesn't fit within the personalization criteria.<br>Customers can also preview the dynamic images and test out the query parameters to see what the images will look upon view. <br><br>For more information on how to use the Movable Ink Platform, check out [Movable Ink Support Center][support]

Once complete, you should be able to generate a dynamic URL that you can then insert into Braze!

### Step 3: Obtain Movable Ink Content URL

To include Movable Ink content into Braze messages, you must locate the source URL movable ink has provided you. ![obtain_url]({% image_buster /assets/img/movable_ink/obtain_url.png %}){: style="float:right;max-width:40%;margin-left:15px;"}

1. To obtain the source URL, you must have set up the content in the Movable Ink Dashboard, and then from there, Finish & Export your content.
2. On the Finish page, copy the source URL(`img src`) from the creative tag.
3. In the Braze Platform, paste the URL in the appropriate field. Check out the next step to see appropriate fields. 

### Step 4: Braze Experience

### Push Notifications

1. In the Braze Platform, paste the URL in the __Push Icon Image__ and __Expanded Notification Image__ fields.
2. In order to make sure images are not cached, prepend the URL with empty Liquid tags: {% if true %}{% endif %}

### In-App and Content Card Messages

1. In Braze’s platform, paste the URL in the __Rich Notification Media__ field.
2. __Provide a Unique URL to help Prevent Caching.__ To ensure that Movable Ink’s real-time images work and will not be affected by caching, use Liquid to append a timestamp to the URL. <br><br> To do this, use the following syntax, replacing the image URL as needed:<br>{% raw %} ```{% assign timestamp = "now" | date: "%s" %}``` <br> ```{% assign img = "https://yapji3pc.mi-msg.com/p/rp/822cdb1956883563.gif?" |  append:timestamp %} {{img}}``` {% endraw %} <br>This template will take the current time (in seconds), append it to the end of the Movable Ink image tab (as a query param), and then output the final result. You can preview it's working with the "Test" tab on the right of the Compose tab - this will evaluate the code and show a preview.
3. __Re-Evaluate Segment Membership__. Enable this option located on the "Target Users" step of a campaign. This option will tell the mobile SDKs to re-request the campaign each time an In-App Message is triggered. It's needed because ordinarily the Liquid code is evaluated just once at send-time, and we need a unique URL every time the message is shown.

## Trouble Shooting

[1]: https://movableink.com/
[datasource]: ({% image_buster /assets/img/movable_ink/movable_ink1.png %})
[support]: https://support.movableink.com/

