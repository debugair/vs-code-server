#!/bin/sh

# Import Microsoft GPG key for package verification
echo "Importing Microsoft GPG key..."
curl -sS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/mssql.gpg

# Add Microsoft repository to package sources
echo "Adding Microsoft repository to package sources..."
curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Update package lists
echo "Updating package lists..."
apt-get update

# Install msodbcsql18 package with automatic EULA acceptance
echo "Installing msodbcsql18 package..."
ACCEPT_EULA=Y apt-get install -y msodbcsql18
