# 注意此cmake文件中的3个变量名
# HELLO_INCLUDE_DIR -- <name>_INCLUDE_DIR
# HELLO_LIBRARY     -- <name>_LIBRARY
# HELLO_FOUND       -- <name>_FOUND
# 惯例需要定义这3个变量，命名规则如上，以便与cmake预定义的cmake模块中的变量名统一

# FIND_PATH和FIND_LIBARY的path部分，一定要是.h文件和lib文件所在的当前目录，否则找不到
FIND_PATH(HELLO_INCLUDE_DIR hello.h /home/yqh/icode/demo/cmake/t3/lib_hello)
MESSAGE(STATUS "HELLO_INCLUDE_DIR: " ${HELLO_INCLUDE_DIR})

FIND_LIBRARY(HELLO_LIBRARY hello /home/yqh/icode/demo/cmake/t3/build/lib)
MESSAGE(STATUS "HELLO_LIBRARY: " ${HELLO_LIBRARY})


IF (HELLO_INCLUDE_DIR AND HELLO_LIBRARY)
    SET(HELLO_FOUND TRUE)
ENDIF(HELLO_INCLUDE_DIR AND HELLO_LIBRARY)

IF (HELLO_FOUND)
    # 若FIND_PACKAGE命令没有指定QUIET参数，那下面的IF语句就为真
    IF (NOT HELLO_FIND_QUIETLY)
        MESSAGE(STATUS "Found Hello: ${HELLO_LIBRARY}")
    ENDIF (NOT HELLO_FIND_QUIETLY)
ELSE (HELLO FOUND)
    # 如果FIND_PACKAGE命令指定了REQUIRED参数，说明这个库是此Project必须的
    # 对应下面的HELLO_FIND_REQUIRED变量
    IF (HELLO_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find hello library")
    ENDIF (HELLO_FIND_REQUIRED)
ENDIF (HELLO_FOUND)

