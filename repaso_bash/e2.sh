#!/bin/bash

fichero=$"/home/admin01/Escritorio/e2"
touch "$fichero"
ls /etc > "$fichero"
cat "$fichero"
