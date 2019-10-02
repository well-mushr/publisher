#!/usr/bin/env python

import time

from threading import Thread

def do_task():
    while True:
        time.sleep(1)

if __name__ == '__main__':
    while True:
        time.sleep(1)
        Thread(target=do_task).start()
