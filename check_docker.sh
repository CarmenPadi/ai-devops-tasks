#!/bin/bash

# Script to check Docker service status and start if not running

# Function to check if script is run with sudo/root privileges
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run this script with sudo or as root"
        exit 1
    fi
}

# Function to check Docker service status
check_docker() {
    echo "Checking Docker service status..."
    if systemctl is-active --quiet docker; then
        echo "✅ Docker service is running"
        return 0
    else
        echo "❌ Docker service is not running"
        return 1
    fi
}

# Function to start Docker service
start_docker() {
    echo "Starting Docker service..."
    if systemctl start docker; then
        echo "✅ Docker service started successfully"
        return 0
    else
        echo "❌ Failed to start Docker service"
        return 1
    fi
}

# Main script execution
main() {
    # Check for root privileges
    check_root

    # Check if Docker is running
    if ! check_docker; then
        # Try to start Docker if not running
        start_docker
    fi

    # Verify final status
    if check_docker; then
        # Show Docker version if service is running
        echo -e "\nDocker version:"
        docker --version
    else
        echo "⚠️ Unable to start Docker service. Please check system logs."
        exit 1
    fi
}

# Run the script
main
