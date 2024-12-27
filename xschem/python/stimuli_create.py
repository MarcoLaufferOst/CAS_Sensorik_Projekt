


for i in range(256):

    print("")
    print("s 5")

    bin_str = f"{i:08b}"
    for j in range(8):
        print(f"set v_b{j} {bin_str[7-j]}")
    


