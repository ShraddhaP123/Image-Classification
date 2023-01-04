import re
import sys
import os

filename = sys.argv[1]
inp = os.path.splitext(filename)[0]

pattern1  = '(Training data percent:\s+)(\d+(\.\d+)?%)'
pattern2  = '(Training time:\s+)(\d+\.\d+)'
pattern3  = '(Accuracy:\s+)(\d+(\.\d+)?%)'
pattern4  = '(Prediction Error:\s+)(\d+\.\d+)'
pattern5  = '(Standard deviation:\s+)(\d+\.\d+)'

new_file2 = []
new_file3 = []
new_file4 = []
new_file5 = []

# Make sure file gets closed after being iterated
with open(filename, 'r') as f:
   # Read the file contents and generate a list with each line
   lines = f.readlines()

# Iterate each line
for line in lines:
    # Regex applied to each line
    match1 = re.search(pattern1, line)
    match2 = re.search(pattern2, line)
    match3 = re.search(pattern3, line)
    match4 = re.search(pattern4, line)
    match5 = re.search(pattern5, line)
    #training data percent
    if match1:
        new_line1 = match1.group(2) + '\n'
        print(new_line1)
        new_file2.append(new_line1)
        new_file3.append(new_line1)
        new_file4.append(new_line1)
        new_file5.append(new_line1)

    #training time
    if match2:
        new_line2 = match2.group(2) + '\n'
        print(new_line2)
        new_file2.append(new_line2)

    #accuracy
    if match3:
        new_line3 = match3.group(2) + '\n'
        print(new_line3)
        new_file3.append(new_line3)

    #prediction error
    if match4:
        new_line4 = match4.group(2) + '\n'
        print(new_line4)
        new_file4.append(new_line4)

    #standard deviation
    if match5:
        # Make sure to add \n to display correctly when we write it back
        new_line5 = match5.group(2) + '\n'
        print(new_line5)
        new_file5.append(new_line5)

with open(inp+"T.txt", 'w') as f:
     f.seek(0)
     f.writelines(new_file2)

with open(inp+"A.txt", 'w') as f:
    f.seek(0)
    f.writelines(new_file3)

with open(inp+"P.txt", 'w') as f:
    f.seek(0)
    f.writelines(new_file4)

with open(inp+"S.txt", 'w') as f:
    f.seek(0)
    f.writelines(new_file5)
