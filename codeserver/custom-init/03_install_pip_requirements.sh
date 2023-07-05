#!/bin/sh

# upgrade pip
python -m pip install --upgrade pip

# Check if DEFAULT_WORKSPACE environment variable is set
if [[ -n "$DEFAULT_WORKSPACE" ]]; then
  workspace_path="$DEFAULT_WORKSPACE"
else
  workspace_path="/config/workspace"
fi