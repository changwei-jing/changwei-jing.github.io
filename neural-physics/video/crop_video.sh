#!/bin/bash

# Video path
INPUT_VIDEO="/home/jcw/jcw/physics_demo/neural-physics/video/slides.mp4"
OUTPUT_VIDEO="/home/jcw/jcw/physics_demo/neural-physics/video/slides_cropped.mp4"

# Detected dimensions: 1728x1008
# To crop the bottom black bar (assuming it's roughly 8-16 pixels):
# We keep the full width (1728) and reduce the height (e.g., to 1000 or 992)
# crop=w:h:x:y
# To crop 8 pixels from the bottom: crop=1728:1000:0:0

echo "Cropping $INPUT_VIDEO to $OUTPUT_VIDEO..."

ffmpeg -i "$INPUT_VIDEO" -vf "crop=1728:880:0:0" -c:v libx264 -crf 18 -c:a copy "$OUTPUT_VIDEO"

echo "Done! You can verify the cropped video and then update index.html if it looks good."
