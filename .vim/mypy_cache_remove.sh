#!/bin/bash
echo "Delete directory:"
find $HOME -type d -name .mypy_cache
find $HOME -type d -name .mypy_cache -exec rm -rf {} +
