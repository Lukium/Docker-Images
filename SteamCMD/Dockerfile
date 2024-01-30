# Use Ubuntu 23.04 as the base image
FROM ubuntu:23.04

# Update the package list and install Python, sudo, and other necessary packages
RUN apt-get update && \
        apt-get upgrade -y && \
        apt install -y \
                software-properties-common \
                debconf-utils && \
        dpkg --add-architecture i386 && \
        echo "steam steam/question select I AGREE" | debconf-set-selections && \
        apt-get update && apt install -y \
                steamcmd \
                sudo \
                curl \
                nano && \
        apt-get purge -y debconf-utils && \
        apt-get autoremove -y && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# Create steam user and add to sudo group
RUN id steam || useradd -m steam

# Copy the entry point script
COPY entrypoint.sh /home/steam/entrypoint.sh

# Make the entry point script executable
RUN chown steam:steam /home/steam/entrypoint.sh && \
chmod +x /home/steam/entrypoint.sh

# Switch to steam user
USER steam

# Set working directory
WORKDIR /home/steam

# Set the entry point script as the default command
ENTRYPOINT ["/home/steam/entrypoint.sh"]