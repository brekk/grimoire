BUILD_DIR := ./build
EXEC := grimoire

$(BUILD_DIR)/$(EXEC):
	mkdir -p $(dir $@)
	echo "compiling! - grimoire"
	madlib compile -i src/Cli.main.mad -t llvm -o $@
	echo "built! - grimoire"

README.md: madlib.json
	pilcrow -i README.md --repo brekk/grimoire --auto

version.lock:
	madlib install

.PHONY: clean
clean:
	rm -r $(BUILD_DIR)
