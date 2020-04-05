set -eu

if !(type "fish" > /dev/null 2>&1); then
    echo "This setup script will only work with \"fish\" shell."
    echo "If you don't have \"fish\", please install it and run it. https://fishshell.com/"
    exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)
fish $SCRIPT_DIR/_setup_fish.fish
