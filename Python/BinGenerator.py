
with open('all_ones.mif', 'w') as file:
    # Create a 16-bit binary representation of 1
    binary_1 = ("0000000000000001\n")
    
    # Repeat this 784 times and write to the file
    for _ in range(100):
        file.write(binary_1)

