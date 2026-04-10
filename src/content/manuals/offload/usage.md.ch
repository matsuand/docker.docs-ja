%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Docker Offload usage
linktitle: Usage
@y
title: Docker Offload usage
linktitle: Usage
@z

@x
description: Learn about Docker Offload usage and how to monitor your cloud resources.
keywords: cloud, usage, Offload
@y
description: Learn about Docker Offload usage and how to monitor your cloud resources.
keywords: cloud, usage, Offload
@z

@x
{{< summary-bar feature_name="Docker Offload" >}}
@y
{{< summary-bar feature_name="Docker Offload" >}}
@z

@x
The **Offload activity** page in Docker Home provides visibility into user
activity and session metrics for Docker Offload.
@y
The **Offload activity** page in Docker Home provides visibility into user
activity and session metrics for Docker Offload.
@z

@x
To monitor your usage:
@y
To monitor your usage:
@z

@x
1. Sign in to [Docker Home](https://app.docker.com/).
2. If you have access to multiple organizations, select the organization
   associated with your Docker Offload subscription.
3. Select **Offload** > **Offload activity**.
@y
1. Sign in to [Docker Home](https://app.docker.com/).
2. If you have access to multiple organizations, select the organization
   associated with your Docker Offload subscription.
3. Select **Offload** > **Offload activity**.
@z

@x
### Overview metrics
@y
### Overview metrics
@z

@x
Key metrics at the top of the page summarize your Docker Offload usage:
@y
Key metrics at the top of the page summarize your Docker Offload usage:
@z

@x
- **Total duration**: The total time spent in Offload sessions
- **Average duration**: The average time per Offload session
- **Total sessions**: The total number of Offload sessions
- **Unique images used**: The number of distinct container images used across
  sessions
- **Unique users**: The number of different users in Docker Offload sessions
@y
- **Total duration**: The total time spent in Offload sessions
- **Average duration**: The average time per Offload session
- **Total sessions**: The total number of Offload sessions
- **Unique images used**: The number of distinct container images used across
  sessions
- **Unique users**: The number of different users in Docker Offload sessions
@z

@x
### Filter and export your data
@y
### Filter and export your data
@z

@x
You can filter the Offload activity data by:
@y
You can filter the Offload activity data by:
@z

@x
- **Period**: Select a preset time period or choose a custom date range
- **Users**: Organization owners and members with analytics permissions can
  filter by specific users
- **Additional Filters**: Filter by active sessions and session duration.
@y
- **Period**: Select a preset time period or choose a custom date range
- **Users**: Organization owners and members with analytics permissions can
  filter by specific users
- **Additional Filters**: Filter by active sessions and session duration.
@z

@x
Export your session data by selecting the **Download CSV** button. The exported
file includes:
@y
Export your session data by selecting the **Download CSV** button. The exported
file includes:
@z

@x
- Session ID
- Username
- Image
- Started time
- Ended time
- Duration (in seconds)
- Status
- Container count
@y
- Session ID
- Username
- Image
- Started time
- Ended time
- Duration (in seconds)
- Status
- Container count
@z

@x
The CSV export includes data for your selected date range and user filters,
letting you download exactly what you're viewing.
@y
The CSV export includes data for your selected date range and user filters,
letting you download exactly what you're viewing.
@z

@x
### Activity cards
@y
### Activity cards
@z

@x
The following cards provide insights into your Docker Offload usage:
@y
The following cards provide insights into your Docker Offload usage:
@z

@x
- **Offload usage**: Shows your usage trends over time and cloud resource
  consumption patterns.
- **Popular images**: Shows the top 4 most frequently used container images in
  your Docker Offload sessions. Select the card to see more images.
- **Top Offload users**: Shows the top 4 users by session count and duration. Select
  the card to see more users.
@y
- **Offload usage**: Shows your usage trends over time and cloud resource
  consumption patterns.
- **Popular images**: Shows the top 4 most frequently used container images in
  your Docker Offload sessions. Select the card to see more images.
- **Top Offload users**: Shows the top 4 users by session count and duration. Select
  the card to see more users.
@z

@x
### Offload sessions
@y
### Offload sessions
@z

@x
A detailed list of Offload sessions appears following the activity cards. The list:
@y
A detailed list of Offload sessions appears following the activity cards. The list:
@z

@x
- Starts with any currently active sessions
- Shows session details including start time, duration, images used, and user
  information
- Can be filtered using the date and user filters described previously
- Displays **Offload sessions** if you have organization-wide analytics
  permissions, or **My Offload sessions** if viewing only your own data
@y
- Starts with any currently active sessions
- Shows session details including start time, duration, images used, and user
  information
- Can be filtered using the date and user filters described previously
- Displays **Offload sessions** if you have organization-wide analytics
  permissions, or **My Offload sessions** if viewing only your own data
@z

@x
Select any session to view more details in a side panel.
@y
Select any session to view more details in a side panel.
@z
