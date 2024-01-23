#!/usr/bin/env python3

# Example usage from the command line:
#  python script.py input_image.png output_directory/

# Install dependencies using the following command:
#  pip install -r requirements.txt

# TODO: Add a method to automatically detect and process images in the assets folder
#  which can be called at build time

import argparse
from PIL import Image
import os

def resize_icon(input_path, output_dir):
    # Load the image
    with Image.open(input_path) as img:
        original_size = img.size

        # Determine the size for 4.0x scale
        max_size = (2000, 2000)
        scale_4x_size = tuple(min(original, max_dim) for original, max_dim in zip(original_size, max_size))

        # Calculate base scale factor for other scales
        base_scale = min(scale_4x_size) / max(original_size) / 4.0

        # Define scale factors
        scales = {'0.25x': 0.25, '0.5x': 0.5, 'mdpi': 1, '1.5x': 1.5, '2.0x': 2, '3.0x': 3, '4.0x': 4}

        # Resize and save images
        for scale_name, scale_factor in scales.items():
            scaled_size = tuple(round(dimension * base_scale * scale_factor) for dimension in original_size)
            scaled_img = img.resize(scaled_size, Image.BICUBIC)

            # Create output directory if not exists
            if scale_name == 'mdpi':
                output_path = os.path.join(output_dir)
            else:
                output_path = os.path.join(output_dir, scale_name)

            os.makedirs(output_path, exist_ok=True)

            # Save image
            file_name = os.path.basename(input_path)
            scaled_img.save(os.path.join(output_path, file_name))

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Resize an icon image.')
    parser.add_argument('input_path', type=str, help='Input image file path')
    parser.add_argument('output_dir', type=str, help='Output directory path')

    args = parser.parse_args()
    resize_icon(args.input_path, args.output_dir)
