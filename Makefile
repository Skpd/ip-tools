INSTALL_PREFIX  =   /usr
INSTALL_HEADERS =   ${INSTALL_PREFIX}/include
INSTALL_LIB     =   ${INSTALL_PREFIX}/lib

RESULT          =   ip-tools.so

COMPILER        =   g++
LINKER          =   g++

COMPILER_FLAGS  =   -Wall -c -I. -std=c++11 -fpic -o

LINKER_FLAGS    =   -shared
LINKER_DEPS     =   -lip -lphpcpp

RM              =   rm -f
CP              =   cp -f
MKDIR           =   mkdir -p

SOURCES         =   $(wildcard ip-tools/*.cpp)

OBJECTS         =   $(SOURCES:%.cpp=%.o)

all: ${OBJECTS} ${RESULT}

${RESULT}: ${OBJECTS}
	${LINKER} ${LINKER_FLAGS} -o $@ ${OBJECTS} ${LINKER_DEPS}

clean:
	${RM} ${OBJECTS} ${RESULT}

${OBJECTS}: 
	${COMPILER} ${COMPILER_FLAGS} $@ ${@:%.o=%.cpp}

install:
#	${MKDIR} ${INSTALL_HEADERS}/ip
#	${CP} Ip/*.h ${INSTALL_HEADERS}/ip
#	${CP} ${RESULT} ${INSTALL_LIB}

