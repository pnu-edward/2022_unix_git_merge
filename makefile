
TARGET := calc
BUILD := build
src := $(wildcard *.c)
obj := $(src:%.c=$(BUILD)/%.o)

$(info $(src))
$(info $(obj))
$(info $(TARGET))


.PHONY: all build clean test

all: $(BUILD)/$(TARGET)

$(BUILD)/$(TARGET): $(obj)
	$(CC) $^ -o $@

$(obj): | $(BUILD)

$(BUILD):
	mkdir -p $(BUILD)

$(BUILD)/%.o: %.c
	$(CC) -c  $< -o $@

clean:
	rm -f *.o calc
	rm -rf build

define test_case
	if [ "$(shell echo '$(1)' | ./$(BUILD)/calc)" -eq $(2) ]; then \
		echo "PASS"; 				\
	else 						\
		echo "FAIL - Expected: $(2), Actual: $(shell echo '$(1)' | ./$(BUILD)/calc)";	 \
		exit 1; 				\
	fi;
endef

test: TC1_INP := + 1 2
test: TC1_OUT := 3
test: TC2_INP := + 2000000000 2000000000
test: TC2_OUT := 4000000000

test:
	@$(call test_case,$(TC1_INP),$(TC1_OUT))
	@$(call test_case,$(TC2_INP),$(TC2_OUT))

