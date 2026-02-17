%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
title: Run a complete example with Turtlesim
linkTitle: Turtlesim example
@y
title: Run a complete example with Turtlesim
linkTitle: Turtlesim example
@z

@x
keywords: ros2, turtlesim, example, nodes, topics, teleop
description: Run a complete end-to-end ROS 2 example with Turtlesim.
@y
keywords: ros2, turtlesim, example, nodes, topics, teleop
description: Run a complete end-to-end ROS 2 example with Turtlesim.
@z

@x
## Overview
@y
## Overview
@z

@x
Turtlesim is a simple simulation tool that demonstrates fundamental ROS 2 concepts such as nodes, topics, and services. In this section, you'll run a complete example with Turtlesim, control the turtle, monitor topics, and visualize the system with rqt.
@y
Turtlesim is a simple simulation tool that demonstrates fundamental ROS 2 concepts such as nodes, topics, and services. In this section, you'll run a complete example with Turtlesim, control the turtle, monitor topics, and visualize the system with rqt.
@z

@x
## Configure display forwarding
@y
## Configure display forwarding
@z

@x
### Linux
@y
### Linux
@z

@x
Allow Docker access to your X server:
@y
Allow Docker access to your X server:
@z

@x
```console
$ xhost +local:docker
```
@y
```console
$ xhost +local:docker
```
@z

@x
### macOS
@y
### macOS
@z

@x
On macOS, use XQuartz to provide X11 support. Install XQuartz using Homebrew:
@y
On macOS, use XQuartz to provide X11 support. Install XQuartz using Homebrew:
@z

@x
1. Install XQuartz using Homebrew:
@y
1. Install XQuartz using Homebrew:
@z

@x
   ```console
   $ brew install --cask xquartz
   ```
@y
   ```console
   $ brew install --cask xquartz
   ```
@z

@x
2. Open XQuartz from Applications, then navigate to `Preferences > Security` and enable `Allow connections from network clients`. Restart your computer to ensure the changes take effect.
@y
2. Open XQuartz from Applications, then navigate to `Preferences > Security` and enable `Allow connections from network clients`. Restart your computer to ensure the changes take effect.
@z

@x
3. After rebooting, open a terminal and allow local connections:
@y
3. After rebooting, open a terminal and allow local connections:
@z

@x
   ```console
   $ defaults write org.xquartz.X11 nolisten_tcp -bool false
   $ xhost +localhost
   $ xhost + 127.0.0.1
   ```
@y
   ```console
   $ defaults write org.xquartz.X11 nolisten_tcp -bool false
   $ xhost +localhost
   $ xhost + 127.0.0.1
   ```
@z

@x
## Start the container
@y
## Start the container
@z

@x
Start the container using the same Docker Compose setup from the workspace section.
@y
Start the container using the same Docker Compose setup from the workspace section.
@z

@x
For Linux:
@y
For Linux:
@z

@x
```console
$ cd ws_linux
$ docker compose up -d
$ docker compose exec ros2 /bin/bash
```
@y
```console
$ cd ws_linux
$ docker compose up -d
$ docker compose exec ros2 /bin/bash
```
@z

@x
For macOS:
@y
For macOS:
@z

@x
```console
$ cd ws_mac
$ docker compose up -d
$ docker compose exec ros2 /bin/bash
```
@y
```console
$ cd ws_mac
$ docker compose up -d
$ docker compose exec ros2 /bin/bash
```
@z

@x
## Install and Run Turtlesim
@y
## Install and Run Turtlesim
@z

@x
Inside the container, install the Turtlesim package:
@y
Inside the container, install the Turtlesim package:
@z

@x
1. Update the package manager:
@y
1. Update the package manager:
@z

@x
   ```console
   $ sudo apt update
   ```
@y
   ```console
   $ sudo apt update
   ```
@z

@x
2. Install the Turtlesim package:
@y
2. Install the Turtlesim package:
@z

@x
   ```console
   $ sudo apt install -y ros-humble-turtlesim
   ```
@y
   ```console
   $ sudo apt install -y ros-humble-turtlesim
   ```
@z

@x
3. Run the Turtlesim node:
@y
3. Run the Turtlesim node:
@z

@x
   ```console
   $ ros2 run turtlesim turtlesim_node
   ```
@y
   ```console
   $ ros2 run turtlesim turtlesim_node
   ```
@z

@x
A window should appear on your desktop showing a turtle in a grid.
@y
A window should appear on your desktop showing a turtle in a grid.
@z

@x
## Control the turtle
@y
## Control the turtle
@z

@x
1. Open a new terminal and connect to the same container, then start the keyboard teleop node:
@y
1. Open a new terminal and connect to the same container, then start the keyboard teleop node:
@z

@x
   ```console
   $ ros2 run turtlesim turtle_teleop_key
   ```
@y
   ```console
   $ ros2 run turtlesim turtle_teleop_key
   ```
@z

@x
   This node allows you to control the turtle using your keyboard. Use the arrow keys to move the turtle forward, backward, left, and right. Press `Ctrl+C` to stop the teleop node.
