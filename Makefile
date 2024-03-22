CC=g++
CFLAGS=-Wall -Werror -Wextra

BUILD_DIR=build

SRC=$(wildcard *.cpp)
OBJ=$(addprefix $(BUILD_DIR)/,$(SRC:%.cpp=%.o))
TARGET=test.exe

ifeq ($(wildcard $(BUILD_DIR)), )
  $(shell mkdir $(BUILD_DIR))
endif


all:$(TARGET)

TARGET:	$(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(BUILD_DIR)/$(TARGET)

OBJ:
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJ)

clean_obj:
	cd $(BUILD_DIR) && rm -rf *.o *.a *.exe *.so

clean_gcov:
	cd $(BUILD_DIR) && rm -rf *.gcno *.gcda

clean: clean_obj clean_gcov