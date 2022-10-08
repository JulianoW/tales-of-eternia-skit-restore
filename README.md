# tales-of-eternia-skit-restore
Hello! This repo is holding code for restoring skits into the EU version of Tales of Eternia for the PSP.

# Version 1.0 - SKITS ONLY - NO SUBS
All skits have been restored. Camp skits can be viewed by bringing up the camp menu in the overworld.

As mentioned, there are no subtitles yet. This patch may not be useful for many, but should I disappear... the code is available to be built upon. It will be a while before another patch is released, as we're looking at possibly touching up the translation as well.

**If there are other triggers for skits, they may not currently be working. Please reach out to me with some information and a save file so that I can investigate.**

# Instructions
1. Grab a copy of the repo.
2. Take an ISO of the EU Tales of Eternia game and extract it into both files/original and files/patched
3. Run assembly script - asm.bat
4. Take an ISO of the JP Tales of Eternia game. Extract it, and copy PSP_GAME/USRDIR/dat/fc.v into files/patched/PSP_GAME/USRDIR/dat/fc.v and rename it to fc_us.v, overwriting/deleting the original.
5. The files/patched/ directory contains the patched files to play. You can either rebuild the ISO using UMDGEN, or you can use PPSSPP to play directly from the directory.

# Bug Reporting
If you run into any bugs please open an issue on github. Include as many details as you can, and if possible, please include a save file. You may also try to reach me in various other places where you may find me. Thanks!!
