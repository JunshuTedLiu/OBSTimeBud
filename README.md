# OBSTimeBud

You've probably heard and used some of the date/time plugins for OBS on Windows, like Snaz. There's plenty of options for Windows.
<br>
However, if I wasn't wrong, there's currently no any OBS plugin for macOS that can help us to display some information like current time in our livestream.
<br>
Introducing OBSTimeBud, a plugin for Open Broadcaster Software on macOS to show the current time in your livestream.
<br />
Here is a rough demo video:
https://youtu.be/UPDV8Qzzjh4
<br>
This program is based on an assignment I had last year for one of my Mac development course in Arizona State University. It was about making a tiny program that has both the current time display and a stopwatch functionality in a simple GUI. Similar to the idea what Snaz has, I started making the OBSTimeBud app that can save and update the current time into a TXT file. Then, user can make a new text into the livestream and make this text as the content of this TXT file, which is the current time, by reading this TXT file.
<h1>How to use?</h1>
Step 1: Open the app. You will need the file path for the TXT file, which is called "Test.txt".
<br>
Step 2: In OBS, make a new source "Text (FreeType 2)".
<br>
Step 3. Select "Read from file".
<br>
Step 4. Click "Browse". Go to your home directory (you can do that by click on your username in the sidebar).
<br>
Step 5. Search for "Test.txt". Select this file.
<br>
Step 6. Congratulations, you have a text source for displaying the current time! Select "OK" to close the window.
