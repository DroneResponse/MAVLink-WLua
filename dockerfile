# Start from a full-featured Debian base with Python
FROM python:3.13-trixie

# Install essential build tools and dependencies
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		build-essential \
		git \
		wget \
		curl \
		ca-certificates \
		pkg-config \
		libglib2.0-dev \
		libpcap-dev \
		lua5.2 \
		liblua5.2-dev \
		wireshark-common \
		wireshark-dev \
		cmake \
		unzip \
		&& rm -rf /var/lib/apt/lists/*

# Set up a working directory
WORKDIR /workspace

RUN git clone https://github.com/mavlink/mavlink.git --recursive
WORKDIR /workspace/mavlink

RUN python3 -m pip install -r pymavlink/requirements.txt
RUN mkdir /out
# Default command
CMD ["bash"]


#RUN python3 -m pymavlink.tools.mavgen --lang=WLua --wire-protocol=2.0 --output=mavlink_2_common message_definitions/v1.0/common.xml