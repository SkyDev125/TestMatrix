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

imageExtensions = ['.png', '.jpg', '.jpeg', '.gif', '.bmp', '.tiff', '.webp']

def resize_image(input_path, output_dir):
    # Load the image
    with Image.open(input_path) as img:
        original_size = img.size

        # Determine the size for 4.0x scale
        max_size = 2000

        width_usage = original_size[0] / max_size
        height_usage = original_size[1] / max_size

        if width_usage <= 1 and height_usage <= 1:
            # Everything is fine; The base image isn't too big
            scale_4x_size = original_size
            
        elif width_usage > height_usage:
            # Image is too wide and width-limited; cap the width and scale the height proportionally
            scale_4x_size = (max_size[0], original_size[1] * (max_size[0] / original_size[0]))
            
        else:
            # Image is too tall and height-limited; cap the height and scale the width proportionally
            scale_4x_size = (original_size[0] * (max_size[1] / original_size[1]), max_size[1])

        # Calculate base scale factor for other scales
        base_scale = scale_4x_size[0] / original_size[0] / 4.0

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

def resize_images(assets_path):
    file_paths = []

    # Get the path of all of the images in all folders
    for root, dirs, files in os.walk(assets_path):
        for file in files:
            if file.endswith(tuple(imageExtensions)):
                file_paths += [os.path.join(root, file)]

    # Resize each image
    for file_path in file_paths:
        resize_image(file_path, os.path.dirname(file_path))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Resize an icon image.')
    parser.add_argument('assets_path', type=str, help='Input image file path')

    args = parser.parse_args()
    resize_images(args.assets_path)
