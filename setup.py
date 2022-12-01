# Copyright 2020-2022 Laurent Cabaret
# Copyright 2020-2022 Vincent Jacques

# https://packaging.python.org/en/latest/

import setuptools


version = "0.0.1"

setuptools.setup(
    name="Chrones",
    version=version,
    install_requires=open("requirements.txt").readlines(),
    entry_points={
        "console_scripts": [
            "chrones = Chrones.command_line_interface:main",
        ],
    },
)
