#!/bin/bash
docker run --name donkeycar --rm -it \
    --mount type=volume,source=tritonai-donkeycar,target=/donkeys \
    --network=host \
    --device=/dev/input/js0 \
    haoru233/tritonai-donkeycar:4.1-cpu \

