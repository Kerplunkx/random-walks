EXE := walker

build:
	odin build src/ -out:$(EXE)

run: build
	./$(EXE)
