#!/bin/bash
docker run --name donkeycar --rm -it \
    --mount type=volume,source=tritonai-donkeycar,target=/projects \
    --network=host \
    --device=/dev/input/js0 \
    --runtime=nvidia \
    --gpus=all \
    haoru233/tritonai-donkeycar:4.1-jp4.5 \

