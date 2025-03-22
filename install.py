#!/usr/bin/env python
import os
from os import path
import subprocess
import sys

def render_bar(value):
    sys.stdout.write("\033[s")
    sys.stdout.flush()

    progress = round(value / len(content) * 100)
    bar = f"\033[95m{'━' * (progress / 100 * BAR_WIDTH)}"
    bar += f"\033[35m{'━' * (BAR_WIDTH - len(bar))}"
    print(f"  {bar}\033[0m ({progress}%)")

    sys.stdout.write("\033[u")
    sys.stdout.flush()


HOME = os.getenv("HOME")
BAR_WIDTH = 40
content = os.listdir("./")
ignore = [ ".git", "install.py" ]

print("El script modificará y sobreescrirá archivos para aplicar la configuración correctamente.")
if input("¿Desea continuar? (s/n): ") not in ('', 's', 'S'): exit()

print(f"\n\033[32m=>\033[0m Instalando configuración en \033[94{HOME}\033[0m ...\n")

for item in content:
    if item in ignore:
        content.remove(item)
        ignore.remove(item)

        if len(ignore) == 0: break

for i, item in enumerate(content):
    render_bar(i)

    src = "./" + item
    if path.isdir(src):
        src = "-r " + src

    result = subprocess.run(["cp", src, str(HOME)], capture_output=True, text=True)

    if result.returncode != 0:
        print("Ocurrió un error al instalar la configuración :(")
        print("\nError: " + result.stderr)
        exit()

print("\033[32 \033[0mconfiguración aplicada correctamente!")


    
