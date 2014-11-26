
macro(parse_argument_list PREFIX KEYWORDS ARGUMENTS)
	# Indirection over KEYWORD_LIST necessary because macro parameters are no real variables.

	set(KEYWORD_LIST "${KEYWORDS}")
	set(CURRENT_KEYWORD "")

	# Parse argument list
	foreach(ARG ${ARGUMENTS})
		# See if current argument is in the list of keywords
		list(FIND KEYWORD_LIST "${ARG}" KEYWORD_FOUND)
		if(NOT KEYWORD_FOUND EQUAL -1)
			# If current element is a keyword, store it
			set(CURRENT_KEYWORD ${ARG})
		else()
			# Append current argument to last stored keyword variable
			set(${PREFIX}_${CURRENT_KEYWORD} ${${PREFIX}_${CURRENT_KEYWORD}};${ARG})
		endif()
	endforeach()
endmacro()

macro(build_exe MODULE_NAME)

	parse_argument_list("MODULE" "SOURCES;HEADERS;LIBS;FORMS" "${ARGN}")

	project(${MODULE_NAME})
	set(MODULE_DIR "${PROJECT_SOURCE_DIR}")

	if(EXISTS "${MODULE_DIR}/config.h.in")
		configure_file ("${MODULE_DIR}/config.h.in"	"${PROJECT_BINARY_DIR}/config.h")
	endif()

	message( STATUS " module dir -> ${MODULE_DIR}")


	include_directories("${PROJECT_BINARY_DIR}")


	if(MODULE_FORMS)
		string(REPLACE " " ";" ${MODULE_FORMS} ${MODULE_FORMS})
		foreach(FORM ${MODULE_FORMS})
			qt5_wrap_ui(UI_HEADERS ${MODULE_DIR}/ui_forms/${FORM})
		endforeach()
	endif()


	add_executable(${PROJECT_NAME}  ${MODULE_SOURCES} ${MODULE_HEADERS} ${UI_HEADERS})
	set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${MODULE_NAME})
	target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::WebSockets )

	if(MODULE_LIBS)
		string(REPLACE " " ";" ${MODULE_LIBS} ${MODULE_LIBS})
		foreach(LIB ${MODULE_LIBS})
			include_directories("../${LIB}")
			target_link_libraries(${PROJECT_NAME} "${LIB}")
		endforeach()
	endif()


endmacro()

macro(build_lib MODULE_NAME)

	parse_argument_list("MODULE" "SOURCES;HEADERS;LIBS" "${ARGN}")

	project(${MODULE_NAME})
	set(MODULE_DIR "${PROJECT_SOURCE_DIR}")


	if(EXISTS "${MODULE_DIR}/libconfig.h.in")
		configure_file ("${MODULE_DIR}/libconfig.h.in"	"${PROJECT_BINARY_DIR}/libconfig.h")
	endif()

	include_directories("${PROJECT_BINARY_DIR}")

	add_library(${PROJECT_NAME}  ${MODULE_SOURCES} ${MODULE_HEADERS})
	set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${MODULE_NAME})
	target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::WebSockets )

	if(MODULE_LIBS)

		string(REPLACE " " ";" MODULE_LIBS ${MODULE_LIBS})

		foreach(LIB ${MODULE_LIBS})
			include_directories("../${LIB}")
			target_link_libraries(${PROJECT_NAME} "${LIB}")
		endforeach()

	endif()

endmacro()
