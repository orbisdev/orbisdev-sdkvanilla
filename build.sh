#/bin/bash
set -e

sh stage0-libgen.sh
sh stage1-headers.sh
sh stage2-makefiles.sh
