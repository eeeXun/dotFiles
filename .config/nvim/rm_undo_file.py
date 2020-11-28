#!/usr/bin/python
import os

def main():
    undo_dir='/home/xun/.config/nvim/undodir/'
    undo_file_list=os.listdir(undo_dir)
    total=0
    print('Delete undo file:')
    for undo_file in undo_file_list:
        real_file='/'.join(undo_file.split('%'))
        if not os.path.exists(real_file):
            print('=>',undo_dir+undo_file)
            os.remove(undo_dir+undo_file)
            total+=1
    print('Total: {}'.format(total))

if __name__=='__main__':
    main()
