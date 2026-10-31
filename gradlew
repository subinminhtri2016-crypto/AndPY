#!/usr/bin/env sh
set -eu
VERSION=8.9
TOOLS_DIR="${HOME}/.andpy-tools"
GRADLE_HOME="${TOOLS_DIR}/gradle-${VERSION}"
if [ -x "${GRADLE_HOME}/bin/gradle" ]; then
  exec "${GRADLE_HOME}/bin/gradle" "$@"
fi
if command -v gradle >/dev/null 2>&1; then
  exec gradle "$@"
fi
mkdir -p "${TOOLS_DIR}"
ZIP="${TOOLS_DIR}/gradle-${VERSION}-bin.zip"
echo "[AndPY] Downloading Gradle ${VERSION}..."
if command -v curl >/dev/null 2>&1; then
  curl -fL "https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip" -o "${ZIP}"
elif command -v wget >/dev/null 2>&1; then
  wget "https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip" -O "${ZIP}"
else
  echo "Install Gradle or curl/wget first." >&2
  exit 1
fi
unzip -q -o "${ZIP}" -d "${TOOLS_DIR}"
exec "${GRADLE_HOME}/bin/gradle" "$@"
