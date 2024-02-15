CC = g++

CFLAGS = -Wall -Wextra -std=c++11 -static

SRCDIRS := $(shell find . -type d)

SRCS := $(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.cpp))

OBJS := $(SRCS:.cpp=.o)

TARGET = myprogram

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