@y
   This node allows you to control the turtle using your keyboard. Use the arrow keys to move the turtle forward, backward, left, and right. Press `Ctrl+C` to stop the teleop node.
@z

@x
2. Move the turtle around the window. You should see it draw a path as it moves.
@y
2. Move the turtle around the window. You should see it draw a path as it moves.
@z

@x
## Monitor topics
@y
## Monitor topics
@z

@x
1. Open another terminal and connect to the same container, then list all active topics:
@y
1. Open another terminal and connect to the same container, then list all active topics:
@z

@x
   ```console
   $ ros2 topic list
   ```
@y
   ```console
   $ ros2 topic list
   ```
@z

@x
   You should see output similar to the following:
@y
   You should see output similar to the following:
@z

@x
   ```text
   /parameter_events
   /rosout
   /turtle1/cmd_vel
   /turtle1/color_sensor
   /turtle1/pose
   ```
@y
   ```text
   /parameter_events
   /rosout
   /turtle1/cmd_vel
   /turtle1/color_sensor
   /turtle1/pose
   ```
@z

@x
2. Get information about a specific topic:
@y
2. Get information about a specific topic:
@z

@x
   ```console
   $ ros2 topic info /turtle1/pose
   ```
@y
   ```console
   $ ros2 topic info /turtle1/pose
   ```
@z

@x
   You'll see the topic type and which nodes publish and subscribe to it.
@y
   You'll see the topic type and which nodes publish and subscribe to it.
@z

@x
## Visualize the system with rqt
@y
## Visualize the system with rqt
@z

@x
1. Open another terminal and connect to the same container, then update the package manager:
@y
1. Open another terminal and connect to the same container, then update the package manager:
@z

@x
   ```console
   $ sudo apt update
   ```
@y
   ```console
   $ sudo apt update
   ```
@z

@x
2. Install rqt:
@y
2. Install rqt:
@z

@x
   ```console
   $ sudo apt install -y 'ros-humble-rqt*'
   ```
@y
   ```console
   $ sudo apt install -y 'ros-humble-rqt*'
   ```
@z

@x
3. Start rqt:
@y
3. Start rqt:
@z

@x
   ```console
   $ ros2 run rqt_gui rqt_gui
   ```
@y
   ```console
   $ ros2 run rqt_gui rqt_gui
   ```
@z

@x
An rqt window should appear. rqt provides several useful plugins for visualizing and monitoring ROS 2 systems.
@y
An rqt window should appear. rqt provides several useful plugins for visualizing and monitoring ROS 2 systems.
@z

@x
### Node Graph
@y
### Node Graph
@z

@x
You can explore the node graph by navigating to **Plugins > Introspection > Node Graph**. A new tab opens showing nodes and topics with connections illustrated as lines. This visualization demonstrates how the teleop node sends velocity commands to the Turtlesim node, and how the Turtlesim node publishes position data back through topics.
@y
You can explore the node graph by navigating to **Plugins > Introspection > Node Graph**. A new tab opens showing nodes and topics with connections illustrated as lines. This visualization demonstrates how the teleop node sends velocity commands to the Turtlesim node, and how the Turtlesim node publishes position data back through topics.
@z

@x
### Topic Monitor
@y
### Topic Monitor
@z

@x
You can monitor active topics by navigating to **Plugins > Topics > Topic Monitor**. A new tab opens displaying all active topics and their current values. Select the eye icon next to `/turtle1/pose` to monitor it. As you move the turtle, watch the pose values update in real time, showing the position of the turtle and orientation changing based on your commands.
@y
You can monitor active topics by navigating to **Plugins > Topics > Topic Monitor**. A new tab opens displaying all active topics and their current values. Select the eye icon next to `/turtle1/pose` to monitor it. As you move the turtle, watch the pose values update in real time, showing the position of the turtle and orientation changing based on your commands.
@z

@x
### Service Caller
@y
### Service Caller
@z

@x
You can call services from rqt using **Plugins > Services > Service Caller**. Select a service such as `/turtle1/teleport_absolute`, enter values for the request fields, and select **Call** to send the request.
@y
You can call services from rqt using **Plugins > Services > Service Caller**. Select a service such as `/turtle1/teleport_absolute`, enter values for the request fields, and select **Call** to send the request.
@z

@x
### Plots
@y
### Plots
@z

@x
To plot topic data over time navigate to **Plugins > Visualization > Plot**. For example, in the Plot window, type `/turtle1/pose/x` in the Topic field and press Enter. Move the turtle and watch the X position displayed as a graph over time.
@y
To plot topic data over time navigate to **Plugins > Visualization > Plot**. For example, in the Plot window, type `/turtle1/pose/x` in the Topic field and press Enter. Move the turtle and watch the X position displayed as a graph over time.
@z

@x
## Call ROS 2 services
@y
## Call ROS 2 services
@z

@x
Turtlesim provides services for actions such as repositioning the turtle and clearing the path.
@y
Turtlesim provides services for actions such as repositioning the turtle and clearing the path.
@z

@x
1. List available services:
@y
1. List available services:
@z

