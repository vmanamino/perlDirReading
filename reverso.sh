#!/bin/sh
perl -pi -e 's/\A([A-Z])([A-Z])/$2$1/' ./*.txt
