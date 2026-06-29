include("${UTILS}")

get_build_platform(APP_PLATFORM_NAME)

set(APP_VERSION_YEAR ${BUILD_VERSION_YEAR})
set(APP_VERSION_NUMBER ${BUILD_VERSION_NUMBER})
set(APP_VERSION_STR "${APP_VERSION_YEAR}.${APP_VERSION_NUMBER}")
set(GIT_DESCRIBE "${APP_VERSION_STR}")
set(APP_PLATFORM_NAME "${BUILD_PLATFORM_NAME}")

# Generate to a temporary file first
set(TEMP_FILE "${DST}.tmp")
configure_file("${SRC}" "${TEMP_FILE}" @ONLY)

# Copy only if contents differ (avoids unnecessary timestamp changes)
file(COPY_FILE "${TEMP_FILE}" "${DST}" ONLY_IF_DIFFERENT)
file(REMOVE "${TEMP_FILE}")
