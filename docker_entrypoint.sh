#!/bin/bash
set -e

# Activate the virtual environment
. /app/venv/bin/activate

echo "Building RoPE CUDA kernels..."
cd /app/models/SLAM3R/slam3r/pos_embed/curope
python setup.py build_ext --inplace
cd /app

echo "Build completed. Launching service..."
export PYTHONPATH=$(pwd)
exec python scripts/slam3r_main.py
