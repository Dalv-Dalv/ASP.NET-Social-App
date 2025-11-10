FROM mcr.microsoft.com/dotnet/sdk:9.0

# Install EF CLI tools
RUN dotnet tool install --global dotnet-ef

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Add dotnet tools to PATH permanently for all shell types
RUN echo 'export PATH="$PATH:/root/.dotnet/tools"' >> /root/.bashrc && \
    echo 'export PATH="$PATH:/root/.dotnet/tools"' >> /root/.profile && \
    echo 'export PATH="$PATH:/root/.dotnet/tools"' >> /etc/profile.d/dotnet-tools.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
