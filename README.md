# song-sections
A simple ReaScript for writing song structure to a text file using regions.

# Installation
Download song-sections.lua and load it in Reaper via *Actions->Show action list...*

# How to use
- Mark your song sections using regions. Region names should match the array keys in next step
- Define the length of each section in beats by editing the script file  
For example:  
```
sections = {}
sections["Intro"] = 8
sections["A"] = 4
```
- *Optional:* Edit the filename in the script. `filename = "<your filename>"`
- Run the script from the Actions menu or the action list dialog
- A file containing the song structure should appear in the root directory of your Reaper project  
It should look like this:  
```
Intro x 2.0
A x 8.0
B x 4.0
```
