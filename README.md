# Donkey in Docker
Running [donkeycar](http://docs.donkeycar.com/) inside a docker container

# Install
1. Pull the docker image `docker pull haoru233/tritonai-donkeycar:4.1-cpu` (CPU) or `docker pull haoru233/tritonai-donkeycar:4.1-gpu` (GPU)
2. If you decide to use GPU to accelerate training/inferrence, you also need to install [Nvidia container runtime](https://github.com/NVIDIA/nvidia-container-runtime) alongside docker and reboot.
3. Give permission to scripts `chmod +x run*`
4. Connect a joystick. If the joystick input file on your system is not `/dev/input/js0`, Go into the scripts to change the `--device` argument.
5. Run the corresponding script to launch the container: `./run.sh` (CPU), or `./run_gpu.sh` (GPU).

# Donkey Gym Simulator
1. Get the [latest simulator binary](https://github.com/tawnkramer/gym-donkeycar/releases) for your system
2. Launch the simulator **BEFORE** you drive the car

# Once You Launch The Container
You will be in `/donkeys/mycar` directory with donkey environment activated. This car folder is fresh. You need to modify `myconfig.py` to adjust to your setups.

`nano` and `rsync` are installed for your convenience.

## Known issue

`myconfig.py` is missing an `AI_THROTTLE_MULT` in Donkey 4.1 and may throw at you error when driving with a model. Just add it to the end of the file.

`AI_THROTTLE_MULT = 1.0`

