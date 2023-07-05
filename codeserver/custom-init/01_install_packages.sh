#!/bin/sh

# see: https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16&tabs=alpine18-install%2Calpine17-install%2Cdebian8-install%2Credhat7-13-install%2Crhel7-offline
# see: https://duckdb.org/docs/api/odbc/linux.html
# Install required dependencies for ODBC driver installation
echo "Installing required dependencies..."
apt-get install -y lsb-core iputils-ping traceroute unixodbc