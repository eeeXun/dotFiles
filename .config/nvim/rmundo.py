#!/bin/python3
import os

def main():
    HOME = os.getenv("HOME")
    undo_dir = HOME + "/.local/share/nvim/undo/"
    undo_file_list = os.listdir(undo_dir)
    total_file = 0
    total_volume = 0
    print("Delete undo file:")
    for undo_file in undo_file_list:
        real_file = "/".join(undo_file.split("%"))
        if not os.path.exists(real_file):
            undo_path = undo_dir + undo_file
            undo_volume = os.stat(undo_path).st_size
            total_file += 1
            total_volume += undo_volume
            print("=> ({:.2f}k)".format(undo_volume / 1024), end=" ")
            print(undo_file)
            os.remove(undo_path)
    print("Total space: {:.2f}k".format(total_volume / 1024))
    print("Total files: {}".format(total_file))

if __name__ == "__main__":
    main()
