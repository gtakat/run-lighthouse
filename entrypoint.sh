#!/bin/sh

cd reports
npx lighthouse --chrome-flags='--no-sandbox --headless' $1