@x
   ```console
   $ ros2 service list
   ```
@y
   ```console
   $ ros2 service list
   ```
@z

@x
   You should see services such as `/turtle1/set_pen` (to change pen color and width), `/turtle1/teleport_absolute` (to move the turtle to a specific position), and `/turtle1/teleport_relative` (to move the turtle relative to its current position).
@y
   You should see services such as `/turtle1/set_pen` (to change pen color and width), `/turtle1/teleport_absolute` (to move the turtle to a specific position), and `/turtle1/teleport_relative` (to move the turtle relative to its current position).
@z

@x
2. Teleport the turtle to a new position:
@y
2. Teleport the turtle to a new position:
@z

@x
   ```console
   $ ros2 service call /turtle1/teleport_absolute turtlesim/srv/TeleportAbsolute "
   x: 1.0
   y: 3.0
   theta: 0.0
   "
   ```
@y
   ```console
   $ ros2 service call /turtle1/teleport_absolute turtlesim/srv/TeleportAbsolute "
   x: 1.0
   y: 3.0
   theta: 0.0
   "
   ```
@z

@x
   The turtle should instantly move to the specified position (1.0, 3.0).
@y
   The turtle should instantly move to the specified position (1.0, 3.0).
@z

@x
## Create a simple publisher
@y
## Create a simple publisher
@z

@x
1. Create a Python script that publishes velocity commands to control the turtle programmatically. In a new terminal, create a file called `move_turtle.py`:
@y
1. Create a Python script that publishes velocity commands to control the turtle programmatically. In a new terminal, create a file called `move_turtle.py`:
@z

@x
   ```python
   import rclpy
   from geometry_msgs.msg import Twist
   import time
@y
   ```python
   import rclpy
   from geometry_msgs.msg import Twist
   import time
@z

@x
   def main():
       rclpy.init()
       node = rclpy.create_node('turtle_mover')
       publisher = node.create_publisher(Twist, 'turtle1/cmd_vel', 10)
@y
   def main():
       rclpy.init()
       node = rclpy.create_node('turtle_mover')
       publisher = node.create_publisher(Twist, 'turtle1/cmd_vel', 10)
@z

@x
       # Create a twist message
       msg = Twist()
       msg.linear.x = 2.0  # Move forward at 2 m/s
       msg.angular.z = 1.0  # Rotate at 1 rad/s
@y
       # Create a twist message
       msg = Twist()
       msg.linear.x = 2.0  # Move forward at 2 m/s
       msg.angular.z = 1.0  # Rotate at 1 rad/s
@z

@x
       # Publish the message
       for i in range(50):
           publisher.publish(msg)
           time.sleep(0.1)
@y
       # Publish the message
       for i in range(50):
           publisher.publish(msg)
           time.sleep(0.1)
@z

@x
       # Stop the turtle
       msg.linear.x = 0.0
       msg.angular.z = 0.0
       publisher.publish(msg)
@y
       # Stop the turtle
       msg.linear.x = 0.0
       msg.angular.z = 0.0
       publisher.publish(msg)
@z

@x
       node.destroy_node()
       rclpy.shutdown()
@y
       node.destroy_node()
       rclpy.shutdown()
@z

@x
   if __name__ == '__main__':
       main()
   ```
@y
   if __name__ == '__main__':
       main()
   ```
@z

@x
2. Run the script:
@y
2. Run the script:
@z

@x
   ```console
   $ python3 move_turtle.py
   ```
@y
   ```console
   $ python3 move_turtle.py
   ```
@z

@x
   The turtle should move in a circular motion for 5 seconds and then stop.
@y
   The turtle should move in a circular motion for 5 seconds and then stop.
@z

@x
## Summary
@y
## Summary
@z

@x
In this section, you configured display forwarding, used the Turtlesim nodes, inspected nodes and topics, and visualized the system using rqt. Finally, you interacted with ROS 2 services and created a simple publisher to move the turtle programmatically.
@y
In this section, you configured display forwarding, used the Turtlesim nodes, inspected nodes and topics, and visualized the system using rqt. Finally, you interacted with ROS 2 services and created a simple publisher to move the turtle programmatically.
@z

@x
These fundamental concepts apply directly to real-world robotics applications with actual sensors and actuators.
@y
These fundamental concepts apply directly to real-world robotics applications with actual sensors and actuators.
@z

@x
## Related resources
@y
## Related resources
@z

@x
- [ROS 2 Turtlesim tutorials](https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html)
- [ROS 2 Concepts](https://docs.ros.org/en/humble/Concepts.html)
- [Geometry Messages](https://github.com/ros2/geometry2/tree/humble/geometry_msgs)
@y
- [ROS 2 Turtlesim tutorials](https://docs.ros.org/en/humble/Tutorials/Beginner-CLI-Tools/Understanding-ROS2-Topics/Understanding-ROS2-Topics.html)
- [ROS 2 Concepts](https://docs.ros.org/en/humble/Concepts.html)
- [Geometry Messages](https://github.com/ros2/geometry2/tree/humble/geometry_msgs)
@z
