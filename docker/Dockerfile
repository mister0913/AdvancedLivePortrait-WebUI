FROM debian:bookworm-slim AS builder

RUN apt-get update && \
    apt-get install -y curl git python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* && \
    mkdir -p /AdvancedLivePortrait-WebUI

WORKDIR /AdvancedLivePortrait-WebUI

# Edit requirements-cpu.txt if you're not using Nvidia GPU
COPY requirements.txt .

# Edit requirements-cpu.txt if you're not using Nvidia GPU
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --no-cache-dir -r requirements.txt


FROM debian:bookworm-slim AS runtime

RUN apt-get update && \
    apt-get install -y curl ffmpeg python3 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /AdvancedLivePortrait-WebUI

COPY . .
COPY --from=builder /AdvancedLivePortrait-WebUI/venv /AdvancedLivePortrait-WebUI/venv

VOLUME [ "/AdvancedLivePortrait-WebUI/models" ]
VOLUME [ "/AdvancedLivePortrait-WebUI/outputs" ]

ENV PATH="/AdvancedLivePortrait-WebUI/venv/bin:$PATH"
ENV LD_LIBRARY_PATH=/AdvancedLivePortrait-WebUI/venv/lib64/python3.11/site-packages/nvidia/cublas/lib:AdvancedLivePortrait-WebUI/venv/lib64/python3.11/site-packages/nvidia/cudnn/lib

ENTRYPOINT [ "python", "app.py" ]
