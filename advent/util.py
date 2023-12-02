import os
from pathlib import Path

from typing import List


def get_resource(name: str) -> Path:
    '''Returns the path for a given resource'''
    module_path = Path(os.path.dirname(__file__))
    resource_path = Path(module_path.parent, 'resources')
    return Path(resource_path, name)


def get_resource_lines(day: str) -> List[str]:
    return(
        get_resource(f'day_{day}/input.txt')
    ).read_text().splitlines()
