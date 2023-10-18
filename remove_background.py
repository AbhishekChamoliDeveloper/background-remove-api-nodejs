from rembg import remove
from PIL import Image
import numpy as np
import io
import sys

def remove_background():
    image_bytes = sys.stdin.buffer.read()
    img = remove(image_bytes)

    img_array = np.array(Image.open(io.BytesIO(img))
    img_array.tofile(sys.stdout.buffer)

if __name__ == "__main__":
    remove_background()
