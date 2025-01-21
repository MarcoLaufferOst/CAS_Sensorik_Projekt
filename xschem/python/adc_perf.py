
import matplotlib.pyplot as plt

f = open("dac_ctrl_out_voltage.txt","r")
data_from_file = f.readlines()
f.close()

in_voltage = list()
code = list()
data = iter(data_from_file)

for i in range(256):
    in_v = float(next(data).split(" ")[2])
    _code = 0
    
    for j in range(8):
        val = float(next(data).split(" ")[2])
        if val > 0:
            _code += 2**j
    
    #invert the code
    _code = 0xFF &~ _code
    
    code.append(_code)
    in_voltage.append(in_v)


# print(code)
# print(in_voltage)
            
plt.figure(figsize=(8, 5))
plt.plot(in_voltage, code, marker='.', linestyle=' ', label='Code vs. Voltage')

plt.xlabel('Input Voltage (V)')
plt.ylabel('Code (Digital Value)')
plt.title('Code vs. Input Voltage')

plt.grid(True)
plt.legend()

# Plot anzeigen
plt.show()    
input()    
    