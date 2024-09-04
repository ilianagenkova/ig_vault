import os

def list_files_recursive(directory):
    files_list = []
    for root, _, files in os.walk(directory):
        for file in files:
            # Get the full path of the file
            file_path = os.path.join(root, file)
            # Get the relative path of the file from the directory
            relative_path = os.path.relpath(file_path, directory)
            files_list.append(relative_path)
    return files_list

# Example usage:
directory = '..'
files = list_files_recursive(directory)

# Print the list of relative paths
for file in files:
    print(file)

