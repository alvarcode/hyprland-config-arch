#!/usr/bin/env python
import argparse
import os


def close(msg: str):
    print(msg)
    exit()

def main():
    parser = argparse.ArgumentParser(description="A basic HTML structure generator")
    parser.add_argument("--filename", type=str, help="The filename (path) to write")

    args = parser.parse_args()

    if not os.path.exists(args.filename):
        close(f"The file '{args.filename}' not exist")
    if args.filename[len(args.filename) - 5:] != '.html':
        close(f"The file '{args.filename}' is not an HTML file")

    with open(os.getenv("HOME") + '/.config/scripts/templates/basic-struct.html', 'r') as f:
        temp = f.read()

    msg = "󰗠 Template successfully applied"
    try:
        with open(args.filename, 'w') as target_f:
            target_f.write(temp)
    except Exception:
        msg = "An error ocurred while applying the template"
    finally:
        print(msg)


if __name__ == "__main__":
    main()
