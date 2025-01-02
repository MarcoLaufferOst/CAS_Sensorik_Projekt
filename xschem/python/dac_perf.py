
import numpy as np
import matplotlib.pyplot as plt

adc_bits = 8
adc_values = 2**adc_bits
adc_ref = 2.0
adc_lsb = adc_ref / adc_values

print(f"ADC Parameter Bits: {adc_bits} Values: {adc_values} LSB: {adc_lsb}V")


data = np.loadtxt("dac_data.txt")

voltages = data[:adc_values, 1]
#flip the vector so the last value is the highest
voltages = voltages[::-1]

# calculate the DNL
# DNL[i] = ( ( v[i+1] - v[i] ) / LSB ) - 1
delta_between_values = voltages[1:] - voltages[:-1]
DNL = delta_between_values / adc_lsb - 1

#calculate the INL
# INL[i] = ( V[i] - v_ideal[i] ) / LSB
# the values are offest comp

v_ideal = np.linspace(0.0,adc_ref , adc_values)

offset = voltages[0] - 0.0
voltages_no_offset = voltages -offset

error = voltages_no_offset - v_ideal
INL = error / adc_lsb

# print("*********** DNL *************")
# print(DNL)

# print("*********** INL *************")
# print(INL)


# DNL Plot
plt.subplot(3, 1, 1)
plt.plot(DNL, marker='o', linestyle='-', color='b', markersize=3)
plt.title('DNL (Differential Nonlinearity)')
plt.xlabel('Code')
plt.ylabel('DNL [LSB]')
plt.ylim(-2, 2)
plt.grid(True)

# INL Plot
plt.subplot(3, 1, 2)
plt.plot(INL, marker='x', linestyle='-', color='r', markersize=3)
plt.title('INL (Integral Nonlinearity)')
plt.xlabel('Code')
plt.ylabel('INL [LSB]')
# plt.ylim(-4, 4)
plt.grid(True)


#plot the ADC Values

plt.subplot(3, 1, 3)
plt.plot(voltages, marker='o', linestyle='-', label='meassured values', markersize=3)
plt.plot(v_ideal, linestyle='--', label='ideal curve (0V to 2V)', color='r')
plt.title('ADC-Values vs. ideal curve')
plt.xlabel('Code')
plt.ylabel('Spannung [V]')
plt.legend()
plt.grid(True)


# show plots
plt.tight_layout()
plt.show()

input()