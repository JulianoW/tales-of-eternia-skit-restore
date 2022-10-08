# tales-of-eternia-skit-restore
Hello! This repo is holding code for restoring skits into the EU version of Tales of Eternia for the PSP.

# Version 1.0 - SKITS ONLY - NO SUBS
All skits have been restored. Camp skits can be viewed by bringing up the camp menu in the overworld.

As mentioned, there are no subtitles yet. This patch may not be useful for many, but should I disappear... the code is available to be built upon. It will be a while before another patch is released, as we're looking at possibly touching up the translation as well.

**If there are other triggers for skits, they may not currently be working. Please reach out to me with some information and a save file so that I can investigate.**

# Instructions
1. Grab a copy of the repo.
2. Take an ISO of the EU Tales of Eternia game and extract it into both files/original and files/patched
2a - You may need to decrypt the eboot. The EU Undub eboot should already be decrypted.
3. Run assembly script - asm.bat
4. Take an ISO of the JP Tales of Eternia game. Extract it, and copy PSP_GAME/USRDIR/dat/fc.v into files/patched/PSP_GAME/USRDIR/dat/fc.v and rename it to fc_us.v, overwriting/deleting the original.
5. The files/patched/ directory contains the patched files to play. You can either rebuild the ISO using UMDGEN, or you can use PPSSPP to play directly from the directory.

# Bug Reporting
If you run into any bugs please open an issue on github. Include as many details as you can, and if possible, please include a save file. You may also try to reach me in various other places where you may find me. Thanks!!

# Technical Stuff
So... in Tales of Symphonia, they removed voice from skits by setting the volume to 0. What did they do here to remove the skits?

In the code for camping, we find a call to the skit setup function, as well as another function right before it:

![image](https://user-images.githubusercontent.com/6155506/194709274-5a5d8982-9817-41d3-84ce-e16b4e3fa2e1.png)

In the Japanese eboot, the first function runs some logic and returns the id of the skit to play.

In the English eboot, the function...

![image](https://user-images.githubusercontent.com/6155506/194709359-f339e24b-8ac3-46a0-b01e-93b19d2f9344.png)

returns 0. So the functionality for camp skits were never removed from the code. It was just hardcoded to never play any skits. (By always telling it to play "skit 0".)

Doing some testing by editing this to return another value, the game successfully plays the skit. (There are, however, some issues. It will try to play sound, but the game doesn't find any sound to play, so the skit "plays" really fast.)

So the first step is to restore this function. By using the JP eboot as reference, the function is rebuilt in the asm scripts. One of the function called inside this includes a huuuuuuuuge 258 case switch statement. Likely the logic that determines which skit to play. This function is only used in one place (the function that was essentially nulled out), so without that, nothing calls it. Lucky for us, despite never being used, that function was NOT removed from the game, so we don't have to re-write it!

Now, fixing the above lets skits play. What about the sound?

Doing some reversing, we find a table in the eboot that contains pointers into the fc(_us).v file, essentially telling the game, for each skit, where to start and stop, to copy data out of fc(_us).v and into ram. The English table contains a lot of 00's over the id's "not in the game", and then the pointers start at the navigation skits. The simple fix here is to take the table from the Japanese eboot, place it in the English eboot, and copy the Japanese .v file.

This ends up requiring you to have Japanese dubs. Some more research needs to be done into this format to possibly add in null audio into the non dubbed skits, while retaining the original English audio in the ones that were dubbed. 
