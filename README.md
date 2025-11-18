# SimpleControl
*A Qt/QML-based device control interface for building and executing automation scripts.*

# Summary
Automation machines are used in many areas, such as manufacturing, the food industry, and home services. To make automation systems more adaptable to different requirements, two key aspects need to be addressed: the flexibility of component combinations and the ease of flow editing.

Such machines are usually built by combining different parts based on the user’s needs.
For example, a screwing station might include a robot arm, a conveyor PLC, a feeder, and a screwdriver module, while a labeling machine would not need the screwdriver. In addition, users often need to adjust the operation flow to improve efficiency.

Traditional automation systems often require separate or repeated code for every configuration, and most do not offer a clear or no-code way to edit workflows. 

SimpleControl provides a small example of a more flexible and user-friendly approach to automation control.

## Note
This project is a conceptual prototype for automation control.
Some features and optimizations have been intentionally omitted and may be improved in future updates.
A list of these items is provided in this document.

# User Interface
The home page consists of two main sections:
<p align="center">
  <img src="https://github.com/user-attachments/assets/e6c78370-aa56-4d7c-a3a2-4cd3b04249b9" width="600">
</p>

## Script Editor
Used for creating and modifying the main script. Users can manage device settings and edit the associated commands in this area.
<p align="center">
  <img src="https://github.com/user-attachments/assets/7d28e3a1-a889-4d97-839e-eb3c84034792" width="600">
</p>

- The page design is inspired by [draw.io](https://www.drawio.com/). The left section provides a set of useful tools, the center area is used for editing and arranging diagram elements, and when selecting a component, the right panel displays its properties, allowing the user to adjust the settings.
- The center editing area is additionally inspired by [Bright Machines](https://www.brightmachines.com/). It offers a coding-free interface that allows users to configure machine actions and supports a variety of devices.

<p align="center">
  <img src="https://github.com/user-attachments/assets/8f2611ea-d85f-4941-813d-d012320b82bc" height="280">
  <img src="https://github.com/user-attachments/assets/3e5a362f-2feb-4e3c-9758-8e4ac9da506e" height="280">
</p>

## Operations Panel
Used for running and monitoring the script. Users can control the execution through the control panel and view the current status and results in the monitoring window on the left.
<p align="center">
  <img src="https://github.com/user-attachments/assets/fe1168f7-e794-40f1-8c4c-53b6d68a06ed" width="600">
</p>

# User Flow
1. Open the script editor and select devices from the pop-up window.
<p align="center">
  <img src="https://github.com/user-attachments/assets/b602e851-47a3-4ebc-9d80-ed743d6e2771" width="600">
</p>

2. Configure the device settings.
<p align="center">
  <img src="https://github.com/user-attachments/assets/c9471e7c-66ef-4a2a-a46f-acd7a8d73a41" width="600">
</p>

3. Arrange and edit commands by dragging the devices into the flow area.
<p align="center">
  <img src="https://github.com/user-attachments/assets/07cf49c6-0238-4122-9b32-16fce5281a7b" width="600">
</p>

4. Control and monitor the script through the operations panel.
<p align="center">
  <img src="https://github.com/user-attachments/assets/eb56ef90-1aea-439d-97de-7bf6c4b83980" width="600">
</p>

# Software
## Devices
- All devices are categorized into two layers: device type and brand. For example, a Denso robot belongs to the “robot” device type and the “Denso” brand. Each device provides its own implementation of actions.
- The UI reflects backend data through a QAbstractItemModel. When a user adds a device from the UI, it calls the ScriptManager—the bridge between the UI and backend—to create and store the device. Likewise, when a property is modified, a signal is sent to QML so the UI updates immediately.
- <details> 
  <summary>UML</summary> 
  <p align="center"> <img src="https://github.com/user-attachments/assets/928dbf33-a84c-47d7-964d-116e8a74a2e1" width="800"> </p> 
</details>

## Commands
- Each action in the script is defined as a command. Using the Command Pattern, every method belonging to a device is wrapped as a command, giving all actions a common interface.
- Similar to the device section, the UI reflects command data through a QAbstractItemModel named CommandListModel.
- <details> 
  <summary>UML</summary> 
  <p align="center"> <img src="https://github.com/user-attachments/assets/3f361b96-39fa-405c-bb54-989fc0fd6125" width="800"> </p> 
</details>

## Operations
- When the user clicks Start, Stop, or Pause, the script runs in a separate thread. During execution, command start and finish signals are sent to the UI and displayed in the monitoring window.
- To manage execution flow more clearly, the State Pattern is applied. The system switches between three states — Ready, Running, and Paused —depending on user interaction.
- <details> 
  <summary>UML</summary> 
  <p align="center"> <img src="https://github.com/user-attachments/assets/05897f3c-8e78-44d0-af25-50c3bcc4aa0d" width="800"> </p> 
</details>

# Future works
## Features
1. Script Editing: Functions such as removing steps, reordering commands, and binding devices or methods need to be added.
2. Content Validation: All user inputs and settings should be validated to ensure they are valid and consistent.
3. Script Saving: The script should be savable and reusable across different devices.
4. Script Execution Visualization: During operation, the monitoring area should display the current step of the running script.

## Issues
1. Occasional Task Control Shutdown: Due to multithreading issues, the program may occasionally crash when using control functions on the operation page.
2. Script Editing User Experience: Some interactions are not yet smooth — for example, drag-and-drop behavior, icon clarity, and element positioning could be improved for better usability.


