# Remotely controls a front panel for an Xbox One X Devkit.


**Request**

Method      | Request URI
:------     | :------
WebSocket | /ext/frontpanel
<br />


**Send messages**

Strings can be send indicating that front panel buttons should be pressed. The strings should be from the following set:

Up, Down, Left, Right, or Select to control navigation One, Two, Three, Four, Five to press one of the five buttons Switch to simulate a long press of the Select button (toggling between Title and System mode).


**Recieve messages**

The websocket will return an image buffer which an be processed to show the contents of the front panel display. The buffer is send in 4bpp.

**Available device families**

* Windows Xbox

**Credits**
Microsoft