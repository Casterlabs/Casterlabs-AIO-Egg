# Default the TZ environment variable to UTC.
TZ=${TZ:-UTC}
export TZ

# Provide the ip address of the container to the end-user.
export IP_ADDR=$(hostname -I | awk '{print $1}')
echo -e "\033[1m\033[33mcontainer@pterodactyl~\033[0m Container IP: $IP_ADDR"

# Versions
export GO_VERSION=$(go version | grep -oP '([0-9]+\.[0-9]+\.[0-9]+)')
export JAVA_VERSION=$(java -version 2>&1 | grep -oP -m 1 '([0-9]+\.[0-9]+\.[0-9]+_[0-9]+[^-a-z0-9"]?)')
export NODE_VERSION=$(node -v)

echo -e "\033[1m\033[33mcontainer@pterodactyl~\033[0m Go Version:   $GO_VERSION"
echo -e "\033[1m\033[33mcontainer@pterodactyl~\033[0m Java Version: $JAVA_VERSION"
echo -e "\033[1m\033[33mcontainer@pterodactyl~\033[0m Node Version: $NODE_VERSION"

# Switch to the container's working directory
cd /home/container || exit 1

# Convert all of the "{{VARIABLE}}" parts of the command into the expected shell
# variable format of "${VARIABLE}" before evaluating the string and automatically
# replacing the values.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

echo -e "\033[1m\033[33mcontainer@pterodactyl~\033[0m Executing: $PARSED"
# shellcheck disable=SC2086
exec env ${PARSED}