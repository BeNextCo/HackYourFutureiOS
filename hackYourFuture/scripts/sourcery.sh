#!/bin/sh

BASE_DIRECTORY="hackYourFuture"

mkdir -p ${BASE_DIRECTORY}Tests/Generated/

${PODS_ROOT}/Sourcery/bin/sourcery \
	--sources $BASE_DIRECTORY \
	--templates ${SRCROOT}/SourceryTemplates/AutoMockable.stencil \
	--output ${BASE_DIRECTORY}Tests/Generated/Mocks.swift \
	--args module=$BASE_DIRECTORY