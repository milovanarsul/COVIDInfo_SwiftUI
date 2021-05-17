#!/bin/sh
#
# Prepare the static framework structure.
#

prepare_framework() {
	# Create headers dir if necessary.
	if [ ! -d "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Versions/A/Headers" ]; then
		mkdir -p "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Versions/A/Headers"
	fi

	# Link the "Current" version to "A"
	ln -sfh A "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Versions/Current"
	ln -sfh Versions/Current/Headers "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Headers"
	ln -sfh "Versions/Current/${PRODUCT_NAME}" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/${PRODUCT_NAME}"

	# The -a ensures that the headers maintain the source modification date so that we don't constantly
	# cause propagating rebuilds of files that import these headers.
	cp -a "${BUILT_PRODUCTS_DIR}/${PUBLIC_HEADERS_FOLDER_PATH}/" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.framework/Versions/A/Headers"
}

main() {
	# Fail on all errors.
	set -e
	set -o pipefail

	# Debugging
	set -x

	echo "Preparing framework structure..."
	prepare_framework
}

main "$@"