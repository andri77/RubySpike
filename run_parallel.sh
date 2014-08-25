#!/bin/sh
parallel_cucumber features -n 6 -o "--tags @regres
sion --t ~@wip TEST_ENV=stage BROWSER=chrome -p parallel"