import numpy as np
import matplotlib.pyplot as plt


#random_weight_x = np.round(np.random.uniform(low=0, high=2, size=10), 1)  # Changed high to 2
clean_array_x = np.linspace(0, 10, 100)  # Changed high to 2

random_array_x = np.zeros(10)

for i in range(10):
    random_array_x[i] =  i + np.random.random(size=1)
print(random_array_x)
    
# Create sine wave functions
def noisy_sine(random_array_x):
    random_weight_y = 1.4*np.round(np.random.uniform(low = -3, high = 3, size = len(random_array_x)),1)
    return 20*np.sin(2*np.pi*random_array_x/10) + random_weight_y 

def clean_sine(clean_array_x):
    return 20*np.sin(2*np.pi*clean_array_x/10)  


y_noise = noisy_sine(random_array_x)
y_clean = clean_sine(clean_array_x)

plt.figure(figsize=(10, 6))
plt.plot(clean_array_x, y_clean, 'b-', label='Clean Sine')
plt.plot(random_array_x, y_noise, 'ro', label='Noisy Points')
plt.grid(True)
plt.xlabel('X values')
plt.ylabel('Sine Values')
plt.title('Clean vs Noisy Sine Wave (OneOscillations)')
plt.legend()

plt.show()

