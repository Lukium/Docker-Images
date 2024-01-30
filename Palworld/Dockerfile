# Use lukium/steamcmd as the base image
FROM lukium/steamcmd:0.1.0

# Copy the entry point script
RUN /usr/games/steamcmd +login anonymous +app_update 2394010 validate +quit

# Set Workdir
WORKDIR /home/steam/.steam

# Fix Logs
RUN ln -s steam/steamcmd/linux32 sdk32 && ln -s steam/steamcmd/linux64 sdk64

# Set working directory
WORKDIR /home/steam

# Change to root to copy files
USER root

# Copy the entry point script
COPY startup.sh /home/steam/startup.sh

# Make the entry point script executable
RUN chown steam:steam /home/steam/startup.sh && \
chmod +x /home/steam/startup.sh

# Change back to steam user
USER steam

# Set the entry point script as the default command
# Entrypoint already exists in the base image and will run startup.sh if it exists
ENTRYPOINT ["/home/steam/entrypoint.sh"]
