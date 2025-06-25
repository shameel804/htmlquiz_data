import json

# Load JSON data from files
with open('v1/Css/pseudo_code.json', 'r') as file_a:
    a_list = json.load(file_a)

with open('v1/Css/9 pseudo.json', 'r') as file_b:
    b_list = json.load(file_b)

# Initialize the combined list
combined_list = []

# Find the max length between the two lists
max_length = max(len(a_list), len(b_list))

# Loop to combine elements
for i in range(max_length):
    if i < len(a_list):
        combined_list.append(a_list[i])  # Append from list 'a'
    if i < len(b_list):
        combined_list.append(b_list[i])  # Append from list 'b'

# Save the combined list to a new JSON file
with open('combined.json', 'w') as combined_file:
    json.dump(combined_list, combined_file, indent=4)

print("Interleaved JSON data has been written to 'combined.json'.")
