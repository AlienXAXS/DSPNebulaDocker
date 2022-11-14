# DSPNebulaDocker
An attempt at getting Dyson Sphere Program Nebula Mod working on Docker using Wine.

I am no way a Docker expert or know how to use Wine. I cobbled together this script that does run a DSP Headless Client within Pter (https://pterodactyl.io)

# How To use this in Pter:
1. You first need to import the egg into your Pter Install using the Nests area
2. Install a new server using the new egg you have just imported
3. Wait for the server setup to complete, this can take a long time.
4. Start the server once, then stop it so it creates the Dyson Sphere Program directory
5. Upload your saves to the "Dyson Sphere Program" folder
6. Start the server

It should look like this:

![image](https://user-images.githubusercontent.com/1773445/201533782-3f4792a8-e614-45fb-9803-11f237bb40df.png)

# Things I've Tested:
- Saving/Loading works
- Building works well
- Deconstructing works
- Interplanetry travel works
- Logistic Bots / Logstic Vessles and Inter-Planetary Vessles all work

# Current Issues:
- Some BepInEx logs do not make it to the console screen, investigating this.
- The console is constantly bombarded with .NET errors which I am not too sure how to fix.

# Want to help?
As said I am lacking knowledge here, if you want to help and have knowledge of Wine, Winetricks and DotNet/Mono installs within Wine you can find me on the [Nebula Discord](https://discord.gg/UHeB2QvgDa) under "AlienX"
