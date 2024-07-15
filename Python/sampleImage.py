from tensorflow.keras.datasets import mnist
import numpy as np
import matplotlib.pyplot as plt


def dec_to_signed_fixed_point(num, num_bits=16):

  # Check for overflow (absolute value greater than or equal to 1)
  if abs(num) >= 7:
    raise OverflowError("Number too large for fixed-point representation")

  # Extract sign bit
  sign = 0 if num >= 0 else 1

  # Separate integer and fractional parts (already normalized between 0 and 1)
  integer_part = int(num)
  fractional_part = num - integer_part

  # Convert integer part to binary (limit to 1 or 0 using bitwise AND with 1)
  int_binary = bin(integer_part & 7)[2:].zfill(3)  # Ensures 3-bit representation

  # Scale fractional part for 14-bit representation with a factor of 2^14 (avoid overflow)
  fractional_part *= 2**12

  # Convert scaled fractional part to binary (14 bits)
  frac_binary = bin(int(fractional_part))[2:].zfill(12)

  # Combine sign, integer, and fractional parts
  fixed_point_binary = f"{sign}{int_binary}{frac_binary}"

  return fixed_point_binary


# Load MNIST data (modify for specific image selection)
(x_train, _), (_, _) = mnist.load_data()
image = x_train[1]  # Assuming you want the first image

# Normalize pixel values (divide by 255)
normalized_image = image.astype(np.float16) / 256

# Convert each pixel value to signed fixed-point binary (16 bits)
fixed_point_image = []
for pixel in normalized_image.flatten():
  try:
    binary_representation = dec_to_signed_fixed_point(pixel, 16)
    fixed_point_image.append(binary_representation)
  except OverflowError:
    print(f"Warning: Pixel value {pixel} overflows fixed-point representation")

# Print the original image shape and number of converted values
print("Original image shape:", image.shape)
plt.imshow(image, cmap='gray')
plt.title('Digit')
plt.show()
print("Number of converted values:", len(fixed_point_image))


# Writing in file
f = open("SampleImage.mif", "w")
for val in fixed_point_image:
    f.write(val)
    f.write('\n')
    
f.close()
print("done")
