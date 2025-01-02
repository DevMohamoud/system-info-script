#!/bin/bash
#

systemInfoSummary() {
    local data_file="$1"
    # Clear the file or create it if it doesn't exist
    : > "$data_file"
    {
    # Write system information to the file
    echo "System Information" >> "$data_file"
    echo "Created at: $(date)" >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # System Information
    echo "System Information:" >> "$data_file"
    uname -a >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # CPU Information
    echo "CPU Information:" >> "$data_file"
    lscpu >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # Memory Information
    echo "Memory Information:" >> "$data_file"
    free -h >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # Disk Information
    echo "Disk Information:" >> "$data_file"
    df -h >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # Network Information
    echo "Network Information:" >> "$data_file"
    ip a >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"

    # System Monitoring (Top Snapshot)
    echo "System Monitoring:" >> "$data_file"
    top -b -n 1 | head -5 >> "$data_file"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$data_file"
    } | tee "$data_file"
    
}


