# Define the compiler
CC = gcc

# Define compiler flags
CFLAGS = -Wall $(shell pkg-config --cflags dconf)

# Define linker flags
LDFLAGS = $(shell pkg-config --libs dconf)

# Define the target executable
TARGET = gnome-zoomer

# Define the installation directory
PREFIX = /usr/local/bin

# Define source files
SRCS = gnome-zoomer.c

# Define object files (corresponding to source files)
OBJS = $(SRCS:.c=.o)

# Default rule to build the target
all: $(TARGET)

# Rule to build the target executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(TARGET)

# Rule to build object files from source files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to install the binary to /usr/local/bin
install: $(TARGET)
	sudo cp $(TARGET) $(PREFIX)
	sudo chmod 755 $(PREFIX)/$(TARGET)

# Rule to clean up generated files
clean:
	rm -f $(TARGET) $(OBJS)

# Phony targets are not actual files
.PHONY: all clean
