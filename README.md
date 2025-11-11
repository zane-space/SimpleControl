# SimpleControl
Automation machines can be applied in many fields, including manufacturing, the food industry, and even home services.
To make automation systems more adaptable to different requirements, two key aspects need to be addressed: the flexibility of component combinations and the ease of flow editing.

Automation machines are typically composed of various components based on the user’s specific needs.
For example, a screwing machine might include one robot arm, a PLC for the conveyor, a feeder, and a screwdriver, while a labeling machine would not require the screwdriver module.
On the other hand, users often need to customize or edit the operation flow to make the machine perform tasks more efficiently.

In many traditional automation systems, each unique machine configuration requires different or even duplicated code. Moreover, most of them lack a convenient or no-code method for editing the workflow.

SimpleControl is an example application that demonstrates a more extensible and user-friendly concept of automation control.

## Note:
This project is a conceptual prototype for automation control.
Some features and optimizations have been intentionally omitted and may be improved in future updates.
A list of these items is provided in this document.

# Future works
## Features
1. Script Editing:
Functions such as removing steps, reordering commands, and binding devices or methods need to be added.

3. Content Validation:
All user inputs and settings should be validated to ensure they are valid and consistent.

4. Script Saving:
The script should be savable and reusable across different devices.

5. Script Execution Visualization:
During operation, the monitoring area should display the current step of the running script.

## Issues
1. Occasional Task Control Shutdown:
Due to multithreading issues, the program may occasionally crash when using control functions on the operation page.

2. Script Editing User Experience:
Some interactions are not yet smooth — for example, drag-and-drop behavior, icon clarity, and element positioning could be improved for better usability.


