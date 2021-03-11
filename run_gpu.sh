#!/bin/bash
docker run --name donkeycar --rm -it \
    --mount type=volume,source=tritonai-donkeycar,target=/donkeys \
    --network=host \
    --device=/dev/input/js0 \
    --gpus all \
    haoru233/tritonai-donkeycar:4.1-gpu \