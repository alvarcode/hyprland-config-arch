#!/usr/bin/env python
import os
import sys


def render_progress(value):
    sys.stdout.write("\033[s")
    sys.stdout.flush()

    progress = value / len(dir)
    pgs_bar = f"\033[95m{'━' * int(progress * 40)}"
    print(f"  {pgs_bar}\033[35m{'━' * (40 - len(pgs_bar))}\033[0m (progreso: {progress * 100}%)")

    sys.stdout.write("\033[u")
    sys.stdout.flush()
                                             

print("Instalador de configuración Hyprland\n")

ignore = [ ".git", "install.py" ]

HOME = os.getenv("HOME")
dir = os.listdir("./")

for item in ignore: dir.remove(item)

for idx, item in enumerate(dir):
    render_progress(idx + 1)
    cmd = "./" + item

    if os.path.isdir(cmd):
        if not os.path.exists(f"{HOME}/{item}"):
            os.system(f"mkdir {HOME}/{item}")
        cmd = " -r " + cmd

    cmd = f"cp {cmd} {HOME}/"
    os.system(cmd)

sys.stdout.write("\033[2B")
sys.stdout.flush()
print("Configuración aplicada correctamente! \033[32m \033[0m")
