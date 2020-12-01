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
            undo_path=undo_dir+undo_file
            print('=>',end=' ')
            print('({:.2f}k)'.format(os.stat(undo_path).st_size/1024),end=' ')
            print(undo_file)
            os.remove(undo_path)
            total+=1
    print('Total: {}'.format(total))

if __name__=='__main__':
    main()
