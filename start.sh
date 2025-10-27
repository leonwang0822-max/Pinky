#!/bin/bash

# Function to detect Python command
get_python_cmd() {
    if command -v python3 &>/dev/null; then
        echo "python3"
    elif command -v python &>/dev/null; then
        echo "python"
    else
        echo "No Python interpreter found. Please install Python."
        exit 1
    fi
}

# Get the appropriate Python command
PYTHON_CMD=$(get_python_cmd)

# Get the corresponding pip command
PIP_CMD="${PYTHON_CMD} -m pip"

# Install dependencies from requirements.txt
$PIP_CMD install -r requirements.txt

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "Dependencies installed successfully."
else
    echo "Error installing dependencies."
    exit 1
fi

# Start the main.py script
$PYTHON_CMD main.py

# Check if main.py started successfully
if [ $? -eq 0 ]; then
    echo "main.py started successfully."
else
    echo "Error starting main.py."
    exit 1
fi
