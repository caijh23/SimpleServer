DIR_BIN = .
DIR_OBJ = ./httpServer/obj
DIR_SRC = ./httpServer/src
DIR_INC = ./httpServer/include

SRC = $(wildcard $(DIR_SRC)/*.cpp)
OBJ = $(patsubst %.cpp,$(DIR_OBJ)/%.o,$(notdir ${SRC}))


CXX_FLAG = -g -Wall -std=c++11 -pthread
CC = g++

TARGET = httpserver

$(DIR_BIN)/$(TARGET) : $(OBJ)
	$(CC) $(CXX_FLAG) ${OBJ} -o $@

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.cpp
	if [ ! -d $(DIR_OBJ) ];	then mkdir -p $(DIR_OBJ); fi;
	$(CC) $(CXX_FLAG) -I${DIR_INC} -c $< -o $@

.PHONY : clean
clean : 
	-rm -rf $(DIR_OBJ)
	-rm -rf ${DIR_BIN}/${TARGET}