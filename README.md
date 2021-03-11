# Donkey in Docker (Built for Nvidia Jetson Series) 
Running [donkeycar](http://docs.donkeycar.com/) inside a docker container on a Jetson SBC.
Jetpack version: 4.5
# Install
1. Install JetPack 4.5
2. Pull the docker image `docker pull haoru233/tritonai-donkeycar:4.1-jp4.5`
3. Give permission to the script `chmod +x run.sh`
4. Connect a joystick. If the joystick input file on your system is not `/dev/input/js0`, Go into the scripts to change the `--device` argument.
5. Run the corresponding script to launch the container: `./run.sh`.
# Once You Launch The Container
You will be in `/donkeys/mycar` directory with donkey environment activated. This car folder is fresh. You need to modify `myconfig.py` to adjust to your setups.

`nano` and `rsync` are installed for your convenience.

## Known issue

`myconfig.py` is missing an `AI_THROTTLE_MULT` in Donkey 4.1 and may throw at you error when driving with a model. Just add it to the end of the file.

`AI_THROTTLE_MULT = 1.0`

# Work In Progress
This image has not been tested yet. We expect most issues to come from interfacing with peripheral devices such as PWM board.

We also plan to build a instruction notebook into the image.
