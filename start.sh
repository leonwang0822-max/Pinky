#!/bin/bash

# Install dependencies from requirements.txt
pip install -r requirements.txt

# Check if installation was successful
if [ $? -eq 0 ]; then
    echo "Dependencies installed successfully."
else
    echo "Error installing dependencies."
    exit 1
fi

# Start the main.py script
python main.py

# Check if main.py started successfully
if [ $? -eq 0 ]; then
    echo "main.py started successfully."
else
    echo "Error starting main.py."
    exit 1
fi
