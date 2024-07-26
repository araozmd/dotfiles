# Mauricio Damián https://github.com/araozmd/dotfiles
# Based on Antonio Sarosi config https://github.com/antoniosarosi/dotfiles

# Setting theme fo Qtile

from os import path
import subprocess
import json

from .path import qtile_path

# Get colors from config.json file, if it doesn't exist, use default colors dark-grey
def load_theme():
    theme = 'dark-grey'

    config = path.join(qtile_path, "config.json")
    if path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme": "{theme}"}}\n')


    theme_file = path.join(qtile_path, "themes", f'{theme}.json')
    if not path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(path.join(theme_file)) as f:
        return json.load(f)

if __name__ == "settings.theme":
    colors = load_theme()
