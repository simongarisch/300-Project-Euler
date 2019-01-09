import os
import shutil

def create_new_folder():
    path = os.path.dirname(os.path.abspath(__file__))
    dir_contents = os.listdir(path)
    folder_name_starts = "Ex"
    number = 1
    folder_name = folder_name_starts + str(number).zfill(3)

    while folder_name in dir_contents:
        number += 1
        folder_name = folder_name_starts + str(number).zfill(3)

    #print(folder_name) # the next folder we want to create
    # use the Ex1 folder as a template
    template_folder = os.path.join(path, "Ex001")
    shutil.copytree(template_folder, folder_name)

    # rename the files
    for fi in os.listdir(os.path.join(path, folder_name)):
        new_name = fi.replace("ex1", "ex" + str(number))
        new_name = new_name.replace("Ex1", "Ex" + str(number))
        old_path = os.path.join(path, folder_name, fi)
        new_path = os.path.join(path, folder_name, new_name)
        os.rename(old_path, new_path)

    
if __name__ == "__main__":
    create_new_folder()
