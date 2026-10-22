OBJECTS = ./build/compile.o ./build/cprocess.o
INCLUDES = -I./

all: main.exe

./build/compile.o: ./compiler.c
	gcc compiler.c -o ./build/compile.o -c $(INCLUDES) -g

./build/cprocess.o: ./cprocess.c
	gcc cprocess.c -o ./build/cprocess.o -c $(INCLUDES) -g

main.exe: main.c $(OBJECTS)
	gcc main.c $(OBJECTS) $(INCLUDES) -g -o ./main.exe

clean:
	powershell.exe -NoProfile -Command "Remove-Item './main.exe' -Force -ErrorAction SilentlyContinue; exit 0"
	powershell.exe -NoProfile -Command "Remove-Item './main' -Force -ErrorAction SilentlyContinue; exit 0"