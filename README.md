# OBSTimeBud

<p>You've probably heard and used some of the date/time plugins for OBS on Windows, like Snaz. There's plenty of options for Windows.</p>
<p>However, if I wasn't wrong, there's currently no any OBS plugin for macOS that can help us to display some information like current time in our live stream.</p>
<p>Introducing OBSTimeBud, a plugin for Open Broadcaster Software on macOS to show the current time in your live stream.</p>
<p>Here is a rough demo video:
https://youtu.be/UPDV8Qzzjh4</p>

<h2>How to use?</h2>
<p>Step 1. Open the app first. The app will generate a file path for the text file, which is called "time.txt".</p>
<p>Step 4. In OBS, create a new source "Text (FreeType 2)" for the current time.</p>
<p>Step 3. Select "Read from file".</p>
<p>Step 4. Click "Browse". Go to your home directory (you can do that by click on your username in the sidebar).</p>
<p>Step 5. Search for "Test.txt". Select this file.</p>
<p>Step 6. Congratulations, you have a text source for displaying the current time! Select "OK" to close the window.</p>

<h2>How this Works</h2>
<p>This program is based on an assignment I had last year for one of my Mac development course at Arizona State University. It was about making a tiny program that has both the current time display and a stopwatch functionality in a simple GUI. Similar to the idea what Snaz has, I started making the OBSTimeBud app that can save and update the current time into a text file.</p>
<p>OBS for mac has a test source called "Text (FreeType 2)" that allows you to show the text content that is read from a text file (txt). This plugin creates a text file, "time.txt", in the document directory of this app, which is inside your home folder. What we are doing is linking these files into your OBS text sources.</p>

<h2>Problems</h2>
<p>In the current version, there is a significant lag on my MacBook Pro. According to my test, the text file updates almost instantly, but the text source in OBS reading the text file responses a bit slow. The time shows on the OBS will be 1-2 seconds slower than the actual time. Sometimes the time even stops updating for a few seconds, but it is rare (it might depend on how fast your computer are).</p>

<h2>Future Thoughts</h2>
<p>Some new features I'm planning in my head for the future update, includes</p>
<ul>
  <li>Current date. Besides the current time, why not add the current date (even in different formats)?</li>
  <li>Stopwatch and lap. I actually have this feature in the current version, but not implemented for the OBS yet. I just need to create two more text files for these.</li>
  <li>World times. Display the current time in the different time zones from all countries/regions.
  <li>You will see some UI design updates as well.</li>
</ul>
  
<h2>Similar Plugins</h2>
<p>I also made a plugin for OBS, OBSLyricsBud, that can help you display song lyrics or captions in your live stream. You can control the lyrics/subtitles by simply pressing buttons for the next/previous sentence.</p>

<h2>Current Version</h2>
<p>1.0 Beta1</p>

<h2>Feedback</h2>
<p>If you have any question or advice, please email me by junshutedliu@gmail.com.</p>
